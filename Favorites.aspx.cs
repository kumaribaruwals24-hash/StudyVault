using System;
using System.Web.UI;
namespace STUDYVAULT
{
    public partial class Favorites : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ...your existing logic...

            string name = Session["FullName"]?.ToString() ?? "Student";
            avatarCircle.InnerText = GetInitials(name);
            avatarCircle.Attributes["title"] = name;
        }

        private string GetInitials(string fullName)
        {
            var parts = fullName.Trim().Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length == 0) return "S";
            if (parts.Length == 1) return parts[0].Substring(0, 1).ToUpper();
            return (parts[0].Substring(0, 1) + parts[parts.Length - 1].Substring(0, 1)).ToUpper();
        }
    }
}