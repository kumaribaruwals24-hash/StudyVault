using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace STUDYVAULT
{
    public partial class AdminCategories : Page
    {
        private string ConnectionString
        {
            get
            {
                ConnectionStringSettings settings =
                    ConfigurationManager.ConnectionStrings["StudyVaultConnection"];

                if (settings == null)
                {
                    throw new Exception(
                        "Connection string 'StudyVaultConnection' was not found in Web.config."
                    );
                }

                return settings.ConnectionString;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearMessages();
                ResetForm();
                LoadCategories();
                LoadStatistics();
            }
        }

        // =========================================================
        // LOAD CATEGORIES
        // =========================================================

        private void LoadCategories()
        {
            try
            {
                string search = txtSearch.Text.Trim();

                using (SqlConnection con =
                    new SqlConnection(ConnectionString))
                {
                    string sql = @"
                        SELECT
                            CategoryId AS Id,
                            CategoryName AS Name,
                            Slug,
                            Description,
                            Icon,
                            CssClass,
                            ResourceCount,
                            IsActive
                        FROM Categories
                        WHERE
                            @Search = ''
                            OR CategoryName LIKE '%' + @Search + '%'
                            OR Slug LIKE '%' + @Search + '%'
                        ORDER BY CategoryName ASC";

                    using (SqlCommand cmd =
                        new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Search",
                            search
                        );

                        using (SqlDataAdapter da =
                            new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();

                            da.Fill(dt);

                            rptCategories.DataSource = dt;
                            rptCategories.DataBind();

                            pnlNoCategories.Visible =
                                dt.Rows.Count == 0;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        // =========================================================
        // STATISTICS
        // =========================================================

        private void LoadStatistics()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(ConnectionString))
                {
                    con.Open();

                    string sql = @"
                        SELECT
                            COUNT(*) AS TotalCategories,

                            ISNULL(
                                SUM(
                                    CASE
                                        WHEN IsActive = 1 THEN 1
                                        ELSE 0
                                    END
                                ),
                                0
                            ) AS ActiveCategories,

                            ISNULL(
                                SUM(ResourceCount),
                                0
                            ) AS TotalResources

                        FROM Categories";

                    using (SqlCommand cmd =
                        new SqlCommand(sql, con))
                    {
                        using (SqlDataReader reader =
                            cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                lblTotalCategories.Text =
                                    reader["TotalCategories"].ToString();

                                lblActiveCategories.Text =
                                    reader["ActiveCategories"].ToString();

                                lblTotalResources.Text =
                                    reader["TotalResources"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        // =========================================================
        // ADD CATEGORY
        // =========================================================

        protected void btnAdd_Click(
            object sender,
            EventArgs e)
        {
            ClearMessages();

            try
            {
                if (!ValidateForm())
                {
                    return;
                }

                string name = txtName.Text.Trim();
                string slug = txtSlug.Text.Trim();
                string description = txtDescription.Text.Trim();
                string icon = txtIcon.Text.Trim();
                string cssClass = txtCssClass.Text.Trim();

                int resourceCount;

                int.TryParse(
                    txtResourceCount.Text.Trim(),
                    out resourceCount
                );

                bool isActive = chkActive.Checked;

                using (SqlConnection con =
                    new SqlConnection(ConnectionString))
                {
                    con.Open();

                    // -------------------------------------------------
                    // CHECK DUPLICATE CATEGORY NAME
                    // -------------------------------------------------

                    string checkNameSql = @"
                        SELECT COUNT(*)
                        FROM Categories
                        WHERE CategoryName = @CategoryName";

                    using (SqlCommand cmd =
                        new SqlCommand(
                            checkNameSql,
                            con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@CategoryName",
                            name
                        );

                        int exists =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()
                            );

                        if (exists > 0)
                        {
                            ShowError(
                                "A category with this name already exists."
                            );

                            return;
                        }
                    }

                    // -------------------------------------------------
                    // CHECK DUPLICATE SLUG
                    // -------------------------------------------------

                    string checkSlugSql = @"
                        SELECT COUNT(*)
                        FROM Categories
                        WHERE Slug = @Slug";

                    using (SqlCommand cmd =
                        new SqlCommand(
                            checkSlugSql,
                            con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Slug",
                            slug
                        );

                        int exists =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()
                            );

                        if (exists > 0)
                        {
                            ShowError(
                                "A category with this slug already exists."
                            );

                            return;
                        }
                    }

                    // -------------------------------------------------
                    // INSERT
                    // -------------------------------------------------

                    string sql = @"
                        INSERT INTO Categories
                        (
                            CategoryName,
                            Slug,
                            Description,
                            Icon,
                            CssClass,
                            ResourceCount,
                            IsActive
                        )
                        VALUES
                        (
                            @CategoryName,
                            @Slug,
                            @Description,
                            @Icon,
                            @CssClass,
                            @ResourceCount,
                            @IsActive
                        )";

                    using (SqlCommand cmd =
                        new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@CategoryName",
                            name
                        );

                        cmd.Parameters.AddWithValue(
                            "@Slug",
                            slug
                        );

                        cmd.Parameters.AddWithValue(
                            "@Description",
                            description
                        );

                        cmd.Parameters.AddWithValue(
                            "@Icon",
                            icon
                        );

                        cmd.Parameters.AddWithValue(
                            "@CssClass",
                            cssClass
                        );

                        cmd.Parameters.AddWithValue(
                            "@ResourceCount",
                            resourceCount
                        );

                        cmd.Parameters.AddWithValue(
                            "@IsActive",
                            isActive
                        );

                        cmd.ExecuteNonQuery();
                    }
                }

                ShowSuccess(
                    "Category added successfully."
                );

                ResetForm();
                LoadCategories();
                LoadStatistics();
            }
            catch (Exception ex)
            {
                ShowError(
                    "Unable to add category: " +
                    ex.Message
                );
            }
        }

        // =========================================================
        // REPEATER COMMAND
        // =========================================================

        protected void rptCategories_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            ClearMessages();

            try
            {
                int id;

                if (!int.TryParse(
                    Convert.ToString(
                        e.CommandArgument
                    ),
                    out id))
                {
                    ShowError(
                        "Invalid category ID."
                    );

                    return;
                }

                if (e.CommandName == "EditCategory")
                {
                    LoadCategoryForEdit(id);
                }
                else if (e.CommandName == "DeleteCategory")
                {
                    DeleteCategory(id);
                }
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        // =========================================================
        // LOAD CATEGORY FOR EDIT
        // =========================================================

        private void LoadCategoryForEdit(int id)
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(ConnectionString))
                {
                    string sql = @"
                        SELECT
                            CategoryId AS Id,
                            CategoryName AS Name,
                            Slug,
                            Description,
                            Icon,
                            CssClass,
                            ResourceCount,
                            IsActive
                        FROM Categories
                        WHERE CategoryId = @Id";

                    using (SqlCommand cmd =
                        new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Id",
                            id
                        );

                        con.Open();

                        using (SqlDataReader reader =
                            cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                hfCategoryId.Value =
                                    reader["Id"].ToString();

                                txtName.Text =
                                    reader["Name"].ToString();

                                txtSlug.Text =
                                    reader["Slug"].ToString();

                                txtDescription.Text =
                                    reader["Description"].ToString();

                                txtIcon.Text =
                                    reader["Icon"].ToString();

                                txtCssClass.Text =
                                    reader["CssClass"].ToString();

                                txtResourceCount.Text =
                                    reader["ResourceCount"].ToString();

                                chkActive.Checked =
                                    Convert.ToBoolean(
                                        reader["IsActive"]
                                    );

                                lblFormTitle.Text =
                                    "Edit Category";

                                btnAdd.Visible = false;

                                btnUpdate.Visible = true;
                            }
                            else
                            {
                                ShowError(
                                    "Category not found."
                                );
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        // =========================================================
        // UPDATE CATEGORY
        // =========================================================

        protected void btnUpdate_Click(
            object sender,
            EventArgs e)
        {
            ClearMessages();

            try
            {
                if (!ValidateForm())
                {
                    return;
                }

                int id;

                if (!int.TryParse(
                    hfCategoryId.Value,
                    out id))
                {
                    ShowError(
                        "Invalid category ID."
                    );

                    return;
                }

                string name =
                    txtName.Text.Trim();

                string slug =
                    txtSlug.Text.Trim();

                string description =
                    txtDescription.Text.Trim();

                string icon =
                    txtIcon.Text.Trim();

                string cssClass =
                    txtCssClass.Text.Trim();

                int resourceCount;

                int.TryParse(
                    txtResourceCount.Text.Trim(),
                    out resourceCount
                );

                bool isActive =
                    chkActive.Checked;

                using (SqlConnection con =
                    new SqlConnection(ConnectionString))
                {
                    con.Open();

                    // -------------------------------------------------
                    // CHECK DUPLICATE NAME
                    // -------------------------------------------------

                    string checkNameSql = @"
                        SELECT COUNT(*)
                        FROM Categories
                        WHERE CategoryName = @CategoryName
                        AND CategoryId <> @Id";

                    using (SqlCommand cmd =
                        new SqlCommand(
                            checkNameSql,
                            con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@CategoryName",
                            name
                        );

                        cmd.Parameters.AddWithValue(
                            "@Id",
                            id
                        );

                        int exists =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()
                            );

                        if (exists > 0)
                        {
                            ShowError(
                                "Another category already uses this name."
                            );

                            return;
                        }
                    }

                    // -------------------------------------------------
                    // CHECK DUPLICATE SLUG
                    // -------------------------------------------------

                    string checkSlugSql = @"
                        SELECT COUNT(*)
                        FROM Categories
                        WHERE Slug = @Slug
                        AND CategoryId <> @Id";

                    using (SqlCommand cmd =
                        new SqlCommand(
                            checkSlugSql,
                            con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Slug",
                            slug
                        );

                        cmd.Parameters.AddWithValue(
                            "@Id",
                            id
                        );

                        int exists =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()
                            );

                        if (exists > 0)
                        {
                            ShowError(
                                "Another category already uses this slug."
                            );

                            return;
                        }
                    }

                    // -------------------------------------------------
                    // UPDATE
                    // -------------------------------------------------

                    string sql = @"
                        UPDATE Categories
                        SET
                            CategoryName = @CategoryName,
                            Slug = @Slug,
                            Description = @Description,
                            Icon = @Icon,
                            CssClass = @CssClass,
                            ResourceCount = @ResourceCount,
                            IsActive = @IsActive
                        WHERE CategoryId = @Id";

                    using (SqlCommand cmd =
                        new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Id",
                            id
                        );

                        cmd.Parameters.AddWithValue(
                            "@CategoryName",
                            name
                        );

                        cmd.Parameters.AddWithValue(
                            "@Slug",
                            slug
                        );

                        cmd.Parameters.AddWithValue(
                            "@Description",
                            description
                        );

                        cmd.Parameters.AddWithValue(
                            "@Icon",
                            icon
                        );

                        cmd.Parameters.AddWithValue(
                            "@CssClass",
                            cssClass
                        );

                        cmd.Parameters.AddWithValue(
                            "@ResourceCount",
                            resourceCount
                        );

                        cmd.Parameters.AddWithValue(
                            "@IsActive",
                            isActive
                        );

                        cmd.ExecuteNonQuery();
                    }
                }

                ShowSuccess(
                    "Category updated successfully."
                );

                ResetForm();
                LoadCategories();
                LoadStatistics();
            }
            catch (Exception ex)
            {
                ShowError(
                    "Unable to update category: " +
                    ex.Message
                );
            }
        }

        // =========================================================
        // DELETE CATEGORY
        // =========================================================

        private void DeleteCategory(int id)
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(ConnectionString))
                {
                    con.Open();

                    // Check whether resources use this category.
                    // If your Resources table does not have CategoryId,
                    // this check should be removed/changed.

                    string checkSql = @"
                        SELECT COUNT(*)
                        FROM Resources
                        WHERE CategoryId = @CategoryId";

                    using (SqlCommand checkCmd =
                        new SqlCommand(
                            checkSql,
                            con))
                    {
                        checkCmd.Parameters.AddWithValue(
                            "@CategoryId",
                            id
                        );

                        int resourceCount =
                            Convert.ToInt32(
                                checkCmd.ExecuteScalar()
                            );

                        if (resourceCount > 0)
                        {
                            ShowError(
                                "This category cannot be deleted because resources are linked to it. Please deactivate it instead."
                            );

                            return;
                        }
                    }

                    string sql = @"
                        DELETE FROM Categories
                        WHERE CategoryId = @Id";

                    using (SqlCommand cmd =
                        new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Id",
                            id
                        );

                        cmd.ExecuteNonQuery();
                    }
                }

                ShowSuccess(
                    "Category deleted successfully."
                );

                LoadCategories();
                LoadStatistics();
            }
            catch (SqlException)
            {
                ShowError(
                    "This category cannot be deleted because it is being used by another part of the system."
                );
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        // =========================================================
        // SEARCH
        // =========================================================

        protected void btnSearch_Click(
            object sender,
            EventArgs e)
        {
            ClearMessages();

            LoadCategories();
        }

        // =========================================================
        // CANCEL
        // =========================================================

        protected void btnCancel_Click(
            object sender,
            EventArgs e)
        {
            ClearMessages();

            ResetForm();
        }

        // =========================================================
        // RESET FORM
        // =========================================================

        private void ResetForm()
        {
            hfCategoryId.Value = "0";

            txtName.Text = "";

            txtSlug.Text = "";

            txtDescription.Text = "";

            txtIcon.Text = "";

            txtCssClass.Text = "";

            txtResourceCount.Text = "0";

            chkActive.Checked = true;

            lblFormTitle.Text =
                "Add Category";

            btnAdd.Visible = true;

            btnUpdate.Visible = false;
        }

        // =========================================================
        // VALIDATION
        // =========================================================

        private bool ValidateForm()
        {
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                ShowError(
                    "Please enter a category name."
                );

                return false;
            }

            if (string.IsNullOrWhiteSpace(txtSlug.Text))
            {
                ShowError(
                    "Please enter a category slug."
                );

                return false;
            }

            int resourceCount;

            if (!int.TryParse(
                txtResourceCount.Text.Trim(),
                out resourceCount))
            {
                ShowError(
                    "Resource count must be a valid number."
                );

                return false;
            }

            if (resourceCount < 0)
            {
                ShowError(
                    "Resource count cannot be negative."
                );

                return false;
            }

            return true;
        }

        // =========================================================
        // MESSAGES
        // =========================================================

        private void ClearMessages()
        {
            pnConfirmation.Visible = false;

            pnError.Visible = false;

            lblConfirmationText.Text = "";

            lblError.Text = "";
        }

        private void ShowSuccess(string message)
        {
            pnError.Visible = false;

            pnConfirmation.Visible = true;

            lblConfirmationText.Text =
                message;
        }

        private void ShowError(string message)
        {
            pnConfirmation.Visible = false;

            pnError.Visible = true;

            lblError.Text =
                message;
        }
    }
}