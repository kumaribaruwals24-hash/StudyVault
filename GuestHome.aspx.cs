using STUDYVAULT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace STUDYVAULT
{
    public partial class GuestHome : Page
    {
        private static readonly Dictionary<string, int> CategoryIds =
            new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase)
            {
                { "webdev", 1 },
                { "databases", 2 },
                { "networking", 3 },
                { "ai", 4 },
                { "security", 5 },
                { "design", 6 }
            };

        private static readonly Dictionary<string, string> CategoryLabels =
            new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
            {
                { "webdev", "Web Dev" },
                { "databases", "Databases" },
                { "networking", "Networking" },
                { "ai", "AI" },
                { "security", "Security" },
                { "design", "Design" }
            };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string category = Request.QueryString["cat"];

                BindResources(null, category);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();

            BindResources(keyword, null);
        }

        private void BindResources(string keyword, string category)
        {
            try
            {
                var allResources = ResourceCatalog.GetAllResources();

                IEnumerable<ResourceItem> query = allResources;

                // ============================================
                // CATEGORY FILTER
                // ============================================

                if (!string.IsNullOrWhiteSpace(category) &&
                    CategoryIds.ContainsKey(category))
                {
                    int categoryId = CategoryIds[category];

                    query = query.Where(r =>
                        r.CategoryID.HasValue &&
                        r.CategoryID.Value == categoryId);

                    string label = CategoryLabels[category];

                    litResultsTitle.Text =
                        label + " Resources";

                    litResultsSubtitle.Text =
                        "Explore our " +
                        label +
                        " study materials.";
                }

                // ============================================
                // SEARCH
                // ============================================

                else if (!string.IsNullOrWhiteSpace(keyword))
                {
                    string search =
                        keyword.ToLowerInvariant();

                    query = query.Where(r =>
                        (!string.IsNullOrWhiteSpace(r.Title) &&
                         r.Title.ToLowerInvariant().Contains(search))
                        ||
                        (!string.IsNullOrWhiteSpace(r.Description) &&
                         r.Description.ToLowerInvariant().Contains(search))
                        ||
                        (!string.IsNullOrWhiteSpace(r.CategoryLabel) &&
                         r.CategoryLabel.ToLowerInvariant().Contains(search))
                    );

                    litResultsTitle.Text =
                        "Search Results";

                    litResultsSubtitle.Text =
                        "Showing resources matching \"" +
                        Server.HtmlEncode(keyword) +
                        "\".";
                }

                // ============================================
                // DEFAULT HOME PAGE
                // ============================================

                else
                {
                    query = query
                        .OrderByDescending(r => r.UploadDate)
                        .Take(8);

                    litResultsTitle.Text =
                        "Explore StudyVault";

                    litResultsSubtitle.Text =
                        "Discover notes, tutorials, assignments and study resources.";
                }

                var results = query.ToList();

                rptResources.DataSource = results;
                rptResources.DataBind();

                pnlNoResults.Visible =
                    results.Count == 0;
            }
            catch (Exception)
            {
                rptResources.DataSource =
                    new List<ResourceItem>();

                rptResources.DataBind();

                pnlNoResults.Visible = true;

                litResultsTitle.Text =
                    "Resources";

                litResultsSubtitle.Text =
                    "Unable to load resources right now.";
            }
        }
    }
}
