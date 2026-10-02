using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace STUDYVAULT
{
    public static class VideoCatalog
    {
        private static readonly string connectionString =
            ConfigurationManager
                .ConnectionStrings["StudyVaultConnection"]
                .ConnectionString;


        // =========================================================
        // CREATE
        // =========================================================

        public static void AddVideo(VideoItem video)
        {
            const string sql = @"
                INSERT INTO dbo.Videos
                (
                    Title,
                    Category,
                    CategoryLabel,
                    Level,
                    Duration,
                    Instructor,
                    UploadDate,
                    Description,
                    Topics,
                    YouTubeUrl,
                    IsFeatured
                )
                VALUES
                (
                    @Title,
                    @Category,
                    @CategoryLabel,
                    @Level,
                    @Duration,
                    @Instructor,
                    @UploadDate,
                    @Description,
                    @Topics,
                    @YouTubeUrl,
                    @IsFeatured
                )";

            using (SqlConnection connection =
                   new SqlConnection(connectionString))
            using (SqlCommand command =
                   new SqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue(
                    "@Title",
                    video.Title ?? "");

                command.Parameters.AddWithValue(
                    "@Category",
                    video.Category ?? "");

                command.Parameters.AddWithValue(
                    "@CategoryLabel",
                    video.CategoryLabel ?? "");

                command.Parameters.AddWithValue(
                    "@Level",
                    video.Level ?? "");

                command.Parameters.AddWithValue(
                    "@Duration",
                    string.IsNullOrWhiteSpace(video.Duration)
                        ? (object)DBNull.Value
                        : video.Duration);

                command.Parameters.AddWithValue(
                    "@Instructor",
                    string.IsNullOrWhiteSpace(video.Instructor)
                        ? (object)DBNull.Value
                        : video.Instructor);

                command.Parameters.AddWithValue(
                    "@UploadDate",
                    video.UploadDate);

                command.Parameters.AddWithValue(
                    "@Description",
                    string.IsNullOrWhiteSpace(video.Description)
                        ? (object)DBNull.Value
                        : video.Description);

                command.Parameters.AddWithValue(
                    "@Topics",
                    TopicsToString(video.Topics));

                command.Parameters.AddWithValue(
                    "@YouTubeUrl",
                    string.IsNullOrWhiteSpace(video.YouTubeUrl)
                        ? (object)DBNull.Value
                        : video.YouTubeUrl);

                command.Parameters.AddWithValue(
                    "@IsFeatured",
                    video.IsFeatured);

                connection.Open();

                command.ExecuteNonQuery();
            }
        }


        // =========================================================
        // READ - GET ALL
        // =========================================================

        public static List<VideoItem> GetAllVideos()
        {
            List<VideoItem> videos =
                new List<VideoItem>();

            const string sql = @"
                SELECT
                    Id,
                    Title,
                    Category,
                    CategoryLabel,
                    Level,
                    Duration,
                    Instructor,
                    UploadDate,
                    Description,
                    Topics,
                    YouTubeUrl,
                    IsFeatured
                FROM dbo.Videos
                ORDER BY UploadDate DESC";

            using (SqlConnection connection =
                   new SqlConnection(connectionString))
            using (SqlCommand command =
                   new SqlCommand(sql, connection))
            {
                connection.Open();

                using (SqlDataReader reader =
                       command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        videos.Add(MapVideo(reader));
                    }
                }
            }

            return videos;
        }


        // =========================================================
        // READ - GET BY ID
        // =========================================================

        public static VideoItem GetById(int id)
        {
            const string sql = @"
                SELECT
                    Id,
                    Title,
                    Category,
                    CategoryLabel,
                    Level,
                    Duration,
                    Instructor,
                    UploadDate,
                    Description,
                    Topics,
                    YouTubeUrl,
                    IsFeatured
                FROM dbo.Videos
                WHERE Id = @Id";

            using (SqlConnection connection =
                   new SqlConnection(connectionString))
            using (SqlCommand command =
                   new SqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue(
                    "@Id",
                    id);

                connection.Open();

                using (SqlDataReader reader =
                       command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return MapVideo(reader);
                    }
                }
            }

            return null;
        }


        // =========================================================
        // UPDATE
        // =========================================================

        public static bool UpdateVideo(VideoItem video)
        {
            const string sql = @"
                UPDATE dbo.Videos
                SET
                    Title = @Title,
                    Category = @Category,
                    CategoryLabel = @CategoryLabel,
                    Level = @Level,
                    Duration = @Duration,
                    Instructor = @Instructor,
                    Description = @Description,
                    Topics = @Topics,
                    YouTubeUrl = @YouTubeUrl,
                    IsFeatured = @IsFeatured
                WHERE Id = @Id";

            using (SqlConnection connection =
                   new SqlConnection(connectionString))
            using (SqlCommand command =
                   new SqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue(
                    "@Id",
                    video.Id);

                command.Parameters.AddWithValue(
                    "@Title",
                    video.Title ?? "");

                command.Parameters.AddWithValue(
                    "@Category",
                    video.Category ?? "");

                command.Parameters.AddWithValue(
                    "@CategoryLabel",
                    video.CategoryLabel ?? "");

                command.Parameters.AddWithValue(
                    "@Level",
                    video.Level ?? "");

                command.Parameters.AddWithValue(
                    "@Duration",
                    string.IsNullOrWhiteSpace(video.Duration)
                        ? (object)DBNull.Value
                        : video.Duration);

                command.Parameters.AddWithValue(
                    "@Instructor",
                    string.IsNullOrWhiteSpace(video.Instructor)
                        ? (object)DBNull.Value
                        : video.Instructor);

                command.Parameters.AddWithValue(
                    "@Description",
                    string.IsNullOrWhiteSpace(video.Description)
                        ? (object)DBNull.Value
                        : video.Description);

                command.Parameters.AddWithValue(
                    "@Topics",
                    TopicsToString(video.Topics));

                command.Parameters.AddWithValue(
                    "@YouTubeUrl",
                    string.IsNullOrWhiteSpace(video.YouTubeUrl)
                        ? (object)DBNull.Value
                        : video.YouTubeUrl);

                command.Parameters.AddWithValue(
                    "@IsFeatured",
                    video.IsFeatured);

                connection.Open();

                return command.ExecuteNonQuery() > 0;
            }
        }


        // =========================================================
        // DELETE
        // =========================================================

        public static bool DeleteVideo(int id)
        {
            const string sql = @"
                DELETE FROM dbo.Videos
                WHERE Id = @Id";

            using (SqlConnection connection =
                   new SqlConnection(connectionString))
            using (SqlCommand command =
                   new SqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue(
                    "@Id",
                    id);

                connection.Open();

                return command.ExecuteNonQuery() > 0;
            }
        }


        // =========================================================
        // MAP DATABASE ROW TO VideoItem
        // =========================================================

        private static VideoItem MapVideo(
            SqlDataReader reader)
        {
            VideoItem video =
                new VideoItem();

            video.Id =
                Convert.ToInt32(reader["Id"]);

            video.Title =
                Convert.ToString(reader["Title"]);

            video.Category =
                Convert.ToString(reader["Category"]);

            video.CategoryLabel =
                Convert.ToString(reader["CategoryLabel"]);

            video.Level =
                Convert.ToString(reader["Level"]);

            video.Duration =
                reader["Duration"] == DBNull.Value
                    ? ""
                    : Convert.ToString(reader["Duration"]);

            video.Instructor =
                reader["Instructor"] == DBNull.Value
                    ? ""
                    : Convert.ToString(reader["Instructor"]);

            video.UploadDate =
                Convert.ToDateTime(reader["UploadDate"]);

            video.Description =
                reader["Description"] == DBNull.Value
                    ? ""
                    : Convert.ToString(reader["Description"]);

            video.Topics =
                StringToTopics(
                    reader["Topics"] == DBNull.Value
                        ? ""
                        : Convert.ToString(reader["Topics"])
                );

            video.YouTubeUrl =
                reader["YouTubeUrl"] == DBNull.Value
                    ? ""
                    : Convert.ToString(reader["YouTubeUrl"]);

            video.IsFeatured =
                Convert.ToBoolean(reader["IsFeatured"]);

            return video;
        }


        // =========================================================
        // TOPICS LIST -> STRING
        // =========================================================

        private static string TopicsToString(
            List<string> topics)
        {
            if (topics == null ||
                topics.Count == 0)
            {
                return "";
            }

            return string.Join(", ", topics);
        }


        // =========================================================
        // STRING -> TOPICS LIST
        // =========================================================

        private static List<string> StringToTopics(
            string topics)
        {
            List<string> result =
                new List<string>();

            if (string.IsNullOrWhiteSpace(topics))
            {
                return result;
            }

            string[] parts =
                topics.Split(',');

            foreach (string part in parts)
            {
                string topic =
                    part.Trim();

                if (!string.IsNullOrWhiteSpace(topic))
                {
                    result.Add(topic);
                }
            }

            return result;
        }
    }
}