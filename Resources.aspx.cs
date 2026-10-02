using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace STUDYVAULT
{
    public partial class Resources : Page
    {
        private string connectionString =
            ConfigurationManager
                .ConnectionStrings["StudyVaultConnection"]
                .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadResources();
            }
        }

        private void LoadResources()
        {
            using (SqlConnection con =
                   new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT
                        ResourceID,
                        Title,
                        Description,
                        FilePath,
                        CategoryID,
                        UploadDate
                    FROM dbo.Resources
                    ORDER BY UploadDate DESC, ResourceID DESC";

                using (SqlCommand cmd =
                       new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da =
                           new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        rptResources.DataSource = dt;
                        rptResources.DataBind();
                    }
                }
            }
        }

        protected string GetCategoryName(object categoryID)
        {
            if (categoryID == null ||
                categoryID == DBNull.Value)
            {
                return "Uncategorized";
            }

            int id;

            if (!int.TryParse(categoryID.ToString(), out id))
            {
                return "Uncategorized";
            }

            using (SqlConnection con =
                   new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT CategoryName
                    FROM dbo.Categories
                    WHERE CategoryID = @CategoryID";

                using (SqlCommand cmd =
                       new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CategoryID", id);

                    con.Open();

                    object result = cmd.ExecuteScalar();

                    if (result == null ||
                        result == DBNull.Value)
                    {
                        return "Uncategorized";
                    }

                    return result.ToString();
                }
            }
        }

        protected string FormatDate(object uploadDate)
        {
            if (uploadDate == null ||
                uploadDate == DBNull.Value)
            {
                return "";
            }

            DateTime date;

            if (DateTime.TryParse(
                uploadDate.ToString(),
                out date))
            {
                return date.ToString("dd MMM yyyy");
            }

            return "";
        }

        protected string GetDownloadUrl(object resourceID)
        {
            if (resourceID == null ||
                resourceID == DBNull.Value)
            {
                return "#";
            }

            return ResolveUrl(
                "~/DownloadResource.aspx?id=" +
                resourceID.ToString()
            );
        }
    }
}