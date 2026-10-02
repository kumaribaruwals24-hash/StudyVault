using System;
using System.Data;
using System.Data.SqlClient;

namespace STUDYVAULT
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(
            object sender,
            EventArgs e)
        {
            string fullName =
                txtFullName.Text.Trim();

            string email =
                txtEmail.Text.Trim();

            string password =
                txtPassword.Text;


            // =====================================================
            // VALIDATION
            // =====================================================

            if (string.IsNullOrWhiteSpace(fullName))
            {
                ShowMessage(
                    "Please enter your full name.",
                    System.Drawing.Color.Red
                );

                return;
            }


            if (string.IsNullOrWhiteSpace(email))
            {
                ShowMessage(
                    "Please enter your email.",
                    System.Drawing.Color.Red
                );

                return;
            }


            if (!email.Contains("@") ||
                !email.Contains("."))
            {
                ShowMessage(
                    "Please enter a valid email address.",
                    System.Drawing.Color.Red
                );

                return;
            }


            if (string.IsNullOrWhiteSpace(password))
            {
                ShowMessage(
                    "Please enter a password.",
                    System.Drawing.Color.Red
                );

                return;
            }


            if (password.Length < 6)
            {
                ShowMessage(
                    "Password must be at least 6 characters.",
                    System.Drawing.Color.Red
                );

                return;
            }


            try
            {
                using (SqlConnection con =
                    DatabaseHelper.GetConnection())
                {
                    con.Open();


                    // =================================================
                    // CHECK EXISTING EMAIL
                    // =================================================

                    string checkQuery = @"
                        SELECT COUNT(*)
                        FROM Users
                        WHERE Email = @Email";


                    using (SqlCommand checkCmd =
                        new SqlCommand(
                            checkQuery,
                            con))
                    {
                        checkCmd.Parameters.Add(
                            "@Email",
                            SqlDbType.NVarChar,
                            300
                        ).Value = email;


                        int count =
                            Convert.ToInt32(
                                checkCmd.ExecuteScalar()
                            );


                        if (count > 0)
                        {
                            ShowMessage(
                                "An account with this email already exists.",
                                System.Drawing.Color.Red
                            );

                            return;
                        }
                    }


                    // =================================================
                    // HASH PASSWORD
                    // =================================================

                    string hashedPassword =
                        BCrypt.Net.BCrypt.HashPassword(
                            password
                        );


                    // =================================================
                    // INSERT STUDENT
                    // =================================================

                    string query = @"
                        INSERT INTO Users
                        (
                            FullName,
                            Email,
                            Password,
                            Role,
                            Status
                        )

                        VALUES
                        (
                            @FullName,
                            @Email,
                            @Password,
                            @Role,
                            @Status
                        )";


                    using (SqlCommand cmd =
                        new SqlCommand(
                            query,
                            con))
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
                            "@Password",
                            SqlDbType.NVarChar,
                            500
                        ).Value =
                            hashedPassword;


                        /*
                         * IMPORTANT:
                         *
                         * Your database uses:
                         *
                         * Admin = administrator
                         * User  = student
                         *
                         * Therefore new students MUST be
                         * inserted as "User".
                         */

                        cmd.Parameters.Add(
                            "@Role",
                            SqlDbType.NVarChar,
                            50
                        ).Value = "User";


                        /*
                         * New accounts are active.
                         */

                        cmd.Parameters.Add(
                            "@Status",
                            SqlDbType.NVarChar,
                            50
                        ).Value = "Active";


                        int result =
                            cmd.ExecuteNonQuery();


                        if (result > 0)
                        {
                            ShowMessage(
                                "Registration successful! You can now sign in.",
                                System.Drawing.Color.Green
                            );


                            // Clear fields
                            txtFullName.Text = "";
                            txtEmail.Text = "";
                            txtPassword.Text = "";
                        }
                        else
                        {
                            ShowMessage(
                                "Registration failed. Please try again.",
                                System.Drawing.Color.Red
                            );
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2601 ||
                    ex.Number == 2627)
                {
                    ShowMessage(
                        "An account with this email already exists.",
                        System.Drawing.Color.Red
                    );
                }
                else
                {
                    ShowMessage(
                        "Database error: " +
                        ex.Message,
                        System.Drawing.Color.Red
                    );
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "An error occurred: " +
                    ex.Message,
                    System.Drawing.Color.Red
                );
            }
        }


        // =========================================================
        // MESSAGE
        // =========================================================

        private void ShowMessage(
            string message,
            System.Drawing.Color color)
        {
            lblMessage.Text =
                message;

            lblMessage.ForeColor =
                color;
        }
    }
}