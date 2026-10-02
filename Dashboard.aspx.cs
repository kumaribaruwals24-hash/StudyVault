using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace STUDYVAULT
{
    public partial class Dashboard : Page
    {
        // This matches <div id="avatarCircle" runat="server" class="avatar-circle"></div> in your ASPX
        //protected HtmlGenericControl avatarCircle;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] != null && Session["Role"].ToString() == "Admin")
            {
                Response.Redirect("AdminDashboard.aspx");
                return;
            }
            if (!IsPostBack)
            {
                if (Session["FullName"] != null)
                {
                    string fullName = Session["FullName"].ToString();

                    // Generate initials (first letters of each word)
                    string initials = string.Join("", Array.ConvertAll(
                        fullName.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries),
                        n => n[0].ToString().ToUpper()
                    ));

                    // Show initials in the circle avatar
                    avatarCircle.InnerText = initials;

                    // Show full name in hero section
                    lblNameHero.Text = fullName;
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void btnGetStarted_Click(object sender, EventArgs e)
        {
            Response.Redirect("Resources.aspx");
        }

        protected void btnBrowseResources_Click(object sender, EventArgs e)
        {
            Response.Redirect("Resources.aspx");
        }
    }
}
