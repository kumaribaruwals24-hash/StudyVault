using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace STUDYVAULT
{
    public partial class Users : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // =====================================================
            // ADMIN SECURITY CHECK
            // =====================================================

            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }


            // =====================================================
            // FIRST LOAD
            // =====================================================

            if (!IsPostBack)
            {
                BindUsers("");
            }
        }


        // =========================================================
        // LOAD STUDENTS
        // =========================================================

        private void BindUsers(string search)
        {
            List<object> users = new List<object>();

            try
            {
                using (SqlConnection con =
                    DatabaseHelper.GetConnection())
                {
                    /*
                     * Your database uses:
                     *
                     * Admin = administrator
                     * User  = student
                     *
                     * We exclude Admin so the admin account
                     * cannot appear on this page.
                     *
                     * This also allows old accounts that may
                     * have Role = Student to appear.
                     */

                    string query = @"
                        SELECT
                            UserID,
                            FullName,
                            Email,
                            Role,
                            Status
                        FROM Users
                        WHERE ISNULL(Role, '') <> 'Admin'";


                    // Search
                    if (!string.IsNullOrWhiteSpace(search))
                    {
                        query += @"
                            AND
                            (
                                FullName LIKE @Search
                                OR Email LIKE @Search
                            )";
                    }


                    // Newest accounts first
                    query += @"
                        ORDER BY UserID DESC";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        if (!string.IsNullOrWhiteSpace(search))
                        {
                            cmd.Parameters.Add(
                                "@Search",
                                SqlDbType.NVarChar,
                                300
                            ).Value =
                                "%" + search.Trim() + "%";
                        }


                        con.Open();


                        using (SqlDataReader reader =
                            cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                users.Add(new
                                {
                                    UserID =
                                        Convert.ToInt32(
                                            reader["UserID"]
                                        ),

                                    FullName =
                                        Convert.ToString(
                                            reader["FullName"]
                                        ),

                                    Email =
                                        Convert.ToString(
                                            reader["Email"]
                                        ),

                                    Role =
                                        Convert.ToString(
                                            reader["Role"]
                                        ),

                                    Status =
                                        Convert.ToString(
                                            reader["Status"]
                                        )
                                });
                            }
                        }
                    }
                }


                // Bind to page
                rptUsers.DataSource = users;
                rptUsers.DataBind();


                // Show empty message if necessary
                pnlNoUsers.Visible =
                    users.Count == 0;
            }
            catch (Exception ex)
            {
                rptUsers.DataSource = null;
                rptUsers.DataBind();

                pnlNoUsers.Visible = true;

                ShowError(
                    "Unable to load students: " +
                    ex.Message
                );
            }
        }


        // =========================================================
        // SEARCH
        // =========================================================

        protected void btnSearch_Click(
            object sender,
            EventArgs e)
        {
            BindUsers(
                txtSearch.Text.Trim()
            );
        }


        // =========================================================
        // REPEATER COMMAND
        // =========================================================

        protected void rptUsers_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            int userId;


            if (!int.TryParse(
                Convert.ToString(e.CommandArgument),
                out userId))
            {
                ShowError(
                    "Invalid student selected."
                );

                return;
            }


            // =====================================================
            // SAVE
            // =====================================================

            if (e.CommandName == "Save")
            {
                UpdateStudent(e, userId);
            }


            // =====================================================
            // STATUS
            // =====================================================

            else if (e.CommandName == "ToggleStatus")
            {
                ToggleStatus(userId);
            }


            // =====================================================
            // DELETE
            // =====================================================

            else if (e.CommandName == "DeleteStudent")
            {
                DeleteStudent(userId);
            }


            // Reload the table after operation
            BindUsers(txtSearch.Text.Trim());
        }


        // =========================================================
        // UPDATE STUDENT
        // =========================================================

        private void UpdateStudent(
            RepeaterCommandEventArgs e,
            int userId)
        {
            TextBox txtName =
                e.Item.FindControl("txtEditName")
                as TextBox;

            TextBox txtEmail =
                e.Item.FindControl("txtEditEmail")
                as TextBox;


            if (txtName == null ||
                txtEmail == null)
            {
                ShowError(
                    "Student fields could not be found."
                );

                return;
            }


            string fullName =
                txtName.Text.Trim();

            string email =
                txtEmail.Text.Trim();


            // Validation
            if (string.IsNullOrWhiteSpace(fullName))
            {
                ShowError(
                    "Name cannot be empty."
                );

                return;
            }


            if (string.IsNullOrWhiteSpace(email))
            {
                ShowError(
                    "Email cannot be empty."
                );

                return;
            }


            if (!email.Contains("@"))
            {
                ShowError(
                    "Please enter a valid email."
                );

                return;
            }


            try
            {
                using (SqlConnection con =
                    DatabaseHelper.GetConnection())
                {
                    string query = @"
                        UPDATE Users

                        SET
                            FullName = @FullName,
                            Email = @Email

                        WHERE
                            UserID = @UserID
                            AND ISNULL(Role, '') <> 'Admin'";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@FullName",
                            SqlDbType.NVarChar,
                            200
                        ).Value = fullName;


                        cmd.Parameters.Add(
                            "@Email",
                            SqlDbType.NVarChar,
                            300
                        ).Value = email;


                        cmd.Parameters.Add(
                            "@UserID",
                            SqlDbType.Int
                        ).Value = userId;


                        con.Open();


                        int result =
                            cmd.ExecuteNonQuery();


                        if (result == 0)
                        {
                            ShowError(
                                "Student was not found."
                            );

                            return;
                        }
                    }
                }


                ShowSuccess(
                    "Student updated successfully."
                );
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2601 ||
                    ex.Number == 2627)
                {
                    ShowError(
                        "That email is already being used."
                    );
                }
                else
                {
                    ShowError(
                        "Unable to update student: " +
                        ex.Message
                    );
                }
            }
            catch (Exception ex)
            {
                ShowError(
                    "Unable to update student: " +
                    ex.Message
                );
            }
        }


        // =========================================================
        // ACTIVATE / DEACTIVATE
        // =========================================================

        private void ToggleStatus(int userId)
        {
            try
            {
                using (SqlConnection con =
                    DatabaseHelper.GetConnection())
                {
                    con.Open();


                    string currentStatus;


                    // Get current status
                    using (SqlCommand getCmd =
                        new SqlCommand(@"
                            SELECT Status
                            FROM Users
                            WHERE
                                UserID = @UserID
                                AND ISNULL(Role, '') <> 'Admin'",
                            con))
                    {
                        getCmd.Parameters.Add(
                            "@UserID",
                            SqlDbType.Int
                        ).Value = userId;


                        object result =
                            getCmd.ExecuteScalar();


                        if (result == null)
                        {
                            ShowError(
                                "Student was not found."
                            );

                            return;
                        }


                        currentStatus =
                            Convert.ToString(result);
                    }


                    // Determine new status
                    string newStatus;


                    if (currentStatus.Equals(
                        "Active",
                        StringComparison.OrdinalIgnoreCase))
                    {
                        newStatus = "Inactive";
                    }
                    else
                    {
                        newStatus = "Active";
                    }


                    // Update
                    using (SqlCommand updateCmd =
                        new SqlCommand(@"
                            UPDATE Users
                            SET Status = @Status
                            WHERE
                                UserID = @UserID
                                AND ISNULL(Role, '') <> 'Admin'",
                            con))
                    {
                        updateCmd.Parameters.Add(
                            "@Status",
                            SqlDbType.NVarChar,
                            50
                        ).Value = newStatus;


                        updateCmd.Parameters.Add(
                            "@UserID",
                            SqlDbType.Int
                        ).Value = userId;


                        int result =
                            updateCmd.ExecuteNonQuery();


                        if (result == 0)
                        {
                            ShowError(
                                "Unable to change student status."
                            );

                            return;
                        }
                    }


                    ShowSuccess(
                        "Student status changed to " +
                        newStatus +
                        "."
                    );
                }
            }
            catch (Exception ex)
            {
                ShowError(
                    "Unable to change status: " +
                    ex.Message
                );
            }
        }


        // =========================================================
        // DELETE STUDENT
        // =========================================================

        private void DeleteStudent(int userId)
        {
            try
            {
                using (SqlConnection con =
                    DatabaseHelper.GetConnection())
                {
                    string query = @"
                        DELETE FROM Users

                        WHERE
                            UserID = @UserID
                            AND ISNULL(Role, '') <> 'Admin'";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@UserID",
                            SqlDbType.Int
                        ).Value = userId;


                        con.Open();


                        int result =
                            cmd.ExecuteNonQuery();


                        if (result == 0)
                        {
                            ShowError(
                                "Student was not found."
                            );

                            return;
                        }
                    }
                }


                ShowSuccess(
                    "Student deleted successfully."
                );
            }
            catch (SqlException ex)
            {
                /*
                 * If another table references this UserID,
                 * SQL Server may prevent deletion.
                 */

                ShowError(
                    "This student cannot be deleted because " +
                    "other records are linked to this account. " +
                    "You can deactivate the account instead."
                );
            }
            catch (Exception ex)
            {
                ShowError(
                    "Unable to delete student: " +
                    ex.Message
                );
            }
        }


        // =========================================================
        // SUCCESS MESSAGE
        // =========================================================

        private void ShowSuccess(string message)
        {
            lblConfirmationText.Text =
                message;

            pnlConfirmation.Visible = true;

            pnlError.Visible = false;
        }


        // =========================================================
        // ERROR MESSAGE
        // =========================================================

        private void ShowError(string message)
        {
            lblError.Text =
                message;

            pnlError.Visible = true;

            pnlConfirmation.Visible = false;
        }


        // =========================================================
        // LOGOUT
        // =========================================================

        protected void btnLogout_Click(
            object sender,
            EventArgs e)
        {
            Session.Clear();

            Session.Abandon();

            Response.Redirect(
                "~/Login.aspx"
            );
        }
    }
}