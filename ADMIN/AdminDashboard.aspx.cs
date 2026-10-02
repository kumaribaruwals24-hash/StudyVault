using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;

namespace STUDYVAULT
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                string name = Session["FullName"]?.ToString() ?? "Admin";

                lblAdminName.Text = name;
               // lblWelcomeName.Text = name;
               // lblAvatar.Text = GetInitials(name);

                LoadStats();
                LoadRecentActivity();
            }
        }

        private string GetInitials(string fullName)
        {
            var parts = fullName.Trim()
                .Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

            if (parts.Length == 0)
                return "A";

            if (parts.Length == 1)
                return parts[0].Substring(0, 1).ToUpper();

            return (
                parts[0].Substring(0, 1) +
                parts[parts.Length - 1].Substring(0, 1)
            ).ToUpper();
        }

        private void LoadStats()
        {
            int totalStudents = 0;

            try
            {
                using (SqlConnection con = DatabaseHelper.GetConnection())
                {
                    con.Open();

                    string query =
                        "SELECT COUNT(*) FROM Users WHERE Role = @Role";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Role", "Student");

                        totalStudents = Convert.ToInt32(
                            cmd.ExecuteScalar()
                        );
                    }
                }
            }
            catch (Exception)
            {
                totalStudents = 0;
            }

            lblStudentCount.Text = totalStudents.ToString();

            lblTotalNotes.Text = "85";
            lblTotalAssignments.Text = "120";
            lblTotalVideos.Text = "45";
            lblTotalPapers.Text = "32";
            lblPendingSubmissions.Text = "18";
        }

        private void LoadRecentActivity()
        {
            var activity = new List<object>
            {
                new
                {
                    Activity = "Assignment uploaded",
                    UserName = "Sita Sharma",
                    DateDisplay = "Aug 10, 2026",
                    Status = "Pending",
                    StatusKey = "pending"
                },

                new
                {
                    Activity = "New student registered",
                    UserName = "Ram Thapa",
                    DateDisplay = "Aug 10, 2026",
                    Status = "Active",
                    StatusKey = "active"
                },

                new
                {
                    Activity = "Study Note added",
                    UserName = "Admin",
                    DateDisplay = "Aug 9, 2026",
                    Status = "Published",
                    StatusKey = "published"
                },

                new
                {
                    Activity = "Research Paper uploaded",
                    UserName = "Admin",
                    DateDisplay = "Aug 9, 2026",
                    Status = "Published",
                    StatusKey = "published"
                }
            };

            rptRecentActivity.DataSource = activity;
            rptRecentActivity.DataBind();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Login.aspx");
        }
    }
}
