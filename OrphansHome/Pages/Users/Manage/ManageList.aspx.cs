using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OrphansHome.Pages.Users.Manage
{
    public partial class ManageList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            var oid = (Database.Handlers.User)(Session["LoginUser"]);
            if (oid != null && RoleManagment.HasAccess(Request.Path, oid.RoleName))
            {
                UserRep.DataSource = Database.DatabaseHelper.User_GetAll();
                UserRep.DataBind();
            }
            else
                Response.Redirect("/");

        }

        protected void btnEdit_ServerClick(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as HtmlButton).NamingContainer as RepeaterItem;
            string oid = (item.FindControl("lblUID") as Label).Text;
            Response.Redirect(string.Format("/Pages/Users/Manage/ManageEdit.aspx?uid={0}", oid));
        }
    }
}