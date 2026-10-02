using System;

namespace STUDYVAULT
{
    public partial class AdminAccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAccess_Click(object sender, EventArgs e)
        {
            string accessCode = txtAccessCode.Text.Trim();

            if (accessCode == "STUDY456")
            {
                Response.Redirect("ADMIN/SeedAdmin.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid access code. Please try again.";
            }
        }
    }
}