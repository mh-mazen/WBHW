using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrphansHome.Pages.Requirements
{
    public partial class Add : System.Web.UI.Page
    {
        public int UID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var oid = (Database.Handlers.User)(Session["LoginUser"]);
            if (oid != null && RoleManagment.HasAccess(Request.Path, oid.RoleName))
            {
                successPanel.Visible = errorPanel.Visible = false;
                this.UID = oid.UID;
            }
            else
                Response.Redirect("~/Pages/Homes/List.aspx");
        }

        protected void send_Click(object sender, EventArgs e)
        {
            Database.Handlers.Requirements requirements = new Database.Handlers.Requirements
            {
                Description = Desc.Text,
                TID = int.Parse(dType.SelectedValue)
            };
            if (Database.DatabaseHelper.Requirements_Add(requirements, UID))
            {
                successPanel.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                "setTimeout(function() { window.location.replace('/') }, 5000);", true);
            }
            else
            {
                errorPanel.Visible = true;
            }
        }
    }
}