using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace STUDYVAULT
{
    public class CategoryCatalog
    {
        private string ConnectionString
        {
            get
            {
                ConnectionStringSettings settings =
                    ConfigurationManager.ConnectionStrings[
                        "StudyVaultConnection"
                    ];

                if (settings == null)
                {
                    throw new Exception(
                        "Connection string 'StudyVaultConnection' was not found in Web.config."
                    );
                }

                return settings.ConnectionString;
            }
        }

        // =========================================================
        // CREATE CATEGORY OBJECT
        // =========================================================

        private Category ReadCategory(SqlDataReader reader)
        {
            Category category = new Category();

            category.Id =
                reader["CategoryID"] == DBNull.Value
                    ? 0
                    : Convert.ToInt32(reader["CategoryID"]);

            category.Name =
                reader["CategoryName"] == DBNull.Value
                    ? ""
                    : reader["CategoryName"].ToString();

            category.Slug =
                reader["Slug"] == DBNull.Value
                    ? ""
                    : reader["Slug"].ToString();

            category.Description =
                reader["Description"] == DBNull.Value
                    ? ""
                    : reader["Description"].ToString();

            category.Icon =
                reader["Icon"] == DBNull.Value
                    ? ""
                    : reader["Icon"].ToString();

            category.CssClass =
                reader["CssClass"] == DBNull.Value
                    ? ""
                    : reader["CssClass"].ToString();

            category.ResourceCount =
                reader["ResourceCount"] == DBNull.Value
                    ? 0
                    : Convert.ToInt32(reader["ResourceCount"]);

            category.IsActive =
                reader["IsActive"] != DBNull.Value &&
                Convert.ToBoolean(reader["IsActive"]);

            if (HasColumn(reader, "CreatedDate"))
            {
                category.CreatedDate =
                    reader["CreatedDate"] == DBNull.Value
                        ? DateTime.MinValue
                        : Convert.ToDateTime(reader["CreatedDate"]);
            }

            return category;
        }

        // =========================================================
        // CHECK IF COLUMN EXISTS IN RESULT
        // =========================================================

        private bool HasColumn(
            SqlDataReader reader,
            string columnName)
        {
            for (int i = 0; i < reader.FieldCount; i++)
            {
                if (reader.GetName(i)
                    .Equals(
                        columnName,
                        StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }

            return false;
        }

        // =========================================================
        // GET ALL ACTIVE CATEGORIES
        // =========================================================

        public List<Category> GetAllCategories()
        {
            List<Category> categories =
                new List<Category>();

            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            {
                string sql = @"
                    SELECT
                        CategoryID,
                        CategoryName,
                        Slug,
                        Description,
                        Icon,
                        CssClass,
                        ResourceCount,
                        IsActive,
                        CreatedDate
                    FROM Categories
                    WHERE IsActive = 1
                    ORDER BY CategoryName ASC";

                using (SqlCommand command =
                    new SqlCommand(sql, connection))
                {
                    connection.Open();

                    using (SqlDataReader reader =
                        command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            categories.Add(
                                ReadCategory(reader)
                            );
                        }
                    }
                }
            }

            return categories;
        }

        // =========================================================
        // GET CATEGORY BY ID
        // =========================================================

        public Category GetCategoryById(int id)
        {
            Category category = null;

            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            {
                string sql = @"
                    SELECT
                        CategoryID,
                        CategoryName,
                        Slug,
                        Description,
                        Icon,
                        CssClass,
                        ResourceCount,
                        IsActive,
                        CreatedDate
                    FROM Categories
                    WHERE CategoryID = @CategoryID";

                using (SqlCommand command =
                    new SqlCommand(sql, connection))
                {
                    command.Parameters.Add(
                        "@CategoryID",
                        System.Data.SqlDbType.Int
                    ).Value = id;

                    connection.Open();

                    using (SqlDataReader reader =
                        command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            category =
                                ReadCategory(reader);
                        }
                    }
                }
            }

            return category;
        }

        // =========================================================
        // GET ALL CATEGORIES FOR ADMIN
        // =========================================================

        public List<Category> GetAllCategoriesForAdmin()
        {
            List<Category> categories =
                new List<Category>();

            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            {
                string sql = @"
                    SELECT
                        CategoryID,
                        CategoryName,
                        Slug,
                        Description,
                        Icon,
                        CssClass,
                        ResourceCount,
                        IsActive,
                        CreatedDate
                    FROM Categories
                    ORDER BY CategoryName ASC";

                using (SqlCommand command =
                    new SqlCommand(sql, connection))
                {
                    connection.Open();

                    using (SqlDataReader reader =
                        command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            categories.Add(
                                ReadCategory(reader)
                            );
                        }
                    }
                }
            }

            return categories;
        }

        // =========================================================
        // SEARCH CATEGORIES
        // =========================================================

        public List<Category> SearchCategories(
            string search)
        {
            List<Category> categories =
                new List<Category>();

            if (search == null)
            {
                search = "";
            }

            search = search.Trim();

            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            {
                string sql = @"
                    SELECT
                        CategoryID,
                        CategoryName,
                        Slug,
                        Description,
                        Icon,
                        CssClass,
                        ResourceCount,
                        IsActive,
                        CreatedDate
                    FROM Categories
                    WHERE
                        IsActive = 1
                        AND
                        (
                            CategoryName LIKE @Search
                            OR Slug LIKE @Search
                            OR Description LIKE @Search
                        )
                    ORDER BY CategoryName ASC";

                using (SqlCommand command =
                    new SqlCommand(sql, connection))
                {
                    command.Parameters.Add(
                        "@Search",
                        System.Data.SqlDbType.NVarChar,
                        200
                    ).Value = "%" + search + "%";

                    connection.Open();

                    using (SqlDataReader reader =
                        command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            categories.Add(
                                ReadCategory(reader)
                            );
                        }
                    }
                }
            }

            return categories;
        }
    }
}