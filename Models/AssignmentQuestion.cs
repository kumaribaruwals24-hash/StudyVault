using System;

namespace STUDYVAULT
{
    public class AssignmentQuestion
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public string Subject { get; set; }

        public string Teacher { get; set; }

        public string Semester { get; set; }

        public string AssignmentType { get; set; }

        public DateTime DueDate { get; set; }

        public string Description { get; set; }

        // Stored filename
        public string FileName { get; set; }

        // Original filename shown to students/admin
        public string OriginalFileName { get; set; }

        public DateTime PostedDate { get; set; }

        public string Status { get; set; }

        // Used by student page filters/UI
        public string StatusKey
        {
            get
            {
                if (string.IsNullOrWhiteSpace(Status))
                    return "active";

                return Status.ToLower()
                    .Replace(" ", "-");
            }
        }

        public string DueDateDisplay
        {
            get
            {
                return DueDate.ToString("dd MMM yyyy");
            }
        }
    }
}