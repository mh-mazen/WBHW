using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrphansHome.Pages.Donation
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = (Database.Handlers.User)Session["LoginUser"];
            if (user != null && RoleManagment.HasAccess(Request.Path, user.RoleName))
            {
                var list = Database.DatabaseHelper.Donation_GetAll(user.UID);
                doneRep.DataSource = list.Where(x => x.IsCollected == true);
                notDoneRep.DataSource = list.Where(x => x.IsCollected == false);
                doneRep.DataBind();
                notDoneRep.DataBind();
            }
            else
                Response.Redirect("~/");
        }
        public string GetReqType(int req)
        {
            return Database.Handlers.DonationType.GetString(req);
        }
        public string GetDelType(int del)
        {
            return Database.Handlers.DonationDeliveryOption.GetString(del);
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string did = (item.FindControl("lblDID") as Label).Text;
            Database.DatabaseHelper.Donation_SetDone(int.Parse(did), true);
            Response.Redirect(Request.Path);
        }

        protected void btnNotDone_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string did = (item.FindControl("lblDID") as Label).Text;
            Database.DatabaseHelper.Donation_SetDone(int.Parse(did), false);
            Response.Redirect(Request.Path);
        }
    }
}