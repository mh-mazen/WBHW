using OrphansHome.Database.Handlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrphansHome.Pages.Homes
{
    public partial class Details : System.Web.UI.Page
    {
        public Orphanage orph { get; set; }
        public User user { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (orph != null)
            {
                reqRep.DataSource = Database.DatabaseHelper.Requirement_GetAll(orph.OID);
                reqRep.DataBind();
            }
        }
        protected override void OnPreInit(EventArgs e)
        {
            int oid = Convert.ToInt32(Request.QueryString["OID"]);
            if (oid > 0)
            {
                orph = Database.DatabaseHelper.Orphanage_Get(oid);
                user = Database.DatabaseHelper.User_Get(orph.MID);
            }
            else
                Response.Redirect("~/Pages/Homes/List.aspx");

        }
        protected void btnDonation_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("~/Pages/Donation/Add.aspx?OID={0}", orph.OID));
        }
        public string GetReqType(int req)
        {
            return Database.Handlers.DonationType.GetString(req);
        }
    }
}