using STUDYVAULT.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace STUDYVAULT
{
    public partial class ASSIGNMENTCLINICadmin : Page
    {
        private const string AssignmentStoragePath =
            "~/App_Data/Assignments";
        private const string SubmissionStoragePath = "~/App_Data/StudentAssignments"; 


        // =====================================================
        // PAGE LOAD
        // =====================================================

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearMessages();

                BindAssignments();

                BindSubmissionFilter();

                BindSubmissions();
            }
        }


        // =====================================================
        // POST ASSIGNMENT
        // =====================================================

        protected void btnPost_Click(
            object sender,
            EventArgs e)
        {
            ClearMessages();

            string storedFileName = null;
            string fullFilePath = null;

            try
            {
                // =================================================
                // TITLE
                // =================================================

                if (string.IsNullOrWhiteSpace(txtTitle.Text))
                {
                    ShowError(
                        "Please enter an assignment title."
                    );

                    return;
                }


                // =================================================
                // SUBJECT
                // =================================================

                if (string.IsNullOrWhiteSpace(txtSubject.Text))
                {
                    ShowError(
                        "Please enter the subject."
                    );

                    return;
                }


                // =================================================
                // TEACHER
                // =================================================

                if (string.IsNullOrWhiteSpace(txtTeacher.Text))
                {
                    ShowError(
                        "Please enter the teacher / lecturer name."
                    );

                    return;
                }


                // =================================================
                // DEADLINE
                // =================================================

                DateTime dueDate;

                if (!DateTime.TryParse(
                    txtDeadline.Text,
                    out dueDate))
                {
                    ShowError(
                        "Please select a valid submission deadline."
                    );

                    return;
                }


                // =================================================
                // FILE
                // =================================================

                if (!fileUpload.HasFile)
                {
                    ShowError(
                        "Please attach the assignment question file."
                    );

                    return;
                }


                // =================================================
                // SAVE FILE
                // =================================================

                storedFileName =
                    SaveAssignmentFile(fileUpload);


                string folderPath =
                    Server.MapPath(
                        AssignmentStoragePath
                    );


                if (string.IsNullOrWhiteSpace(folderPath))
                {
                    throw new Exception(
                        "The assignment storage folder could not be found."
                    );
                }


                fullFilePath =
                    Path.Combine(
                        folderPath,
                        storedFileName
                    );


                // =================================================
                // VERIFY FILE
                // =================================================

                if (!File.Exists(fullFilePath))
                {
                    throw new Exception(
                        "The assignment file could not be verified after upload."
                    );
                }


                // =================================================
                // CREATE ASSIGNMENT
                // =================================================

                AssignmentQuestion assignment =
                    new AssignmentQuestion();


                assignment.Title =
                    txtTitle.Text.Trim();


                assignment.Subject =
                    txtSubject.Text.Trim();


                assignment.Teacher =
                    txtTeacher.Text.Trim();


                assignment.Semester =
                    ddlSemester.SelectedValue;


                assignment.AssignmentType =
                    ddlAssignmentType.SelectedValue;


                assignment.Description =
                    txtDescription.Text.Trim();


                assignment.FileName =
                    storedFileName;


                assignment.OriginalFileName =
                    Path.GetFileName(
                        fileUpload.FileName
                    );


                assignment.PostedDate =
                    DateTime.Now;


                assignment.DueDate =
                    dueDate;


                assignment.Status =
                    "Active";


                // =================================================
                // SAVE TO DATABASE
                // =================================================

                int assignmentId =
                    AssignmentCatalog.AddAssignment(
                        assignment
                    );


                // =================================================
                // VERIFY DATABASE SAVE
                // =================================================

                AssignmentQuestion savedAssignment =
                    AssignmentCatalog.GetAssignment(
                        assignmentId
                    );


                if (savedAssignment == null)
                {
                    throw new Exception(
                        "The assignment file was uploaded, " +
                        "but the assignment could not be verified in the database."
                    );
                }


                // =================================================
                // VERIFY DATABASE FILE NAME
                // =================================================

                if (string.IsNullOrWhiteSpace(
                    savedAssignment.FileName))
                {
                    throw new Exception(
                        "The assignment was saved, " +
                        "but the file information was not saved correctly."
                    );
                }


                // =================================================
                // SUCCESS
                // =================================================

                ShowSuccess(
                    "✓ Assignment uploaded successfully!"
                );


                // =================================================
                // CLEAR FORM
                // =================================================

                txtTitle.Text = "";

                txtSubject.Text = "";

                txtTeacher.Text = "";

                txtDescription.Text = "";

                txtDeadline.Text = "";


                // =================================================
                // REFRESH ASSIGNMENTS
                // =================================================

                BindAssignments();


                // =================================================
                // REFRESH SUBMISSION FILTER
                // =================================================

                BindSubmissionFilter();


                // =================================================
                // REFRESH SUBMISSIONS
                // =================================================

                BindSubmissions();
            }
            catch (Exception ex)
            {
                // =================================================
                // DELETE ORPHANED FILE
                // =================================================

                if (!string.IsNullOrWhiteSpace(fullFilePath) &&
                    File.Exists(fullFilePath))
                {
                    try
                    {
                        File.Delete(fullFilePath);
                    }
                    catch
                    {
                        // Do not hide the original error.
                    }
                }


                // =================================================
                // SHOW ERROR
                // =================================================

                ShowError(
                    "✗ Assignment upload failed: " +
                    ex.Message
                );
            }
        }


        // =====================================================
        // SAVE ASSIGNMENT FILE
        // =====================================================

        private string SaveAssignmentFile(
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
                    AssignmentStoragePath
                );


            if (string.IsNullOrWhiteSpace(folderPath))
            {
                throw new Exception(
                    "Could not find the assignment folder."
                );
            }


            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }


            string originalFileName =
                Path.GetFileName(
                    upload.FileName
                );


            if (string.IsNullOrWhiteSpace(
                originalFileName))
            {
                throw new Exception(
                    "The selected file does not have a valid filename."
                );
            }


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


            if (!allowedExtensions.Contains(extension))
            {
                throw new Exception(
                    "This file type is not allowed."
                );
            }


            string storedFileName =
                Guid.NewGuid().ToString("N")
                + "_"
                + originalFileName;


            string fullPath =
                Path.Combine(
                    folderPath,
                    storedFileName
                );


            upload.SaveAs(fullPath);


            if (!File.Exists(fullPath))
            {
                throw new Exception(
                    "The file was not saved correctly."
                );
            }


            return storedFileName;
        }


        // =====================================================
        // BIND ASSIGNMENTS
        // =====================================================

        private void BindAssignments()
        {
            List<AssignmentQuestion> assignments =
                AssignmentCatalog.Assignments
                    .OrderByDescending(
                        x => x.PostedDate
                    )
                    .ToList();


            rptAssignments.DataSource =
                assignments;


            rptAssignments.DataBind();


            pnlNoAssignments.Visible =
                assignments.Count == 0;
        }


        // =====================================================
        // ASSIGNMENT REPEATER COMMAND
        // =====================================================

        protected void rptAssignments_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            int id;


            if (!int.TryParse(
                Convert.ToString(
                    e.CommandArgument),
                out id))
            {
                ShowError(
                    "Invalid assignment ID: " +
                    Convert.ToString(
                        e.CommandArgument)
                );

                return;
            }


            // =================================================
            // DOWNLOAD ASSIGNMENT
            // =================================================

            if (e.CommandName == "Download")
            {
                DownloadAssignment(id);

                return;
            }


            // =================================================
            // DELETE ASSIGNMENT
            // =================================================

            if (e.CommandName == "Delete")
            {
                DeleteAssignment(id);

                return;
            }
        }


        // =====================================================
        // DELETE ASSIGNMENT
        // =====================================================

        private void DeleteAssignment(int id)
        {
            try
            {
                // ---------------------------------------------
                // GET ASSIGNMENT BEFORE DELETE
                // ---------------------------------------------

                AssignmentQuestion assignment =
                    AssignmentCatalog.GetAssignment(id);


                if (assignment == null)
                {
                    ShowError(
                        "Assignment not found. ID = " +
                        id
                    );

                    return;
                }


                // ---------------------------------------------
                // DELETE FROM DATABASE
                // ---------------------------------------------

                bool deleted =
                    AssignmentCatalog.DeleteAssignment(id);


                if (!deleted)
                {
                    ShowError(
                        "The assignment was not deleted. " +
                        "No database record was affected. " +
                        "ID = " + id
                    );

                    return;
                }


                // ---------------------------------------------
                // VERIFY DATABASE DELETION
                // ---------------------------------------------

                AssignmentQuestion check =
                    AssignmentCatalog.GetAssignment(id);


                if (check != null)
                {
                    ShowError(
                        "The database still contains this assignment. " +
                        "ID = " + id
                    );

                    return;
                }


                // ---------------------------------------------
                // DELETE PHYSICAL FILE
                // ---------------------------------------------

                if (!string.IsNullOrWhiteSpace(
                    assignment.FileName))
                {
                    string folderPath =
                        Server.MapPath(
                            AssignmentStoragePath
                        );


                    if (!string.IsNullOrWhiteSpace(
                        folderPath))
                    {
                        string fileName =
                            Path.GetFileName(
                                assignment.FileName
                            );


                        string fullPath =
                            Path.Combine(
                                folderPath,
                                fileName
                            );


                        if (File.Exists(fullPath))
                        {
                            File.Delete(fullPath);
                        }
                    }
                }


                // ---------------------------------------------
                // REFRESH PAGE DATA
                // ---------------------------------------------

                BindAssignments();

                BindSubmissionFilter();

                BindSubmissions();


                // ---------------------------------------------
                // SUCCESS
                // ---------------------------------------------

                ShowSuccess(
                    "Assignment deleted successfully."
                );
            }
            catch (Exception ex)
            {
                ShowError(
                    "The assignment could not be deleted: " +
                    ex.Message
                );
            }
        }


        // =====================================================
        // DOWNLOAD ASSIGNMENT
        // =====================================================

        private void DownloadAssignment(int id)
        {
            AssignmentQuestion assignment =
                AssignmentCatalog.GetAssignment(id);


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
                    "This assignment has no file."
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
                    "The assignment storage folder could not be found."
                );

                return;
            }


            string fileName =
                Path.GetFileName(
                    assignment.FileName
                );


            string fullPath =
                Path.Combine(
                    folderPath,
                    fileName
                );


            if (!File.Exists(fullPath))
            {
                ShowError(
                    "The assignment file was not found on the server."
                );

                return;
            }


            string downloadName =
                Path.GetFileName(
                    assignment.OriginalFileName
                );


            if (string.IsNullOrWhiteSpace(
                downloadName))
            {
                downloadName =
                    fileName;
            }


            Response.Clear();

            Response.ClearHeaders();


            Response.ContentType =
                "application/octet-stream";


            Response.AddHeader(
                "Content-Disposition",
                "attachment; filename=\"" +
                downloadName.Replace("\"", "") +
                "\""
            );


            Response.TransmitFile(
                fullPath
            );


            Response.Flush();


            HttpContext.Current
                .ApplicationInstance
                .CompleteRequest();
        }


        // =====================================================
        // SUBMISSION FILTER
        // =====================================================

        private void BindSubmissionFilter()
        {
            ddlSubmissionFilter.Items.Clear();


            ddlSubmissionFilter.Items.Add(
                new ListItem(
                    "All Assignments",
                    ""
                )
            );


            List<AssignmentQuestion> assignments =
                AssignmentCatalog.Assignments
                    .OrderBy(
                        x => x.Title
                    )
                    .ToList();


            foreach (
                AssignmentQuestion assignment
                in assignments)
            {
                ddlSubmissionFilter.Items.Add(
                    new ListItem(
                        assignment.Title,
                        assignment.Id.ToString()
                    )
                );
            }
        }


        // =====================================================
        // SUBMISSIONS
        // =====================================================

        private void BindSubmissions()
        {
            string selectedValue = ddlSubmissionFilter.SelectedValue;

            int? assignmentId = null;
            if (!string.IsNullOrWhiteSpace(selectedValue))
            {
                int id;
                if (int.TryParse(selectedValue, out id))
                    assignmentId = id;
            }

            List<AssignmentSubmission> submissions = AssignmentCatalog.GetSubmissions(assignmentId);

            var attemptLookup = submissions
                .GroupBy(s => new { s.AssignmentId, s.StudentEmail })
                .SelectMany(g => g.OrderBy(s => s.SubmittedDate)
                    .Select((s, index) => new { s.Id, Attempt = index + 1 }))
                .ToDictionary(x => x.Id, x => x.Attempt);

            var result = submissions
                .OrderByDescending(s => s.SubmittedDate)
                .Select(s =>
                {
                    AssignmentQuestion assignment = AssignmentCatalog.GetAssignment(s.AssignmentId);

                    return new
                    {
                        s.Id,
                        s.AssignmentId,
                        s.StudentName,
                        s.StudentEmail,
                        s.Note,
                        s.FileName,
                        s.OriginalFileName,
                        s.SubmittedDate,
                        s.Status,
                        s.Comment,
                        AttemptNumber = attemptLookup.ContainsKey(s.Id) ? attemptLookup[s.Id] : 1,
                        AssignmentTitle = assignment == null ? "Unknown Assignment" : assignment.Title
                    };
                })
                .ToList();

            rptSubmissions.DataSource = result;
            rptSubmissions.DataBind();

            pnlNoSubmissions.Visible = result.Count == 0;
        }


        // =====================================================
        // SUBMISSION FILTER CHANGED
        // =====================================================

        protected void ddlSubmissionFilter_Changed(
            object sender,
            EventArgs e)
        {
            BindSubmissions();
        }


        // =====================================================
        // SUBMISSION REPEATER COMMAND
        // =====================================================

        protected void rptSubmissions_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            int submissionId;


            if (!int.TryParse(
                Convert.ToString(
                    e.CommandArgument),
                out submissionId))
            {
                ShowError(
                    "Invalid submission ID: " +
                    Convert.ToString(
                        e.CommandArgument)
                );

                return;
            }


            // =================================================
            // DOWNLOAD SUBMISSION
            // =================================================

            if (e.CommandName == "Download")
            {
                DownloadSubmission(
                    submissionId
                );

                return;
            }


            // =================================================
            // SAVE REVIEW
            // =================================================

            if (e.CommandName == "SaveReview")
            {
                SaveReview(
                    e.Item,
                    submissionId
                );

                return;
            }
        }


        // =====================================================
        // DOWNLOAD SUBMISSION
        // =====================================================

        private void DownloadSubmission(int submissionId)
        {
            List<AssignmentSubmission> submissions = AssignmentCatalog.GetSubmissions();

            AssignmentSubmission submission = submissions.FirstOrDefault(x => x.Id == submissionId);

            if (submission == null)
            {
                ShowError("Submission not found.");
                return;
            }

            if (string.IsNullOrWhiteSpace(submission.FileName))
            {
                ShowError("This submission has no file.");
                return;
            }

            string folderPath = Server.MapPath(SubmissionStoragePath);   // ← changed from AssignmentStoragePath

            if (string.IsNullOrWhiteSpace(folderPath))
            {
                ShowError("The assignment storage folder could not be found.");
                return;
            }

            string fileName = Path.GetFileName(submission.FileName);
            string fullPath = Path.Combine(folderPath, fileName);

            if (!File.Exists(fullPath))
            {
                ShowError("The submission file was not found on the server.");
                return;
            }

            string downloadName = Path.GetFileName(submission.OriginalFileName);

            if (string.IsNullOrWhiteSpace(downloadName))
            {
                downloadName = fileName;
            }

            Response.Clear();
            Response.ClearHeaders();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=\"" + downloadName.Replace("\"", "") + "\"");
            Response.TransmitFile(fullPath);
            Response.Flush();

            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }

        // =====================================================
        // SAVE REVIEW
        // =====================================================

        private void SaveReview(RepeaterItem item, int submissionId)
        {
            DropDownList ddlStatus = item.FindControl("ddlStatus") as DropDownList;
            TextBox txtComment = item.FindControl("txtComment") as TextBox;

            if (ddlStatus == null)
            {
                ShowError("Status control was not found.");
                return;
            }

            if (txtComment == null)
            {
                ShowError("Comment control was not found.");
                return;
            }

            string status = ddlStatus.SelectedValue;
            string comment = txtComment.Text.Trim();

            bool updated = AssignmentCatalog.UpdateSubmissionReview(submissionId, status, comment);

            if (!updated)
            {
                ShowError("The review could not be saved. Submission ID = " + submissionId);
                return;
            }

            BindSubmissions();

            ShowSuccess("Feedback saved successfully.");
        }


        // =====================================================
        // SUCCESS
        // =====================================================

        private void ShowSuccess(
            string message)
        {
            lblConfirmationText.Text =
                message;


            pnlConfirmation.Visible =
                true;


            pnlError.Visible =
                false;
        }


        // =====================================================
        // ERROR
        // =====================================================

        private void ShowError(
            string message)
        {
            lblError.Text =
                message;


            pnlError.Visible =
                true;


            pnlConfirmation.Visible =
                false;
        }


        // =====================================================
        // CLEAR MESSAGES
        // =====================================================

        private void ClearMessages()
        {
            pnlConfirmation.Visible =
                false;


            pnlError.Visible =
                false;


            lblConfirmationText.Text =
                "";


            lblError.Text =
                "";
        }


        // =====================================================
        // LOGOUT
        // =====================================================

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}