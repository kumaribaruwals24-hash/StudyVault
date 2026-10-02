using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace STUDYVAULT
{
    public partial class AdminFeedback : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only Admin can access this page
            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindFeedback("all");
            }
        }


        // =========================================================
        // LOAD FEEDBACK
        // =========================================================

        private void BindFeedback(string statusFilter)
        {
            var all = FeedbackCatalog.GetAllFeedback();

            // Total
            litTotal.Text = all.Count.ToString();

            // New
            litNew.Text = all
                .Count(f => f.Status == "New")
                .ToString();

            // Average rating
            litAvgRating.Text =
                all.Count > 0
                    ? Math.Round(
                        all.Average(f => f.Rating),
                        1
                      ).ToString()
                    : "—";


            // Filter
            var filtered =
                statusFilter == "all"
                    ? all
                    : all
                        .Where(f => f.Status == statusFilter)
                        .ToList();


            // Bind
            rptFeedback.DataSource = filtered;
            rptFeedback.DataBind();


            // Empty message
            pnlNoFeedback.Visible =
                filtered.Count == 0;
        }


        // =========================================================
        // SET CURRENT STATUS IN DROPDOWN
        // =========================================================

        protected void rptFeedback_ItemDataBound(
            object sender,
            RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                FeedbackEntry feedback =
                    (FeedbackEntry)e.Item.DataItem;


                DropDownList ddlStatus =
                    (DropDownList)e.Item.FindControl(
                        "ddlStatus"
                    );


                if (ddlStatus != null)
                {
                    ListItem item =
                        ddlStatus.Items.FindByValue(
                            feedback.Status
                        );


                    if (item != null)
                    {
                        ddlStatus.SelectedValue =
                            feedback.Status;
                    }
                }
            }
        }


        // =========================================================
        // FILTER CHANGED
        // =========================================================

        protected void ddlFilter_Changed(
            object sender,
            EventArgs e)
        {
            BindFeedback(
                ddlFilter.SelectedValue
            );
        }


        // =========================================================
        // REPEATER COMMAND
        // =========================================================

        protected void rptFeedback_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            int id;


            if (!int.TryParse(
                Convert.ToString(e.CommandArgument),
                out id))
            {
                BindFeedback(
                    ddlFilter.SelectedValue
                );

                return;
            }


            // =====================================================
            // CHANGE STATUS
            // =====================================================

            if (e.CommandName == "ChangeStatus")
            {
                DropDownList ddlStatus =
                    (DropDownList)e.Item.FindControl(
                        "ddlStatus"
                    );


                if (ddlStatus != null)
                {
                    string newStatus =
                        ddlStatus.SelectedValue;


                    FeedbackCatalog.UpdateStatus(
                        id,
                        newStatus
                    );


                    ShowSuccess(
                        "Feedback status updated successfully."
                    );
                }
            }


            // =====================================================
            // DELETE
            // =====================================================

            else if (e.CommandName == "Delete")
            {
                FeedbackCatalog.DeleteFeedback(id);


                ShowSuccess(
                    "Feedback deleted successfully."
                );
            }


            // Reload
            BindFeedback(
                ddlFilter.SelectedValue
            );
        }


        // =========================================================
        // SUCCESS MESSAGE
        // =========================================================

        private void ShowSuccess(string message)
        {
            lblConfirmationText.Text = message;

            pnlConfirmation.Visible = true;
        }


        // =========================================================
        // LOGOUT
        // =========================================================

        protected void btnLogout_Click(
            object sender,
            EventArgs e)
        {
            Session.Clear();

            Session.Abandon();

            Response.Redirect("~/Login.aspx");
        }
    }
}