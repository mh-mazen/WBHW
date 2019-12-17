using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrphansHome.Pages.Homes.Manage
{
    public partial class ManageAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var oid = (Database.Handlers.User)(Session["LoginUser"]);
                if (oid != null && RoleManagment.HasAccess(Request.Path, oid.RoleName))
                {
                    successPanel.Visible = errorPanel.Visible = false;
                    var manList = Database.DatabaseHelper.User_GetAll();
                    foreach (var item in manList)
                        ManagerDrop.Items.Add(new ListItem { Text = item.FullName, Value = item.UID.ToString() });

                }
                else
                    Response.Redirect("/");
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
            Database.Handlers.Orphanage orph = new Database.Handlers.Orphanage
            {
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
            orph.ImageName = Code.FileHelper.UpdateImage(ImageFile.PostedFile, Request.MapPath("/Photos"));
            if (Database.DatabaseHelper.Orphanage_Add(orph))
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