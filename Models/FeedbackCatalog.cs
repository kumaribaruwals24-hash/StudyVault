using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace STUDYVAULT
{
    public class FeedbackEntry
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Category { get; set; }
        public int Rating { get; set; }
        public string Message { get; set; }
        public DateTime SubmittedOn { get; set; }
        public string Status { get; set; }
    }

    public static class FeedbackCatalog
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

        // =========================================================
        // ADD FEEDBACK
        // =========================================================
        public static int AddFeedback(FeedbackEntry entry)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = @"
                    INSERT INTO dbo.Feedback
                    (
                        UserId,
                        UserName,
                        Email,
                        Category,
                        Rating,
                        Message,
                        SubmittedOn,
                        Status
                    )
                    VALUES
                    (
                        @UserId,
                        @UserName,
                        @Email,
                        @Category,
                        @Rating,
                        @Message,
                        @SubmittedOn,
                        @Status
                    );

                    SELECT CAST(SCOPE_IDENTITY() AS INT);";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@UserId", SqlDbType.Int)
                        .Value = entry.UserId;

                    cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 150)
                        .Value = entry.UserName;

                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 200)
                        .Value = string.IsNullOrEmpty(entry.Email)
                            ? (object)DBNull.Value
                            : entry.Email;

                    cmd.Parameters.Add("@Category", SqlDbType.NVarChar, 50)
                        .Value = entry.Category;

                    cmd.Parameters.Add("@Rating", SqlDbType.Int)
                        .Value = entry.Rating;

                    cmd.Parameters.Add("@Message", SqlDbType.NVarChar)
                        .Value = string.IsNullOrEmpty(entry.Message)
                            ? (object)DBNull.Value
                            : entry.Message;

                    cmd.Parameters.Add("@SubmittedOn", SqlDbType.DateTime)
                        .Value = entry.SubmittedOn;

                    cmd.Parameters.Add("@Status", SqlDbType.NVarChar, 20)
                        .Value = "New";

                    con.Open();

                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        // =========================================================
        // GET ALL FEEDBACK - ADMIN
        // =========================================================
        public static List<FeedbackEntry> GetAllFeedback()
        {
            List<FeedbackEntry> results = new List<FeedbackEntry>();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = @"
                    SELECT
                        Id,
                        UserId,
                        UserName,
                        Email,
                        Category,
                        Rating,
                        Message,
                        SubmittedOn,
                        Status
                    FROM dbo.Feedback
                    ORDER BY SubmittedOn DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            results.Add(new FeedbackEntry
                            {
                                Id = Convert.ToInt32(reader["Id"]),

                                UserId = reader["UserId"] == DBNull.Value
                                    ? 0
                                    : Convert.ToInt32(reader["UserId"]),

                                UserName = Convert.ToString(reader["UserName"]),

                                Email = reader["Email"] == DBNull.Value
                                    ? ""
                                    : Convert.ToString(reader["Email"]),

                                Category = Convert.ToString(reader["Category"]),

                                Rating = Convert.ToInt32(reader["Rating"]),

                                Message = reader["Message"] == DBNull.Value
                                    ? ""
                                    : Convert.ToString(reader["Message"]),

                                SubmittedOn = Convert.ToDateTime(reader["SubmittedOn"]),

                                Status = Convert.ToString(reader["Status"])
                            });
                        }
                    }
                }
            }

            return results;
        }

        // =========================================================
        // GET FEEDBACK FOR LOGGED-IN STUDENT
        // =========================================================
        public static List<FeedbackEntry> GetFeedbackByUser(int userId)
        {
            List<FeedbackEntry> results = new List<FeedbackEntry>();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = @"
                    SELECT
                        Id,
                        UserId,
                        UserName,
                        Email,
                        Category,
                        Rating,
                        Message,
                        SubmittedOn,
                        Status
                    FROM dbo.Feedback
                    WHERE UserId = @UserId
                    ORDER BY SubmittedOn DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@UserId", SqlDbType.Int)
                        .Value = userId;

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            results.Add(new FeedbackEntry
                            {
                                Id = Convert.ToInt32(reader["Id"]),

                                UserId = reader["UserId"] == DBNull.Value
                                    ? 0
                                    : Convert.ToInt32(reader["UserId"]),

                                UserName = Convert.ToString(reader["UserName"]),

                                Email = reader["Email"] == DBNull.Value
                                    ? ""
                                    : Convert.ToString(reader["Email"]),

                                Category = Convert.ToString(reader["Category"]),

                                Rating = Convert.ToInt32(reader["Rating"]),

                                Message = reader["Message"] == DBNull.Value
                                    ? ""
                                    : Convert.ToString(reader["Message"]),

                                SubmittedOn = Convert.ToDateTime(reader["SubmittedOn"]),

                                Status = Convert.ToString(reader["Status"])
                            });
                        }
                    }
                }
            }

            return results;
        }

        // =========================================================
        // UPDATE STATUS
        // =========================================================
        public static bool UpdateStatus(int id, string status)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = @"
                    UPDATE dbo.Feedback
                    SET Status = @Status
                    WHERE Id = @Id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@Status", SqlDbType.NVarChar, 20)
                        .Value = status;

                    cmd.Parameters.Add("@Id", SqlDbType.Int)
                        .Value = id;

                    con.Open();

                    return cmd.ExecuteNonQuery() == 1;
                }
            }
        }

        // =========================================================
        // DELETE FEEDBACK
        // =========================================================
        public static bool DeleteFeedback(int id)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = @"
                    DELETE FROM dbo.Feedback
                    WHERE Id = @Id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@Id", SqlDbType.Int)
                        .Value = id;

                    con.Open();

                    return cmd.ExecuteNonQuery() == 1;
                }
            }
        }
    }
}