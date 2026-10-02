using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace STUDYVAULT
{
    public partial class DownloadResource : Page
    {
        private string ConnectionString
        {
            get
            {
                return ConfigurationManager
                    .ConnectionStrings["StudyVaultConnection"]
                    .ConnectionString;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DownloadFile();
            }
        }

        private void DownloadFile()
        {
            // Get ResourceID from URL
            string idText = Request.QueryString["id"];

            int resourceID;

            if (!int.TryParse(idText, out resourceID))
            {
                Response.StatusCode = 400;
                Response.Write("Invalid resource.");
                Response.End();
                return;
            }

            string filePath = null;
            string title = null;

            // Get file information from database
            string query = @"
                SELECT
                    Title,
                    FilePath
                FROM Resources
                WHERE ResourceID = @ResourceID";

            using (SqlConnection con =
                   new SqlConnection(ConnectionString))
            using (SqlCommand cmd =
                   new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue(
                    "@ResourceID",
                    resourceID
                );

                con.Open();

                using (SqlDataReader reader =
                       cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        title = reader["Title"].ToString();

                        if (reader["FilePath"] != DBNull.Value)
                        {
                            filePath =
                                reader["FilePath"].ToString();
                        }
                    }
                }
            }

            // Resource does not exist
            if (string.IsNullOrWhiteSpace(filePath))
            {
                Response.StatusCode = 404;
                Response.Write("File not found.");
                Response.End();
                return;
            }

            // Convert ~/App_Data/... to physical path
            string physicalPath =
                Server.MapPath(filePath);

            // Check file exists
            if (!File.Exists(physicalPath))
            {
                Response.StatusCode = 404;
                Response.Write("The file does not exist.");
                Response.End();
                return;
            }

            // Get actual file name
            string fileName =
                Path.GetFileName(physicalPath);

            // Determine content type
            string contentType =
                MimeMapping.GetMimeMapping(fileName);

            // Clear existing response
            Response.Clear();

            Response.ContentType = contentType;

            Response.AddHeader(
                "Content-Disposition",
                "attachment; filename=\"" +
                fileName +
                "\""
            );

            Response.TransmitFile(physicalPath);

            Response.End();
        }
    }
}