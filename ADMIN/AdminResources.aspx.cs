using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace STUDYVAULT
{
    public partial class AdminResources : Page
    {
        private const string ResourceStoragePath = "~/App_Data/Resources";

        private string ConnectionString
        {
            get
            {
                return ConfigurationManager
                    .ConnectionStrings["StudyVaultConnection"]
                    .ConnectionString;
            }
        }

        // =====================================================
        // PAGE LOAD
        // =====================================================

        protected void Page_Load(object sender, EventArgs e)
        {
            // Admin security
            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindResources();
            }
        }

        // =====================================================
        // READ - LOAD ALL RESOURCES
        // =====================================================

        private void BindResources()
        {
            DataTable dt = new DataTable();

            string query = @"
                SELECT
                    ResourceID,
                    Title,
                    Description,
                    FilePath,
                    CategoryID,
                    UploadDate
                FROM Resources
                ORDER BY UploadDate DESC, ResourceID DESC";

            using (SqlConnection con =
                   new SqlConnection(ConnectionString))
            {
                using (SqlCommand cmd =
                       new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da =
                           new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            rptResources.DataSource = dt;
            rptResources.DataBind();

            pnlNoResources.Visible = dt.Rows.Count == 0;
        }

        // =====================================================
        // CREATE - ADD RESOURCE
        // =====================================================

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            pnlError.Visible = false;
            pnlConfirmation.Visible = false;

            // -----------------------------------------------
            // Validate title
            // -----------------------------------------------

            if (string.IsNullOrWhiteSpace(txtTitle.Text))
            {
                ShowError("Please enter a title.");
                return;
            }

            string filePath = null;

            // -----------------------------------------------
            // Upload file
            // -----------------------------------------------

            if (fileUpload.HasFile)
            {
                try
                {
                    string folderPath =
                        Server.MapPath(ResourceStoragePath);

                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string originalName =
                        Path.GetFileName(fileUpload.FileName);

                    string storedName =
                        Guid.NewGuid().ToString("N")
                        + "_"
                        + originalName;

                    string physicalPath =
                        Path.Combine(folderPath, storedName);

                    fileUpload.SaveAs(physicalPath);

                    filePath =
                        ResourceStoragePath
                        + "/"
                        + storedName;
                }
                catch
                {
                    ShowError(
                        "The file could not be uploaded."
                    );

                    return;
                }
            }

            // -----------------------------------------------
            // Category
            // -----------------------------------------------

            int? categoryID = null;

            if (!string.IsNullOrWhiteSpace(
                ddlCategory.SelectedValue))
            {
                int parsedCategory;

                if (int.TryParse(
                    ddlCategory.SelectedValue,
                    out parsedCategory))
                {
                    categoryID = parsedCategory;
                }
            }

            // -----------------------------------------------
            // INSERT INTO DATABASE
            // -----------------------------------------------

            string query = @"
                INSERT INTO Resources
                (
                    Title,
                    Description,
                    FilePath,
                    CategoryID,
                    UploadDate
                )
                VALUES
                (
                    @Title,
                    @Description,
                    @FilePath,
                    @CategoryID,
                    @UploadDate
                )";

            try
            {
                using (SqlConnection con =
                       new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd =
                           new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@Title",
                            SqlDbType.VarChar,
                            200
                        ).Value =
                            txtTitle.Text.Trim();

                        cmd.Parameters.Add(
                            "@Description",
                            SqlDbType.VarChar,
                            -1
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                txtDescription.Text)
                            ? (object)DBNull.Value
                            : txtDescription.Text.Trim();

                        cmd.Parameters.Add(
                            "@FilePath",
                            SqlDbType.VarChar,
                            255
                        ).Value =
                            string.IsNullOrWhiteSpace(filePath)
                            ? (object)DBNull.Value
                            : filePath;

                        cmd.Parameters.Add(
                            "@CategoryID",
                            SqlDbType.Int
                        ).Value =
                            categoryID.HasValue
                            ? (object)categoryID.Value
                            : DBNull.Value;

                        cmd.Parameters.Add(
                            "@UploadDate",
                            SqlDbType.Date
                        ).Value =
                            DateTime.Today;

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                ShowSuccess(
                    "Resource added successfully."
                );

                // Clear form
                txtTitle.Text = "";
                txtDescription.Text = "";

                if (ddlCategory.Items.Count > 0)
                {
                    ddlCategory.SelectedIndex = 0;
                }

                // Refresh list
                BindResources();
            }
            catch (Exception ex)
            {
                ShowError(
                    "Resource could not be added. "
                    + ex.Message
                );
            }
        }

        // =====================================================
        // UPDATE / DELETE
        // =====================================================

        protected void rptResources_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            int resourceID;

            if (!int.TryParse(
                Convert.ToString(e.CommandArgument),
                out resourceID))
            {
                ShowError("Invalid resource selected.");
                return;
            }

            // =================================================
            // UPDATE
            // =================================================

            if (e.CommandName == "Save")
            {
                TextBox txtEditTitle =
                    e.Item.FindControl(
                        "txtEditTitle"
                    ) as TextBox;

                TextBox txtEditDescription =
                    e.Item.FindControl(
                        "txtEditDescription"
                    ) as TextBox;

                DropDownList ddlEditCategory =
                    e.Item.FindControl(
                        "ddlEditCategory"
                    ) as DropDownList;

                if (txtEditTitle == null ||
                    txtEditDescription == null ||
                    ddlEditCategory == null)
                {
                    ShowError(
                        "Could not find the edit controls."
                    );

                    return;
                }

                if (string.IsNullOrWhiteSpace(
                    txtEditTitle.Text))
                {
                    ShowError(
                        "Title cannot be empty."
                    );

                    return;
                }

                int? categoryID = null;

                int parsedCategory;

                if (int.TryParse(
                    ddlEditCategory.SelectedValue,
                    out parsedCategory))
                {
                    categoryID = parsedCategory;
                }

                string query = @"
                    UPDATE Resources
                    SET
                        Title = @Title,
                        Description = @Description,
                        CategoryID = @CategoryID
                    WHERE ResourceID = @ResourceID";

                try
                {
                    using (SqlConnection con =
                           new SqlConnection(
                               ConnectionString))
                    {
                        using (SqlCommand cmd =
                               new SqlCommand(
                                   query,
                                   con))
                        {
                            cmd.Parameters.Add(
                                "@Title",
                                SqlDbType.VarChar,
                                200
                            ).Value =
                                txtEditTitle.Text.Trim();

                            cmd.Parameters.Add(
                                "@Description",
                                SqlDbType.VarChar,
                                -1
                            ).Value =
                                string.IsNullOrWhiteSpace(
                                    txtEditDescription.Text)
                                ? (object)DBNull.Value
                                : txtEditDescription.Text.Trim();

                            cmd.Parameters.Add(
                                "@CategoryID",
                                SqlDbType.Int
                            ).Value =
                                categoryID.HasValue
                                ? (object)categoryID.Value
                                : DBNull.Value;

                            cmd.Parameters.Add(
                                "@ResourceID",
                                SqlDbType.Int
                            ).Value =
                                resourceID;

                            con.Open();

                            int rows =
                                cmd.ExecuteNonQuery();

                            if (rows == 0)
                            {
                                ShowError(
                                    "Resource not found."
                                );

                                BindResources();
                                return;
                            }
                        }
                    }

                    ShowSuccess(
                        "Resource updated successfully."
                    );
                }
                catch (Exception ex)
                {
                    ShowError(
                        "Resource could not be updated. "
                        + ex.Message
                    );
                }
            }

            // =================================================
            // DELETE
            // =================================================

            else if (e.CommandName == "Delete")
            {
                string filePath = null;

                // ---------------------------------------------
                // First get the file path
                // ---------------------------------------------

                string selectQuery = @"
                    SELECT FilePath
                    FROM Resources
                    WHERE ResourceID = @ResourceID";

                try
                {
                    using (SqlConnection con =
                           new SqlConnection(
                               ConnectionString))
                    {
                        using (SqlCommand cmd =
                               new SqlCommand(
                                   selectQuery,
                                   con))
                        {
                            cmd.Parameters.Add(
                                "@ResourceID",
                                SqlDbType.Int
                            ).Value =
                                resourceID;

                            con.Open();

                            object result =
                                cmd.ExecuteScalar();

                            if (result == null ||
                                result == DBNull.Value)
                            {
                                ShowError(
                                    "Resource not found."
                                );

                                BindResources();
                                return;
                            }

                            filePath =
                                result.ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    ShowError(
                        "Could not find the resource. "
                        + ex.Message
                    );

                    return;
                }

                // ---------------------------------------------
                // Delete database record
                // ---------------------------------------------

                string deleteQuery = @"
                    DELETE FROM Resources
                    WHERE ResourceID = @ResourceID";

                try
                {
                    using (SqlConnection con =
                           new SqlConnection(
                               ConnectionString))
                    {
                        using (SqlCommand cmd =
                               new SqlCommand(
                                   deleteQuery,
                                   con))
                        {
                            cmd.Parameters.Add(
                                "@ResourceID",
                                SqlDbType.Int
                            ).Value =
                                resourceID;

                            con.Open();

                            int rows =
                                cmd.ExecuteNonQuery();

                            if (rows == 0)
                            {
                                ShowError(
                                    "Resource could not be deleted."
                                );

                                BindResources();
                                return;
                            }
                        }
                    }

                    // -----------------------------------------
                    // Delete physical file
                    // -----------------------------------------

                    if (!string.IsNullOrWhiteSpace(
                        filePath))
                    {
                        try
                        {
                            string physicalPath =
                                Server.MapPath(filePath);

                            if (File.Exists(
                                physicalPath))
                            {
                                File.Delete(
                                    physicalPath
                                );
                            }
                        }
                        catch
                        {
                            // Database deletion succeeded.
                        }
                    }

                    ShowSuccess(
                        "Resource deleted successfully."
                    );
                }
                catch (Exception ex)
                {
                    ShowError(
                        "Resource could not be deleted. "
                        + ex.Message
                    );
                }
            }

            // Refresh table
            BindResources();
        }

        // =====================================================
        // SUCCESS MESSAGE
        // =====================================================

        private void ShowSuccess(string message)
        {
            lblConfirmationText.Text = message;

            pnlConfirmation.Visible = true;
            pnlError.Visible = false;
        }

        // =====================================================
        // ERROR MESSAGE
        // =====================================================

        private void ShowError(string message)
        {
            lblError.Text = message;

            pnlError.Visible = true;
            pnlConfirmation.Visible = false;
        }

        // =====================================================
        // LOGOUT
        // =====================================================

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