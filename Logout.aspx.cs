using System;

namespace STUDYVAULT
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }
    }
}