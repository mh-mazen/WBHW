﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OrphansHome.Pages.Homes.Manage
{
    public partial class ManageList : System.Web.UI.Page
    {
        public int UID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var oid = (Database.Handlers.User)(Session["LoginUser"]);
            if (oid != null && RoleManagment.HasAccess(Request.Path, oid.RoleName))
            {
                if (!Database.DatabaseHelper.User_Manager_Free())
                {
                    addBtnVisible.Visible = false;
                    addBtnError.Visible = true;
                }
                OrphRep.DataSource = Database.DatabaseHelper.Orphanage_GetAll();
                OrphRep.DataBind();
                this.UID = oid.UID;
            }
            else
                Response.Redirect("/");
        }
        public string GetString(string s, char c)
        {
            return StringHelper.Truncate(s, c);
        }

        protected void btnEdit_ServerClick(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as HtmlButton).NamingContainer as RepeaterItem;
            string oid = (item.FindControl("lblOID") as Label).Text;
            Response.Redirect(string.Format("/Pages/Homes/Manage/ManageEdit.aspx?oid={0}", oid));
        }
    }
}