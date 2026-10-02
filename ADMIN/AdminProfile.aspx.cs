using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace STUDYVAULT
{
    public partial class AdminProfile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            int userId = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT FullName, Email FROM Users WHERE UserID = @UserID", con);
                cmd.Parameters.AddWithValue("@UserID", userId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtFullName.Text = Convert.ToString(reader["FullName"]);
                    txtEmail.Text = Convert.ToString(reader["Email"]);
                }
            }
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtFullName.Text) || string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                ShowError("Name and email cannot be empty.");
                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                SqlCommand cmd = new SqlCommand("UPDATE Users SET FullName = @FullName, Email = @Email WHERE UserID = @UserID", con);
                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@UserID", userId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Session["FullName"] = txtFullName.Text.Trim();
            ShowSuccess("Profile updated successfully.");
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCurrentPassword.Text) || string.IsNullOrWhiteSpace(txtNewPassword.Text))
            {
                ShowError("Please fill in both password fields.");
                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);
            string storedHash;

            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT Password FROM Users WHERE UserID = @UserID", con);
                cmd.Parameters.AddWithValue("@UserID", userId);
                con.Open();
                storedHash = Convert.ToString(cmd.ExecuteScalar());
            }

            if (!BCrypt.Net.BCrypt.Verify(txtCurrentPassword.Text, storedHash))
            {
                ShowError("Your current password is incorrect.");
                return;
            }

            string newHash = BCrypt.Net.BCrypt.HashPassword(txtNewPassword.Text);

            using (SqlConnection con = DatabaseHelper.GetConnection())
            {
                SqlCommand cmd = new SqlCommand("UPDATE Users SET Password = @Password WHERE UserID = @UserID", con);
                cmd.Parameters.AddWithValue("@Password", newHash);
                cmd.Parameters.AddWithValue("@UserID", userId);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            txtCurrentPassword.Text = "";
            txtNewPassword.Text = "";
            ShowSuccess("Password updated successfully.");
        }

        private void ShowSuccess(string message)
        {
            lblConfirmationText.Text = message;
            pnlConfirmation.Visible = true;
            pnlError.Visible = false;
        }

        private void ShowError(string message)
        {
            lblError.Text = message;
            pnlError.Visible = true;
            pnlConfirmation.Visible = false;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}