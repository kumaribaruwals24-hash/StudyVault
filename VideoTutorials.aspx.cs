using System;
using System.Web.UI;

namespace STUDYVAULT
{
    public partial class VideoTutorials : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindVideos();
            }
        }


        // =========================================================
        // LOAD VIDEOS
        // =========================================================

        private void BindVideos()
        {
            try
            {
                var videos =
                    VideoCatalog.GetAllVideos();

                rptVideos.DataSource =
                    videos;

                rptVideos.DataBind();

                pnlNoVideos.Visible =
                    videos.Count == 0;
            }
            catch (Exception)
            {
                pnlNoVideos.Visible = true;
            }
        }
    }
}