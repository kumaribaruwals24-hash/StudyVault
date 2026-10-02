using System;
using System.Collections.Generic;

namespace STUDYVAULT
{
    public class VideoItem
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public string Category { get; set; }

        public string CategoryLabel { get; set; }

        public string Level { get; set; }

        public string Duration { get; set; }

        public string Instructor { get; set; }

        public DateTime UploadDate { get; set; }

        public string Description { get; set; }

        public List<string> Topics { get; set; }

        // YouTube video URL
        public string YouTubeUrl { get; set; }

        public bool IsFeatured { get; set; }

        public VideoItem()
        {
            Topics = new List<string>();
        }
    }
}