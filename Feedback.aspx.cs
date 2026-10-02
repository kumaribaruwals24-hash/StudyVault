using System;
using System.Web.UI;

namespace STUDYVAULT
{
    public partial class Feedback : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Session["FullName"]?.ToString() ?? "Student";

            avatarCircle.InnerText = GetInitials(name);
            avatarCircle.Attributes["title"] = name;

            if (!IsPostBack)
            {
                txtName.Text = name;
            }

            LoadMyFeedback();
        }

        // =========================================================
        // GET INITIALS
        // =========================================================
        private string GetInitials(string fullName)
        {
            var parts = fullName
                .Trim()
                .Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

            if (parts.Length == 0)
                return "S";

            if (parts.Length == 1)
                return parts[0].Substring(0, 1).ToUpper();

            return (
                parts[0].Substring(0, 1) +
                parts[parts.Length - 1].Substring(0, 1)
            ).ToUpper();
        }

        // =========================================================
        // LOAD STUDENT'S OWN FEEDBACK
        // =========================================================
        private void LoadMyFeedback()
        {
            if (Session["UserId"] == null)
            {
                pnlMyFeedback.Visible = false;
                return;
            }

            int userId;

            if (!int.TryParse(
                Session["UserId"].ToString(),
                out userId))
            {
                pnlMyFeedback.Visible = false;
                return;
            }

            var feedbackList =
                FeedbackCatalog.GetFeedbackByUser(userId);

            rptMyFeedback.DataSource = feedbackList;
            rptMyFeedback.DataBind();

            pnlNoFeedback.Visible =
                feedbackList.Count == 0;
        }

        // =========================================================
        // SUBMIT FEEDBACK
        // =========================================================
        protected void btnSubmitFeedback_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            int userId;

            if (!int.TryParse(
                Session["UserId"].ToString(),
                out userId))
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            string userName =
                Session["FullName"]?.ToString() ?? "Student";

            string email =
                txtEmail.Text.Trim();

            string category =
                ddlCategory.SelectedValue;

            string message =
                txtMessage.Text.Trim();

            int rating =
                GetSelectedRating();

            FeedbackCatalog.AddFeedback(
                new FeedbackEntry
                {
                    UserId = userId,
                    UserName = userName,
                    Email = email,
                    Category = category,
                    Rating = rating,
                    Message = message,
                    SubmittedOn = DateTime.Now,
                    Status = "New"
                }
            );

            // Show confirmation
            pnlConfirmation.Visible = true;

            // Clear form
            txtEmail.Text = string.Empty;
            txtMessage.Text = string.Empty;

            ddlCategory.SelectedIndex = 0;

            rb3.Checked = true;

            // Reload student's feedback
            LoadMyFeedback();
        }

        // =========================================================
        // GET RATING
        // =========================================================
        private int GetSelectedRating()
        {
            if (rb5.Checked)
                return 5;

            if (rb4.Checked)
                return 4;

            if (rb3.Checked)
                return 3;

            if (rb2.Checked)
                return 2;

            if (rb1.Checked)
                return 1;

            return 0;
        }
        protected string GetStatusCss(string status)
        {
            switch (status)
            {
                case "Important":
                    return "feedback-status status-important";

                case "Reviewing":
                    return "feedback-status status-reviewing";

                case "Resolved":
                    return "feedback-status status-resolved";

                default:
                    return "feedback-status status-new";
            }
        }

        protected string GetStatusIcon(string status)
        {
            switch (status)
            {
                case "Important":
                    return "🔴";

                case "Reviewing":
                    return "🟠";

                case "Resolved":
                    return "🟢";

                default:
                    return "🔵";
            }
        }

        protected string GetStudentStatus(string status)
        {
            switch (status)
            {
                case "Important":
                    return "Important";

                case "Reviewing":
                    return "Being Reviewed";

                case "Resolved":
                    return "Resolved";

                default:
                    return "Submitted";
            }
        }

        protected string GetStars(int rating)
        {
            if (rating < 1)
                return "";

            return new string('★', rating);
        }
    }
}