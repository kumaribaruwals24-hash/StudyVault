using System;
using System.Collections.Generic;
using System.Web.UI;

namespace STUDYVAULT
{
    public partial class Categories : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategories();
            }
        }

        // =========================================================
        // LOAD CATEGORIES
        // =========================================================

        private void BindCategories()
        {
            try
            {
                CategoryCatalog catalog =
                    new CategoryCatalog();

                List<Category> categories =
                    catalog.GetAllCategories();

                rptCategories.DataSource = categories;
                rptCategories.DataBind();
            }
            catch (Exception ex)
            {
                // Display a simple error instead of crashing the page
                Response.Write(
                    "<div style='padding:20px;color:red;font-family:Arial;'>" +
                    "Error loading categories: " +
                    Server.HtmlEncode(ex.Message) +
                    "</div>"
                );
            }
        }

        // =========================================================
        // CATEGORY CSS CLASS
        // =========================================================

        protected string GetCategoryCssClass(object categoryName)
        {
            string name =
                Convert.ToString(categoryName)
                    .Trim()
                    .ToLowerInvariant();

            switch (name)
            {
                case "web development":
                    return "webdev";

                case "database systems":
                    return "databases";

                case "databases":
                    return "databases";

                case "networking":
                    return "networking";

                case "artificial intelligence":
                    return "ai";

                case "ai":
                    return "ai";

                case "security":
                    return "security";

                case "design":
                    return "design";

                default:
                    return "webdev";
            }
        }
    }
}