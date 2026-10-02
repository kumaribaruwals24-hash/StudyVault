using System;

namespace STUDYVAULT
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var con = DatabaseHelper.GetConnection();

                con.Open();

                Response.Write("Database Connected Successfully");

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}