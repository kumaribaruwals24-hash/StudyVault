using STUDYVAULT.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace STUDYVAULT
{
    public static class AssignmentCatalog
    {
        // =====================================================
        // CONNECTION STRING
        // =====================================================

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
        // GET ALL ASSIGNMENTS
        // =====================================================

        public static List<AssignmentQuestion> Assignments
        {
            get
            {
                return GetAllAssignments();
            }
        }


        public static List<AssignmentQuestion> GetAllAssignments()
        {
            List<AssignmentQuestion> assignments =
                new List<AssignmentQuestion>();

            using (SqlConnection con =
                new SqlConnection(ConnectionString))
            {
                string query = @"
                    SELECT
                        Id,
                        Title,
                        Subject,
                        Teacher,
                        Semester,
                        AssignmentType,
                        Description,
                        FileName,
                        OriginalFileName,
                        PostedDate,
                        DueDate,
                        Status
                    FROM dbo.AssignmentQuestions
                    ORDER BY PostedDate DESC";

                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    con.Open();

                    using (SqlDataReader reader =
                        cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            assignments.Add(
                                ReadAssignment(reader)
                            );
                        }
                    }
                }
            }

            return assignments;
        }


        // =====================================================
        // GET ONE ASSIGNMENT
        // =====================================================

        public static AssignmentQuestion GetAssignment(int id)
        {
            using (SqlConnection con =
                new SqlConnection(ConnectionString))
            {
                string query = @"
                    SELECT
                        Id,
                        Title,
                        Subject,
                        Teacher,
                        Semester,
                        AssignmentType,
                        Description,
                        FileName,
                        OriginalFileName,
                        PostedDate,
                        DueDate,
                        Status
                    FROM dbo.AssignmentQuestions
                    WHERE Id = @Id";

                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                        "@Id",
                        SqlDbType.Int).Value = id;

                    con.Open();

                    using (SqlDataReader reader =
                        cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return ReadAssignment(reader);
                        }
                    }
                }
            }

            return null;
        }


        // =====================================================
        // READ ASSIGNMENT
        // =====================================================

        private static AssignmentQuestion ReadAssignment(
            SqlDataReader reader)
        {
            AssignmentQuestion assignment =
                new AssignmentQuestion();

            assignment.Id =
                Convert.ToInt32(reader["Id"]);

            assignment.Title =
                Convert.ToString(reader["Title"]);

            assignment.Subject =
                Convert.ToString(reader["Subject"]);

            assignment.Teacher =
                Convert.ToString(reader["Teacher"]);

            assignment.Semester =
                Convert.ToString(reader["Semester"]);

            assignment.AssignmentType =
                Convert.ToString(reader["AssignmentType"]);

            assignment.Description =
                Convert.ToString(reader["Description"]);

            assignment.FileName =
                Convert.ToString(reader["FileName"]);

            assignment.OriginalFileName =
                Convert.ToString(reader["OriginalFileName"]);

            assignment.PostedDate =
                reader["PostedDate"] == DBNull.Value
                    ? DateTime.Now
                    : Convert.ToDateTime(
                        reader["PostedDate"]);

            assignment.DueDate =
                reader["DueDate"] == DBNull.Value
                    ? DateTime.Now.AddDays(7)
                    : Convert.ToDateTime(
                        reader["DueDate"]);

            assignment.Status =
                Convert.ToString(reader["Status"]);

            return assignment;
        }


        // =====================================================
        // ADD ASSIGNMENT
        // =====================================================

        public static int AddAssignment(
            AssignmentQuestion assignment)
        {
            if (assignment == null)
            {
                throw new ArgumentNullException(
                    nameof(assignment));
            }

            using (SqlConnection con =
                new SqlConnection(ConnectionString))
            {
                string query = @"
                    INSERT INTO dbo.AssignmentQuestions
                    (
                        Title,
                        Subject,
                        Teacher,
                        Semester,
                        AssignmentType,
                        Description,
                        FileName,
                        OriginalFileName,
                        PostedDate,
                        DueDate,
                        Status
                    )
                    VALUES
                    (
                        @Title,
                        @Subject,
                        @Teacher,
                        @Semester,
                        @AssignmentType,
                        @Description,
                        @FileName,
                        @OriginalFileName,
                        @PostedDate,
                        @DueDate,
                        @Status
                    );

                    SELECT CAST(SCOPE_IDENTITY() AS INT);";

                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                        "@Title",
                        SqlDbType.NVarChar, 200).Value =
                        (object)assignment.Title ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@Subject",
                        SqlDbType.NVarChar, 100).Value =
                        (object)assignment.Subject ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@Teacher",
                        SqlDbType.NVarChar, 150).Value =
                        (object)assignment.Teacher ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@Semester",
                        SqlDbType.NVarChar, 100).Value =
                        (object)assignment.Semester ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@AssignmentType",
                        SqlDbType.NVarChar, 100).Value =
                        (object)assignment.AssignmentType ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@Description",
                        SqlDbType.NVarChar).Value =
                        (object)assignment.Description ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@FileName",
                        SqlDbType.NVarChar, 500).Value =
                        (object)assignment.FileName ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@OriginalFileName",
                        SqlDbType.NVarChar, 500).Value =
                        (object)assignment.OriginalFileName ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@PostedDate",
                        SqlDbType.DateTime).Value =
                        assignment.PostedDate;

                    cmd.Parameters.Add(
                        "@DueDate",
                        SqlDbType.DateTime).Value =
                        assignment.DueDate;

                    cmd.Parameters.Add(
                        "@Status",
                        SqlDbType.NVarChar, 50).Value =
                        string.IsNullOrWhiteSpace(
                            assignment.Status)
                        ? "Active"
                        : assignment.Status;

                    con.Open();

                    return Convert.ToInt32(
                        cmd.ExecuteScalar());
                }
            }
        }
        // =====================================================
        // ADD STUDENT SUBMISSION
        // =====================================================

        public static int AddSubmission(
            AssignmentSubmission submission)
        {
            if (submission == null)
            {
                throw new ArgumentNullException(
                    nameof(submission));
            }

            using (SqlConnection con =
                new SqlConnection(ConnectionString))
            {
                string query = @"
                    INSERT INTO dbo.AssignmentSubmissions
                    (
                        AssignmentId,
                        StudentName,
                        StudentEmail,
                        Note,
                        FileName,
                        OriginalFileName,
                        SubmittedDate,
                        Status,
                        Comment
                    )
                    VALUES
                    (
                        @AssignmentId,
                        @StudentName,
                        @StudentEmail,
                        @Note,
                        @FileName,
                        @OriginalFileName,
                        @SubmittedDate,
                        @Status,
                        @Comment
                    );

                    SELECT CAST(SCOPE_IDENTITY() AS INT);";

                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                        "@AssignmentId",
                        SqlDbType.Int).Value =
                        submission.AssignmentId;

                    cmd.Parameters.Add(
                        "@StudentName",
                        SqlDbType.NVarChar, 150).Value =
                        (object)submission.StudentName ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@StudentEmail",
                        SqlDbType.NVarChar, 200).Value =
                        (object)submission.StudentEmail ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@Note",
                        SqlDbType.NVarChar).Value =
                        (object)submission.Note ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@FileName",
                        SqlDbType.NVarChar, 500).Value =
                        (object)submission.FileName ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@OriginalFileName",
                        SqlDbType.NVarChar, 500).Value =
                        (object)submission.OriginalFileName ??
                        DBNull.Value;

                    cmd.Parameters.Add(
                        "@SubmittedDate",
                        SqlDbType.DateTime).Value =
                        submission.SubmittedDate;

                    cmd.Parameters.Add(
                        "@Status",
                        SqlDbType.NVarChar, 50).Value =
                        string.IsNullOrWhiteSpace(
                            submission.Status)
                        ? "Pending"
                        : submission.Status;

                    cmd.Parameters.Add(
                        "@Comment",
                        SqlDbType.NVarChar).Value =
                        (object)submission.Comment ??
                        DBNull.Value;

                    con.Open();

                    return Convert.ToInt32(
                        cmd.ExecuteScalar());
                }
            }
        }


        // =====================================================
        // GET SUBMISSIONS
        // =====================================================

        public static List<AssignmentSubmission>
            GetSubmissions(int? assignmentId = null)
        {
            List<AssignmentSubmission> submissions =
                new List<AssignmentSubmission>();

            using (SqlConnection con =
                new SqlConnection(ConnectionString))
            {
                string query = @"
                    SELECT
                        Id,
                        AssignmentId,
                        StudentName,
                        StudentEmail,
                        Note,
                        FileName,
                        OriginalFileName,
                        SubmittedDate,
                        Status,
                        Comment
                    FROM dbo.AssignmentSubmissions";

                if (assignmentId.HasValue)
                {
                    query += @"
                        WHERE AssignmentId = @AssignmentId";
                }

                query += @"
                    ORDER BY SubmittedDate DESC";

                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    if (assignmentId.HasValue)
                    {
                        cmd.Parameters.Add(
                            "@AssignmentId",
                            SqlDbType.Int).Value =
                            assignmentId.Value;
                    }

                    con.Open();

                    using (SqlDataReader reader =
                        cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            AssignmentSubmission submission =
                                new AssignmentSubmission();

                            submission.Id =
                                Convert.ToInt32(
                                    reader["Id"]);

                            submission.AssignmentId =
                                Convert.ToInt32(
                                    reader["AssignmentId"]);

                            submission.StudentName =
                                Convert.ToString(
                                    reader["StudentName"]);

                            submission.StudentEmail =
                                Convert.ToString(
                                    reader["StudentEmail"]);

                            submission.Note =
                                Convert.ToString(
                                    reader["Note"]);

                            submission.FileName =
                                Convert.ToString(
                                    reader["FileName"]);

                            submission.OriginalFileName =
                                Convert.ToString(
                                    reader["OriginalFileName"]);

                            submission.SubmittedDate =
                                Convert.ToDateTime(
                                    reader["SubmittedDate"]);

                            submission.Status =
                                Convert.ToString(
                                    reader["Status"]);

                            submission.Comment =
                                Convert.ToString(
                                    reader["Comment"]);

                            submissions.Add(
                                submission);
                        }
                    }
                }
            }

            return submissions;
        }
        public static int GetSubmissionCount(int assignmentId, string studentEmail)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = @"
            SELECT COUNT(*) FROM dbo.AssignmentSubmissions
            WHERE AssignmentId = @AssignmentId AND StudentEmail = @StudentEmail";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@AssignmentId", SqlDbType.Int).Value = assignmentId;
                    cmd.Parameters.Add("@StudentEmail", SqlDbType.NVarChar, 200).Value =
                        (object)studentEmail ?? DBNull.Value;

                    con.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        public static List<AssignmentSubmission> GetSubmissionsByStudent(string studentEmail)
        {
            List<AssignmentSubmission> submissions = new List<AssignmentSubmission>();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = @"
            SELECT Id, AssignmentId, StudentName, StudentEmail, Note, FileName,
                   OriginalFileName, SubmittedDate, Status, Comment
            FROM dbo.AssignmentSubmissions
            WHERE StudentEmail = @StudentEmail
            ORDER BY SubmittedDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@StudentEmail", SqlDbType.NVarChar, 200).Value =
                        (object)studentEmail ?? DBNull.Value;

                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            submissions.Add(new AssignmentSubmission
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                AssignmentId = Convert.ToInt32(reader["AssignmentId"]),
                                StudentName = Convert.ToString(reader["StudentName"]),
                                StudentEmail = Convert.ToString(reader["StudentEmail"]),
                                Note = Convert.ToString(reader["Note"]),
                                FileName = Convert.ToString(reader["FileName"]),
                                OriginalFileName = Convert.ToString(reader["OriginalFileName"]),
                                SubmittedDate = Convert.ToDateTime(reader["SubmittedDate"]),
                                Status = Convert.ToString(reader["Status"]),
                                Comment = Convert.ToString(reader["Comment"])
                            });
                        }
                    }
                }
            }

            return submissions;
        }
        // =====================================================
        // DELETE ASSIGNMENT
        // =====================================================

        public static bool DeleteAssignment(int id)
        {
            using (SqlConnection con =
                new SqlConnection(ConnectionString))
            {
                con.Open();

                using (SqlTransaction transaction =
                    con.BeginTransaction())
                {
                    try
                    {
                        // -----------------------------------------
                        // 1. DELETE STUDENT SUBMISSIONS
                        // -----------------------------------------

                        string deleteSubmissions = @"
                    DELETE FROM dbo.AssignmentSubmissions
                    WHERE AssignmentId = @AssignmentId";

                        using (SqlCommand cmd =
                            new SqlCommand(
                                deleteSubmissions,
                                con,
                                transaction))
                        {
                            cmd.Parameters.Add(
                                "@AssignmentId",
                                SqlDbType.Int).Value = id;

                            cmd.ExecuteNonQuery();
                        }


                        // -----------------------------------------
                        // 2. DELETE ASSIGNMENT
                        // -----------------------------------------

                        string deleteAssignment = @"
                    DELETE FROM dbo.AssignmentQuestions
                    WHERE Id = @Id";

                        int rowsDeleted;

                        using (SqlCommand cmd =
                            new SqlCommand(
                                deleteAssignment,
                                con,
                                transaction))
                        {
                            cmd.Parameters.Add(
                                "@Id",
                                SqlDbType.Int).Value = id;

                            rowsDeleted =
                                cmd.ExecuteNonQuery();
                        }


                        // -----------------------------------------
                        // 3. CHECK WHETHER ASSIGNMENT EXISTED
                        // -----------------------------------------

                        if (rowsDeleted != 1)
                        {
                            transaction.Rollback();

                            return false;
                        }


                        // -----------------------------------------
                        // 4. COMMIT
                        // -----------------------------------------

                        transaction.Commit();

                        return true;
                    }
                    catch
                    {
                        transaction.Rollback();

                        throw;
                    }
                }
            }
        }
        public static bool UpdateSubmissionReview(int submissionId, string status, string comment)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = @"
            UPDATE dbo.AssignmentSubmissions
            SET Status = @Status, Comment = @Comment
            WHERE Id = @Id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@Status", SqlDbType.NVarChar, 50).Value =
                        string.IsNullOrWhiteSpace(status) ? "Pending" : status;

                    cmd.Parameters.Add("@Comment", SqlDbType.NVarChar).Value =
                        (object)comment ?? DBNull.Value;

                    cmd.Parameters.Add("@Id", SqlDbType.Int).Value = submissionId;

                    con.Open();

                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected == 1;
                }
            }

        }
    }
}