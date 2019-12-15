using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrphansHome.Pages.Donation
{
    public partial class Add : System.Web.UI.Page
    {
        public int OID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            int oid = Convert.ToInt32(Request.QueryString["OID"]);
            if (oid > 0)
            {
                successPanel.Visible = errorPanel.Visible = false;
                this.OID = oid;
            }
            else
                Response.Redirect("~/Pages/Homes/List.aspx");
        }

        protected void send_Click(object sender, EventArgs e)
        {
            Database.Handlers.Donation donation = new Database.Handlers.Donation
            {
                FullName = Name.Text,
                Address = Address.Text,
                DOID = int.Parse(doType.SelectedValue),
                TID = int.Parse(dType.SelectedValue),
                EmailAddress = Email.Text,
                PhoneNumber = Phone.Text,
                OID = this.OID,
                IsCollected = false
            };
            if (Database.DatabaseHelper.Donation_Add(donation))
            {
                successPanel.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                "setTimeout(function() { window.location.replace('/Pages/Homes/List.aspx') }, 3000);", true);
            }
            else
            {
                errorPanel.Visible = true;
            }
        }
    }
}