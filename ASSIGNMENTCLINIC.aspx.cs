using STUDYVAULT.Models;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease.Activities;

namespace STUDYVAULT
{
    public partial class ASSIGNMENTCLINIC : Page
    {
        // =====================================================
        // STORAGE
        // =====================================================

        private const string AssignmentStoragePath =
            "~/App_Data/Assignments";

        private const string SubmissionStoragePath =
            "~/App_Data/StudentAssignments";


        // =====================================================
        // PAGE LOAD
        // =====================================================

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearMessages();
                BindAssignments();
                BindFilters();
                BindAssignmentDropdown();
                BindMySubmissions();   
            }
        }
        // =====================================================
        // LOAD ASSIGNMENTS
        // =====================================================

        private void BindAssignments()
        {
            var assignments = AssignmentCatalog.Assignments
                .OrderByDescending(a => a.PostedDate)
                .Select(a => new
                {
                    a.Id,
                    a.Title,
                    a.Subject,
                    a.Teacher,
                    a.Semester,
                    a.AssignmentType,
                    a.Description,
                    a.FileName,
                    a.OriginalFileName,
                    a.Status,

                    StatusKey =
                        string.IsNullOrWhiteSpace(a.Status)
                            ? "active"
                            : a.Status
                                .ToLower()
                                .Replace(" ", "-"),

                    DueDateDisplay =
                        a.DueDate.ToString("dd MMM yyyy")
                })
                .ToList();

            rptAssignments.DataSource = assignments;
            rptAssignments.DataBind();
        }


        // =====================================================
        // ASSIGNMENT DROPDOWN
        // =====================================================

        private void BindAssignmentDropdown()
        {
            ddlAssignment.Items.Clear();

            ddlAssignment.Items.Add(
                new ListItem(
                    "-- Select Assignment --",
                    ""
                )
            );

            foreach (var assignment in AssignmentCatalog.Assignments
                .OrderByDescending(a => a.PostedDate))
            {
                ddlAssignment.Items.Add(
                    new ListItem(
                        assignment.Title +
                        " - " +
                        assignment.Subject,
                        assignment.Id.ToString()
                    )
                );
            }
        }


        // =====================================================
        // FILTER DROPDOWNS
        // =====================================================

        private void BindFilters()
        {
            // -----------------------------
            // SEMESTER
            // -----------------------------

            ddlSemesterFilter.Items.Clear();

            ddlSemesterFilter.Items.Add(
                new ListItem(
                    "All Semesters",
                    ""
                )
            );

            var semesters = AssignmentCatalog.Assignments
                .Select(a => a.Semester)
                .Where(s => !string.IsNullOrWhiteSpace(s))
                .Distinct()
                .OrderBy(s => s);

            foreach (string semester in semesters)
            {
                ddlSemesterFilter.Items.Add(
                    new ListItem(
                        semester,
                        semester
                    )
                );
            }


            // -----------------------------
            // SUBJECT
            // -----------------------------

            ddlSubjectFilter.Items.Clear();

            ddlSubjectFilter.Items.Add(
                new ListItem(
                    "All Subjects",
                    ""
                )
            );

            var subjects = AssignmentCatalog.Assignments
                .Select(a => a.Subject)
                .Where(s => !string.IsNullOrWhiteSpace(s))
                .Distinct()
                .OrderBy(s => s);

            foreach (string subject in subjects)
            {
                ddlSubjectFilter.Items.Add(
                    new ListItem(
                        subject,
                        subject
                    )
                );
            }
        }


        // =====================================================
        // FILTER ASSIGNMENTS
        // =====================================================

        protected void FilterAssignments(
            object sender,
            EventArgs e)
        {
            string semester =
                ddlSemesterFilter.SelectedValue;

            string subject =
                ddlSubjectFilter.SelectedValue;

            var query =
                AssignmentCatalog.Assignments.AsEnumerable();


            if (!string.IsNullOrWhiteSpace(semester))
            {
                query = query.Where(
                    a => a.Semester == semester
                );
            }


            if (!string.IsNullOrWhiteSpace(subject))
            {
                query = query.Where(
                    a => a.Subject == subject
                );
            }


            var assignments = query
                .OrderByDescending(a => a.PostedDate)
                .Select(a => new
                {
                    a.Id,
                    a.Title,
                    a.Subject,
                    a.Teacher,
                    a.Semester,
                    a.AssignmentType,
                    a.Description,
                    a.FileName,
                    a.OriginalFileName,
                    a.Status,

                    StatusKey =
                        string.IsNullOrWhiteSpace(a.Status)
                            ? "active"
                            : a.Status
                                .ToLower()
                                .Replace(" ", "-"),

                    DueDateDisplay =
                        a.DueDate.ToString("dd MMM yyyy")
                })
                .ToList();


            rptAssignments.DataSource =
                assignments;

            rptAssignments.DataBind();
        }


        // =====================================================
        // REPEATER COMMAND
        // =====================================================

        protected void rptAssignments_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            int assignmentId;

            if (!int.TryParse(
                Convert.ToString(e.CommandArgument),
                out assignmentId))
            {
                ShowError(
                    "Invalid assignment selected."
                );

                return;
            }


            AssignmentQuestion assignment =
                AssignmentCatalog.GetAssignment(
                    assignmentId
                );


            if (assignment == null)
            {
                ShowError(
                    "Assignment not found."
                );

                return;
            }


            if (string.Equals(
                e.CommandName,
                "Download",
                StringComparison.OrdinalIgnoreCase))
            {
                DownloadAssignment(assignment);
            }
        }


        // =====================================================
        // DOWNLOAD TEACHER ASSIGNMENT
        // =====================================================

        private void DownloadAssignment(
            AssignmentQuestion assignment)
        {
            if (assignment == null)
            {
                ShowError(
                    "Assignment not found."
                );

                return;
            }


            if (string.IsNullOrWhiteSpace(
                assignment.FileName))
            {
                ShowError(
                    "No file has been uploaded for this assignment."
                );

                return;
            }


            string folderPath =
                Server.MapPath(
                    AssignmentStoragePath
                );


            if (string.IsNullOrWhiteSpace(folderPath))
            {
                ShowError(
                    "Assignment storage folder could not be found."
                );

                return;
            }


            string safeFileName =
                Path.GetFileName(
                    assignment.FileName
                );


            string filePath =
                Path.Combine(
                    folderPath,
                    safeFileName
                );


            if (!File.Exists(filePath))
            {
                ShowError(
                    "The assignment file was not found on the server."
                );

                return;
            }


            try
            {
                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();


                string extension =
                    Path.GetExtension(
                        safeFileName
                    ).ToLowerInvariant();


                SetContentType(extension);


                string downloadName =
                    !string.IsNullOrWhiteSpace(
                        assignment.OriginalFileName
                    )
                    ? Path.GetFileName(
                        assignment.OriginalFileName
                    )
                    : safeFileName;


                Response.AddHeader(
                    "Content-Disposition",
                    "attachment; filename=\"" +
                    downloadName +
                    "\""
                );


                Response.AddHeader(
                    "Content-Length",
                    new FileInfo(filePath)
                        .Length
                        .ToString()
                );


                Response.TransmitFile(filePath);


                HttpContext.Current
                    .ApplicationInstance
                    .CompleteRequest();
            }
            catch
            {
                ShowError(
                    "The assignment file could not be downloaded."
                );
            }
        }


        // =====================================================
        // FILE CONTENT TYPE
        // =====================================================

        private void SetContentType(
            string extension)
        {
            switch (extension)
            {
                case ".pdf":
                    Response.ContentType =
                        "application/pdf";
                    break;

                case ".doc":
                    Response.ContentType =
                        "application/msword";
                    break;

                case ".docx":
                    Response.ContentType =
                        "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
                    break;

                case ".xls":
                    Response.ContentType =
                        "application/vnd.ms-excel";
                    break;

                case ".xlsx":
                    Response.ContentType =
                        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    break;

                case ".ppt":
                    Response.ContentType =
                        "application/vnd.ms-powerpoint";
                    break;

                case ".pptx":
                    Response.ContentType =
                        "application/vnd.openxmlformats-officedocument.presentationml.presentation";
                    break;

                case ".txt":
                    Response.ContentType =
                        "text/plain";
                    break;

                case ".jpg":
                case ".jpeg":
                    Response.ContentType =
                        "image/jpeg";
                    break;

                case ".png":
                    Response.ContentType =
                        "image/png";
                    break;

                case ".zip":
                    Response.ContentType =
                        "application/zip";
                    break;

                default:
                    Response.ContentType =
                        "application/octet-stream";
                    break;
            }
        }


        // =====================================================
        // STUDENT SUBMISSION
        // =====================================================

        protected void btnUpload_Click(
            object sender,
            EventArgs e)
        {
            ClearMessages();


            // -----------------------------
            // CHECK ASSIGNMENT
            // -----------------------------

            if (ddlAssignment == null ||
                string.IsNullOrWhiteSpace(
                    ddlAssignment.SelectedValue))
            {
                ShowError(
                    "Please select an assignment."
                );

                return;
            }


            // -----------------------------
            // CHECK FILE
            // -----------------------------

            if (fileUpload == null ||
                !fileUpload.HasFile)
            {
                ShowError(
                    "Please select your assignment file."
                );

                return;
            }


            // -----------------------------
            // GET ASSIGNMENT ID
            // -----------------------------

            int assignmentId;

            if (!int.TryParse(
                ddlAssignment.SelectedValue,
                out assignmentId))
            {
                ShowError(
                    "Invalid assignment selected."
                );

                return;
            }


            AssignmentQuestion assignment =
                AssignmentCatalog.GetAssignment(
                    assignmentId
                );


            if (assignment == null)
            {
                ShowError(
                    "The selected assignment could not be found."
                );

                return;
            }


            // -----------------------------
            // CHECK DEADLINE
            // -----------------------------

            if (DateTime.Now.Date >
                assignment.DueDate.Date)
            {
                ShowError(
                    "The submission deadline for this assignment has passed."
                );

                return;
            }
            // -----------------------------
            // STUDENT INFORMATION
            // -----------------------------
            
            string studentName =
                Convert.ToString(
                    Session["StudentName"]
                );

            string studentEmail =
                Convert.ToString(
                    Session["Email"]
                );

            if (string.IsNullOrWhiteSpace(studentName))
            {
                studentName =
                    Convert.ToString(
                        Session["Name"]
                    );
            }

            if (string.IsNullOrWhiteSpace(studentEmail))
            {
                studentEmail =
                    Convert.ToString(
                        Session["StudentEmail"]
                    );
            }

            if (string.IsNullOrWhiteSpace(studentName))
            {
                studentName = "Student";
            }

            if (string.IsNullOrWhiteSpace(studentEmail))
            {
                studentEmail = "Not provided";
            }


            // -----------------------------
            // CHECK SUBMISSION LIMIT
            // -----------------------------

            int existingCount =
                AssignmentCatalog.GetSubmissionCount(
                    assignmentId,
                    studentEmail
                );

            if (existingCount >= MaxSubmissionsPerAssignment)
            {
                ShowError(
                    "You have already submitted this assignment " +
                    MaxSubmissionsPerAssignment +
                    " times. No further submissions are allowed."
                );

                return;
            }
            // -----------------------------
            // SAVE FILE
            // -----------------------------

            string storedFileName;

            try
            {
                storedFileName =
                    SaveStudentFile(fileUpload);
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
                return;
            }


            // -----------------------------
            // CREATE SUBMISSION
            // -----------------------------
            AssignmentSubmission submission =
                new AssignmentSubmission
                {
                    AssignmentId = assignmentId,
                    StudentName = studentName,
                    StudentEmail = studentEmail,
                    Note = txtSubmissionNote.Text.Trim(),
                    FileName = storedFileName,
                    OriginalFileName = Path.GetFileName(fileUpload.FileName),
                    SubmittedDate = DateTime.Now,
                    Status = "Pending",
                    Comment = ""
                };

            int submissionId = AssignmentCatalog.AddSubmission(submission);

            ShowSuccess(
                "Your assignment has been uploaded successfully. " +
                "The administrator has been notified."
            );


            // -----------------------------
            // CLEAR FORM
            // -----------------------------

            ddlAssignment.SelectedIndex = 0;

            txtSubmissionNote.Text = "";

            BindAssignments();

            BindMySubmissions();
        }
        private const int MaxSubmissionsPerAssignment = 3;

        // =====================================================
        // SAVE STUDENT FILE
        // =====================================================

        private string SaveStudentFile(
            FileUpload upload)
        {

            if (upload == null ||
                !upload.HasFile)
            {
                throw new Exception(
                    "Please select a file."
                );
            }


            string folderPath =
                Server.MapPath(
                    SubmissionStoragePath
                );


            if (string.IsNullOrWhiteSpace(folderPath))
            {
                throw new Exception(
                    "Student submission folder could not be found."
                );
            }


            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(
                    folderPath
                );
            }


            string originalFileName =
                Path.GetFileName(
                    upload.FileName
                );


            string extension =
                Path.GetExtension(
                    originalFileName
                ).ToLowerInvariant();


            string[] allowedExtensions =
            {
                ".pdf",
                ".doc",
                ".docx",
                ".xls",
                ".xlsx",
                ".ppt",
                ".pptx",
                ".txt",
                ".jpg",
                ".jpeg",
                ".png",
                ".zip"
            };


            if (!allowedExtensions.Contains(
                extension))
            {
                throw new Exception(
                    "This file type is not allowed."
                );
            }


            string storedFileName =
                Guid.NewGuid()
                    .ToString("N")
                + "_"
                + originalFileName;


            string fullPath =
                Path.Combine(
                    folderPath,
                    storedFileName
                );


            upload.SaveAs(fullPath);



            return storedFileName;
        }



        // =====================================================
        // SUCCESS
        // =====================================================

        private void ShowSuccess(
            string message)
        {
            lblSuccess.Text = message;

            pnlSuccess.Visible = true;

            pnlError.Visible = false;
        }


        // =====================================================
        // ERROR
        // =====================================================

        private void ShowError(
            string message)
        {
            lblError.Text = message;

            pnlError.Visible = true;

            pnlSuccess.Visible = false;
        }
        private void BindMySubmissions()
        {
            string studentEmail =
                Convert.ToString(Session["Email"]);

            if (string.IsNullOrWhiteSpace(studentEmail))
            {
                studentEmail =
                    Convert.ToString(Session["StudentEmail"]);
            }

            // If the user is not logged in, show no submissions.
            if (string.IsNullOrWhiteSpace(studentEmail))
            {
                rptMySubmissions.DataSource = null;
                rptMySubmissions.DataBind();

                pnlNoMySubmissions.Visible = true;

                return;
            }

            var mySubmissions =
                AssignmentCatalog
                    .GetSubmissionsByStudent(studentEmail)
                    .Select(s =>
                    {
                        AssignmentQuestion assignment =
                            AssignmentCatalog.GetAssignment(
                                s.AssignmentId
                            );

                        return new
                        {
                            s.SubmittedDate,
                            s.Status,
                            s.Comment,

                            AssignmentTitle =
                                assignment == null
                                    ? "(assignment removed)"
                                    : assignment.Title
                        };
                    })
                    .ToList();

            rptMySubmissions.DataSource =
                mySubmissions;

            rptMySubmissions.DataBind();

            pnlNoMySubmissions.Visible =
                mySubmissions.Count == 0;
        }

        // =====================================================
        // CLEAR MESSAGES
        // =====================================================

        private void ClearMessages()
        {
            pnlError.Visible = false;
            pnlSuccess.Visible = false;

            lblError.Text = "";
            lblSuccess.Text = "";
        }
    }
}