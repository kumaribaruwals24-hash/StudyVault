using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace STUDYVAULT
{
    public partial class AdminVideoTutorials : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // =====================================================
            // ADMIN SECURITY
            // =====================================================

            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindVideos();
                SetAddMode();
            }
        }


        // =========================================================
        // READ
        // =========================================================

        private void BindVideos()
        {
            var videos =
                VideoCatalog.GetAllVideos();

            rptVideos.DataSource =
                videos;

            rptVideos.DataBind();

            pnlNoVideos.Visible =
                videos.Count == 0;
        }


        // =========================================================
        // CREATE
        // =========================================================

        protected void btnAdd_Click(
            object sender,
            EventArgs e)
        {
            pnlError.Visible = false;
            pnlConfirmation.Visible = false;

            // TITLE
            if (string.IsNullOrWhiteSpace(txtTitle.Text))
            {
                ShowError("Please enter a title.");
                return;
            }

            // YOUTUBE URL
            if (string.IsNullOrWhiteSpace(txtYouTubeUrl.Text))
            {
                ShowError("Please enter a YouTube video link.");
                return;
            }

            string youtubeUrl =
                txtYouTubeUrl.Text.Trim();

            // Validate YouTube URL
            if (!IsValidYouTubeUrl(youtubeUrl))
            {
                ShowError(
                    "Please enter a valid YouTube link."
                );

                return;
            }

            // TOPICS
            var topics =
                GetTopics();

            // CREATE VIDEO OBJECT
            VideoItem video =
                new VideoItem
                {
                    Title =
                        txtTitle.Text.Trim(),

                    Category =
                        ddlCategory.SelectedValue,

                    CategoryLabel =
                        ddlCategory.SelectedItem.Text,

                    Level =
                        ddlLevel.SelectedValue,

                    Duration =
                        txtDuration.Text.Trim(),

                    Instructor =
                        string.IsNullOrWhiteSpace(
                            txtInstructor.Text)
                            ? "StudyVault Faculty"
                            : txtInstructor.Text.Trim(),

                    UploadDate =
                        DateTime.Now,

                    Description =
                        txtDescription.Text.Trim(),

                    Topics =
                        topics,

                    YouTubeUrl =
                        youtubeUrl,

                    IsFeatured =
                        chkFeatured.Checked
                };

            try
            {
                VideoCatalog.AddVideo(video);
            }
            catch (Exception)
            {
                ShowError(
                    "The video could not be added."
                );

                return;
            }

            ShowSuccess(
                "Video added successfully."
            );

            ClearForm();

            SetAddMode();

            BindVideos();
        }


        // =========================================================
        // ITEM COMMAND
        // =========================================================

        protected void rptVideos_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            int id;

            if (!int.TryParse(
                Convert.ToString(e.CommandArgument),
                out id))
            {
                ShowError(
                    "Invalid video selected."
                );

                return;
            }

            // EDIT
            if (e.CommandName == "Edit")
            {
                LoadVideoForEdit(id);
                return;
            }

            // FEATURE / UNFEATURE
            if (e.CommandName == "ToggleFeatured")
            {
                ToggleFeatured(id);
                return;
            }

            // DELETE
            if (e.CommandName == "Delete")
            {
                DeleteVideo(id);
                return;
            }
        }


        // =========================================================
        // LOAD VIDEO FOR EDIT
        // =========================================================

        private void LoadVideoForEdit(int id)
        {
            var video =
                VideoCatalog.GetById(id);

            if (video == null)
            {
                ShowError(
                    "Video not found."
                );

                return;
            }

            // Store ID
            hfVideoId.Value =
                video.Id.ToString();

            // TITLE
            txtTitle.Text =
                video.Title;

            // CATEGORY
            if (ddlCategory.Items.FindByValue(
                video.Category) != null)
            {
                ddlCategory.SelectedValue =
                    video.Category;
            }

            // LEVEL
            if (ddlLevel.Items.FindByValue(
                video.Level) != null)
            {
                ddlLevel.SelectedValue =
                    video.Level;
            }

            // OTHER INFORMATION
            txtDuration.Text =
                video.Duration;

            txtInstructor.Text =
                video.Instructor;

            txtDescription.Text =
                video.Description;

            // YOUTUBE URL
            txtYouTubeUrl.Text =
                video.YouTubeUrl;

            // TOPICS
            if (video.Topics != null)
            {
                txtTopics.Text =
                    string.Join(
                        ", ",
                        video.Topics
                    );
            }
            else
            {
                txtTopics.Text = "";
            }

            // FEATURED
            chkFeatured.Checked =
                video.IsFeatured;

            // CHANGE MODE
            btnAdd.Visible = false;

            btnUpdate.Visible = true;

            btnCancelEdit.Visible = true;

            lblFormTitle.Text =
                "Edit Video";

            ShowSuccess(
                "Video loaded. Make your changes and click Update."
            );
        }


        // =========================================================
        // UPDATE
        // =========================================================

        protected void btnUpdate_Click(
            object sender,
            EventArgs e)
        {
            pnlError.Visible = false;
            pnlConfirmation.Visible = false;

            int id;

            if (!int.TryParse(
                hfVideoId.Value,
                out id))
            {
                ShowError(
                    "Invalid video selected."
                );

                return;
            }

            var video =
                VideoCatalog.GetById(id);

            if (video == null)
            {
                ShowError(
                    "Video not found."
                );

                return;
            }

            // TITLE
            if (string.IsNullOrWhiteSpace(
                txtTitle.Text))
            {
                ShowError(
                    "Please enter a title."
                );

                return;
            }

            // YOUTUBE URL
            if (string.IsNullOrWhiteSpace(
                txtYouTubeUrl.Text))
            {
                ShowError(
                    "Please enter a YouTube video link."
                );

                return;
            }

            string youtubeUrl =
                txtYouTubeUrl.Text.Trim();

            if (!IsValidYouTubeUrl(youtubeUrl))
            {
                ShowError(
                    "Please enter a valid YouTube link."
                );

                return;
            }

            // UPDATE INFORMATION
            video.Title =
                txtTitle.Text.Trim();

            video.Category =
                ddlCategory.SelectedValue;

            video.CategoryLabel =
                ddlCategory.SelectedItem.Text;

            video.Level =
                ddlLevel.SelectedValue;

            video.Duration =
                txtDuration.Text.Trim();

            video.Instructor =
                string.IsNullOrWhiteSpace(
                    txtInstructor.Text)
                    ? "StudyVault Faculty"
                    : txtInstructor.Text.Trim();

            video.Description =
                txtDescription.Text.Trim();

            video.Topics =
                GetTopics();

            video.YouTubeUrl =
                youtubeUrl;

            video.IsFeatured =
                chkFeatured.Checked;

            bool updated;

            try
            {
                updated =
                    VideoCatalog.UpdateVideo(video);
            }
            catch (Exception)
            {
                ShowError(
                    "The video could not be updated."
                );

                return;
            }

            if (!updated)
            {
                ShowError(
                    "The video could not be updated."
                );

                return;
            }

            ShowSuccess(
                "Video updated successfully."
            );

            ClearForm();

            SetAddMode();

            BindVideos();
        }


        // =========================================================
        // DELETE
        // =========================================================

        private void DeleteVideo(int id)
        {
            var video =
                VideoCatalog.GetById(id);

            if (video == null)
            {
                ShowError(
                    "Video not found."
                );

                BindVideos();

                return;
            }

            bool deleted;

            try
            {
                deleted =
                    VideoCatalog.DeleteVideo(id);
            }
            catch (Exception)
            {
                ShowError(
                    "The video could not be deleted."
                );

                BindVideos();

                return;
            }

            if (!deleted)
            {
                ShowError(
                    "The video could not be deleted."
                );

                BindVideos();

                return;
            }

            ShowSuccess(
                "Video deleted successfully."
            );

            BindVideos();
        }


        // =========================================================
        // FEATURE / UNFEATURE
        // =========================================================

        private void ToggleFeatured(int id)
        {
            var video =
                VideoCatalog.GetById(id);

            if (video == null)
            {
                ShowError(
                    "Video not found."
                );

                BindVideos();

                return;
            }

            video.IsFeatured =
                !video.IsFeatured;

            bool updated;

            try
            {
                updated =
                    VideoCatalog.UpdateVideo(video);
            }
            catch (Exception)
            {
                ShowError(
                    "The video could not be updated."
                );

                BindVideos();

                return;
            }

            if (!updated)
            {
                ShowError(
                    "The video could not be updated."
                );

                BindVideos();

                return;
            }

            ShowSuccess(
                video.IsFeatured
                    ? "Video marked as featured."
                    : "Video unfeatured."
            );

            BindVideos();
        }


        // =========================================================
        // TOPICS
        // =========================================================

        private System.Collections.Generic.List<string>
            GetTopics()
        {
            return (txtTopics.Text ?? "")
                .Split(',')
                .Select(t => t.Trim())
                .Where(t =>
                    !string.IsNullOrWhiteSpace(t))
                .ToList();
        }


        // =========================================================
        // YOUTUBE URL VALIDATION
        // =========================================================

        private bool IsValidYouTubeUrl(
            string url)
        {
            if (string.IsNullOrWhiteSpace(url))
            {
                return false;
            }

            Uri uri;

            if (!Uri.TryCreate(
                url,
                UriKind.Absolute,
                out uri))
            {
                return false;
            }

            string host =
                uri.Host.ToLowerInvariant();

            return
                host == "youtube.com" ||
                host == "www.youtube.com" ||
                host == "m.youtube.com" ||
                host == "youtu.be" ||
                host == "www.youtu.be";
        }


        // =========================================================
        // CLEAR FORM
        // =========================================================

        private void ClearForm()
        {
            hfVideoId.Value = "";

            txtTitle.Text = "";

            txtDuration.Text = "";

            txtInstructor.Text = "";

            txtDescription.Text = "";

            txtTopics.Text = "";

            txtYouTubeUrl.Text = "";

            chkFeatured.Checked = false;

            if (ddlCategory.Items.Count > 0)
            {
                ddlCategory.SelectedIndex = 0;
            }

            if (ddlLevel.Items.Count > 0)
            {
                ddlLevel.SelectedIndex = 0;
            }
        }


        // =========================================================
        // ADD MODE
        // =========================================================

        private void SetAddMode()
        {
            btnAdd.Visible = true;

            btnUpdate.Visible = false;

            btnCancelEdit.Visible = false;

            lblFormTitle.Text =
                "Add Video";

            hfVideoId.Value = "";
        }


        // =========================================================
        // CANCEL EDIT
        // =========================================================

        protected void btnCancelEdit_Click(
            object sender,
            EventArgs e)
        {
            ClearForm();

            SetAddMode();

            pnlError.Visible = false;

            pnlConfirmation.Visible = false;
        }


        // =========================================================
        // SUCCESS MESSAGE
        // =========================================================

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


        // =========================================================
        // ERROR MESSAGE
        // =========================================================

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


        // =========================================================
        // LOGOUT
        // =========================================================

        protected void btnLogout_Click(
            object sender,
            EventArgs e)
        {
            Session.Clear();

            Session.Abandon();

            Response.Redirect(
                "~/Login.aspx"
            );
        }
    }
}