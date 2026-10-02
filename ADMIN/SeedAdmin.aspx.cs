using System;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace STUDYVAULT
{
    public partial class SeedAdmin : System.Web.UI.Page
    {
        protected void btnCreate_Click(object sender, EventArgs e)
        {
            lblResult.Text = "";
            lblResult.CssClass = "result-message";

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            // ==============================
            // FULL NAME VALIDATION
            // ==============================

            if (string.IsNullOrWhiteSpace(fullName))
            {
                ShowError("Please enter the administrator's full name.");
                return;
            }

            if (!Regex.IsMatch(fullName, @"^[A-Za-z ]{2,100}$"))
            {
                ShowError("Full name can contain letters and spaces only.");
                return;
            }


            // ==============================
            // EMAIL VALIDATION
            // ==============================

            if (string.IsNullOrWhiteSpace(email))
            {
                ShowError("Please enter an email address.");
                return;
            }

            if (!Regex.IsMatch(
                email,
                @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                ShowError("Please enter a valid email address.");
                return;
            }


            // ==============================
            // PASSWORD VALIDATION
            // ==============================

            if (string.IsNullOrWhiteSpace(password))
            {
                ShowError("Please enter a password.");
                return;
            }

            if (password.Length < 8)
            {
                ShowError("Password must contain at least 8 characters.");
                return;
            }

            if (!Regex.IsMatch(password, @"[A-Z]"))
            {
                ShowError("Password must contain at least one uppercase letter.");
                return;
            }

            if (!Regex.IsMatch(password, @"[a-z]"))
            {
                ShowError("Password must contain at least one lowercase letter.");
                return;
            }

            if (!Regex.IsMatch(password, @"[0-9]"))
            {
                ShowError("Password must contain at least one number.");
                return;
            }

            if (!Regex.IsMatch(password, @"[^A-Za-z0-9]"))
            {
                ShowError("Password must contain at least one special character.");
                return;
            }


            // ==============================
            // CONFIRM PASSWORD
            // ==============================

            if (password != confirmPassword)
            {
                ShowError("Passwords do not match.");
                return;
            }


            // ==============================
            // DATABASE
            // ==============================

            try
            {
                using (SqlConnection con = DatabaseHelper.GetConnection())
                {
                    con.Open();

                    // Check if email already exists
                    string checkQuery = @"
                        SELECT COUNT(*)
                        FROM Users
                        WHERE Email = @Email";

                    using (SqlCommand checkCmd =
                           new SqlCommand(checkQuery, con))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);

                        int existingUser =
                            Convert.ToInt32(checkCmd.ExecuteScalar());

                        if (existingUser > 0)
                        {
                            ShowError(
                                "An account with this email already exists.");
                            return;
                        }
                    }


                    // ==============================
                    // HASH PASSWORD
                    // ==============================

                    string passwordHash =
                        BCrypt.Net.BCrypt.HashPassword(password);


                    // ==============================
                    // INSERT ADMIN
                    // ==============================

                    string query = @"
                        INSERT INTO Users
                        (
                            FullName,
                            Email,
                            Password,
                            Role
                        )
                        VALUES
                        (
                            @FullName,
                            @Email,
                            @Password,
                            @Role
                        )";

                    using (SqlCommand cmd =
                           new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@FullName", fullName);

                        cmd.Parameters.AddWithValue(
                            "@Email", email);

                        cmd.Parameters.AddWithValue(
                            "@Password", passwordHash);

                        cmd.Parameters.AddWithValue(
                            "@Role", "Admin");

                        cmd.ExecuteNonQuery();
                    }
                }


                // ==============================
                // SUCCESS
                // ==============================

                lblResult.Text =
                    "✓ Admin account created successfully.";

                lblResult.Style["background"] = "#eaf8f0";
                lblResult.Style["color"] = "#21864a";

                ClearFields();
            }
            catch (Exception ex)
            {
                ShowError(
                    "Unable to create the admin account. Please try again.");
            }
        }


        // ==============================
        // CLEAR BUTTON
        // ==============================

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearFields();

            lblResult.Text = "";
        }


        // ==============================
        // ERROR MESSAGE
        // ==============================

        private void ShowError(string message)
        {
            lblResult.Text = message;

            lblResult.Style["background"] = "#fff0f0";
            lblResult.Style["color"] = "#d93025";
        }


        // ==============================
        // CLEAR FORM
        // ==============================

        private void ClearFields()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}