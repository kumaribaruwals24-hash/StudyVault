using System;

namespace STUDYVAULT.Models
{
    public class AssignmentSubmission
    {
        public int Id { get; set; }

        public int AssignmentId { get; set; }

        public string StudentName { get; set; }

        public string StudentEmail { get; set; }

        public string Note { get; set; }

        public string FileName { get; set; }

        public string OriginalFileName { get; set; }

        public DateTime SubmittedDate { get; set; }

        public string Status { get; set; }

        public string Comment { get; set; }
    }
}