using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrphansHome.Pages.Homes.Manage
{
    public partial class ManageEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var oid = (Database.Handlers.User)(Session["LoginUser"]);
                if (oid != null &&
                    RoleManagment.HasAccess(Request.Path, oid.RoleName) &&
                    !string.IsNullOrEmpty(Request.QueryString["oid"]))
                {
                    successPanel.Visible = errorPanel.Visible = false;
                    int OID = int.Parse(Request.QueryString["oid"]);
                    var orp = Database.DatabaseHelper.Orphanage_Get(OID);
                    Name.Text = orp.Name;
                    Desc.Text = orp.Description;
                    Address.Text = orp.Address;
                    NumOrph.Text = orp.NumOfOrphans.ToString();
                    NumStaff.Text = orp.NumOfStaff.ToString();
                    PhoneNumber.Text = orp.PhoneNumber;
                    MailAddress.Text = orp.MailAddress;
                    EmailAddress.Text = orp.EmailAddress;
                    Image.ImageUrl = string.Format("/Photos/" + orp.ImageName);
                    LocArgs.Value = string.Format("{0},{1}", orp.MapLat, orp.MapLng);
                }
                else
                    Response.Redirect("~/Pages/Homes/Manage/ManageList.aspx");
            }
        }
        public string GetLoc(string latlng, bool coord)
        {
            var onel = latlng.IndexOf(',');
            var twol = latlng.LastIndexOf(',');
            var lat = latlng.Substring(0, onel);
            var lng = latlng.Substring(onel + 1, twol);
            return coord ? lat : lng;
        }

        protected void send_Click(object sender, EventArgs e)
        {
            int OID = int.Parse(Request.QueryString["oid"]);
            var oldOrph = Database.DatabaseHelper.Orphanage_Get(OID);
            Database.Handlers.Orphanage orph = new Database.Handlers.Orphanage
            {
                OID = OID,
                MID = oldOrph.MID,
                Name = Name.Text,
                Description = Desc.Text,
                Address = Address.Text,
                NumOfOrphans = int.Parse(NumOrph.Text),
                NumOfStaff = int.Parse(NumStaff.Text),
                PhoneNumber = PhoneNumber.Text,
                MailAddress = MailAddress.Text,
                EmailAddress = EmailAddress.Text,
                MapLat = float.Parse(GetLoc(LocArgs.Value, true)),
                MapLng = float.Parse(GetLoc(LocArgs.Value, false)),
                MapZoom = 12
            };

            Code.FileHelper.UpdateImage(ImageFile.PostedFile, string.Format("{0}/{1}", Request.MapPath("/Photos"), oldOrph.ImageName));
            orph.ImageName = oldOrph.ImageName;
            if (Database.DatabaseHelper.Orphanage_Update(orph))
            {
                successPanel.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                "setTimeout(function() { window.location.replace('/Pages/Homes/Manage/ManageList.aspx') }, 3000);", true);
            }
            else
            {
                errorPanel.Visible = true;
            }
        }
    }
}