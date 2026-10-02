using STUDYVAULT.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace STUDYVAULT
{
    public static class ResourceCatalog
    {
        private static string ConnectionString
        {
            get
            {
                return ConfigurationManager
                    .ConnectionStrings["StudyVaultConnection"]
                    .ConnectionString;
            }
        }

        // =====================================================
        // READ ALL
        // =====================================================

        public static List<ResourceItem> GetAllResources()
        {
            List<ResourceItem> resources = new List<ResourceItem>();

            using (SqlConnection con = new SqlConnection(ConnectionString))
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

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            resources.Add(ReadResource(reader));
                        }
                    }
                }
            }

            return resources;
        }

        // =====================================================
        // READ ONE
        // =====================================================

        public static ResourceItem GetById(int resourceID)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
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
                    WHERE ResourceID = @ResourceID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@ResourceID", SqlDbType.Int)
                        .Value = resourceID;

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return ReadResource(reader);
                        }
                    }
                }
            }

            return null;
        }

        // =====================================================
        // CONVERT DATABASE ROW TO OBJECT
        // =====================================================

        private static ResourceItem ReadResource(SqlDataReader reader)
        {
            ResourceItem resource = new ResourceItem();

            resource.ResourceID =
                Convert.ToInt32(reader["ResourceID"]);

            resource.Title =
                Convert.ToString(reader["Title"]);

            resource.Description =
                reader["Description"] == DBNull.Value
                    ? ""
                    : Convert.ToString(reader["Description"]);

            resource.FilePath =
                reader["FilePath"] == DBNull.Value
                    ? ""
                    : Convert.ToString(reader["FilePath"]);

            if (reader["CategoryID"] == DBNull.Value)
            {
                resource.CategoryID = null;
            }
            else
            {
                resource.CategoryID =
                    Convert.ToInt32(reader["CategoryID"]);
            }

            if (reader["UploadDate"] == DBNull.Value)
            {
                resource.UploadDate = null;
            }
            else
            {
                resource.UploadDate =
                    Convert.ToDateTime(reader["UploadDate"]);
            }

            return resource;
        }

        // =====================================================
        // CREATE
        // =====================================================

        public static int AddResource(ResourceItem resource)
        {
            if (resource == null)
                throw new ArgumentNullException("resource");

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = @"
                    INSERT INTO dbo.Resources
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
                    );

                    SELECT CAST(SCOPE_IDENTITY() AS INT);";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@Title", SqlDbType.VarChar, 200)
                        .Value = resource.Title ?? "";

                    cmd.Parameters.Add("@Description", SqlDbType.VarChar, -1)
                        .Value = (object)resource.Description ?? DBNull.Value;

                    cmd.Parameters.Add("@FilePath", SqlDbType.VarChar, 255)
                        .Value = (object)resource.FilePath ?? DBNull.Value;

                    cmd.Parameters.Add("@CategoryID", SqlDbType.Int)
                        .Value = (object)resource.CategoryID ?? DBNull.Value;

                    cmd.Parameters.Add("@UploadDate", SqlDbType.Date)
                        .Value = (object)resource.UploadDate ?? DateTime.Today;

                    con.Open();

                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        // =====================================================
        // UPDATE
        // =====================================================

        public static bool UpdateResource(ResourceItem resource)
        {
            if (resource == null)
                throw new ArgumentNullException("resource");

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = @"
                    UPDATE dbo.Resources
                    SET
                        Title = @Title,
                        Description = @Description,
                        FilePath = @FilePath,
                        CategoryID = @CategoryID
                    WHERE ResourceID = @ResourceID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@ResourceID", SqlDbType.Int)
                        .Value = resource.ResourceID;

                    cmd.Parameters.Add("@Title", SqlDbType.VarChar, 200)
                        .Value = resource.Title ?? "";

                    cmd.Parameters.Add("@Description", SqlDbType.VarChar, -1)
                        .Value = (object)resource.Description ?? DBNull.Value;

                    cmd.Parameters.Add("@FilePath", SqlDbType.VarChar, 255)
                        .Value = (object)resource.FilePath ?? DBNull.Value;

                    cmd.Parameters.Add("@CategoryID", SqlDbType.Int)
                        .Value = (object)resource.CategoryID ?? DBNull.Value;

                    con.Open();

                    return cmd.ExecuteNonQuery() == 1;
                }
            }
        }

        // =====================================================
        // DELETE
        // =====================================================

        public static bool DeleteResource(int resourceID)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = @"
                    DELETE FROM dbo.Resources
                    WHERE ResourceID = @ResourceID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@ResourceID", SqlDbType.Int)
                        .Value = resourceID;

                    con.Open();

                    return cmd.ExecuteNonQuery() == 1;
                }
            }
        }
    }
}