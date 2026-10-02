using System;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
namespace STUDYVAULT
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;
            if (string.IsNullOrWhiteSpace(email))
            {
                lblMessage.Text = "Please enter your email.";
                return;
            }
            if (!Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                lblMessage.Text = "Please enter a valid email address.";
                return;
            }
            if (string.IsNullOrWhiteSpace(password))
            {
                lblMessage.Text = "Please enter your password.";
                return;
            }
            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                con.Open();
                string query = @"SELECT UserID, FullName, Role, Password
                                 FROM Users
                                 WHERE Email=@Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string storedHash = reader["Password"].ToString();
                    if (BCrypt.Net.BCrypt.Verify(password, storedHash))
                    {
                        string role = reader["Role"].ToString();
                        Session["UserID"] = reader["UserID"].ToString();
                        Session["FullName"] = reader["FullName"].ToString();
                        Session["Role"] = role;
                        Session["Email"] = email;   // ← this is the only new line
                        reader.Close();
                        if (role == "Admin")
                            Response.Redirect("~/ADMIN/AdminDashboard.aspx");
                        else
                            Response.Redirect("~/Dashboard.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid email or password.";
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }
            }
        }
    }
}