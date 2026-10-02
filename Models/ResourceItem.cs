using System;

namespace STUDYVAULT.Models
{
    public class ResourceItem
    {
        public int ResourceID { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string FilePath { get; set; }

        public int? CategoryID { get; set; }

        public DateTime? UploadDate { get; set; }

        // ============================================
        // CATEGORY
        // ============================================

        public string Category
        {
            get
            {
                switch (CategoryID)
                {
                    case 1:
                        return "webdev";

                    case 2:
                        return "databases";

                    case 3:
                        return "networking";

                    case 4:
                        return "ai";

                    case 5:
                        return "security";

                    case 6:
                        return "design";

                    default:
                        return "webdev";
                }
            }
        }

        public string CategoryLabel
        {
            get
            {
                switch (CategoryID)
                {
                    case 1:
                        return "Web Dev";

                    case 2:
                        return "Databases";

                    case 3:
                        return "Networking";

                    case 4:
                        return "AI";

                    case 5:
                        return "Security";

                    case 6:
                        return "Design";

                    default:
                        return "General";
                }
            }
        }

        // ============================================
        // ICON
        // ============================================

        public string Icon
        {
            get
            {
                switch (CategoryID)
                {
                    case 1:
                        return "💻";

                    case 2:
                        return "🗄️";

                    case 3:
                        return "🌐";

                    case 4:
                        return "🤖";

                    case 5:
                        return "🔐";

                    case 6:
                        return "🎨";

                    default:
                        return "📚";
                }
            }
        }

        // ============================================
        // FILE FORMAT
        // ============================================

        public string Format
        {
            get
            {
                if (string.IsNullOrWhiteSpace(FilePath))
                    return "Resource";

                string extension =
                    System.IO.Path.GetExtension(FilePath);

                if (string.IsNullOrWhiteSpace(extension))
                    return "Resource";

                extension = extension
                    .Replace(".", "")
                    .ToUpper();

                return extension;
            }
        }

        // ============================================
        // CARD META INFORMATION
        // ============================================

        public string Meta
        {
            get
            {
                if (UploadDate.HasValue)
                {
                    return "Added " +
                           UploadDate.Value.ToString("dd MMM yyyy");
                }

                return "StudyVault Resource";
            }
        }
    }
}
