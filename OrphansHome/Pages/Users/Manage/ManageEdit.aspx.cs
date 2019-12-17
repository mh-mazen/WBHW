using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrphansHome.Pages.Users.Manage
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
                    !string.IsNullOrEmpty(Request.QueryString["uid"]))
                {
                    successPanel.Visible = errorPanel.Visible = false;
                    int UID = int.Parse(Request.QueryString["uid"]);
                    var user = Database.DatabaseHelper.User_Get(UID);
                    FirstName.Text = user.FirstName;
                    LastName.Text = user.SurName;
                    PhoneNumber.Text = user.PhoneNumber;
                    EmailAddress.Text = user.EmailAddress;
                    Username.Text = user.UserName;
                }
                else
                    Response.Redirect("~/Pages/Users/Manage/ManageList.aspx");
            }
        }

        protected void send_Click(object sender, EventArgs e)
        {
            int UID = int.Parse(Request.QueryString["uid"]);
            var oldUser = Database.DatabaseHelper.User_Get(UID);
            Database.Handlers.User user = new Database.Handlers.User
            {
                UID = UID,
                FirstName = FirstName.Text,
                FullName = FirstName.Text + " " + LastName.Text,
                SurName = LastName.Text,
                PhoneNumber = PhoneNumber.Text,
                EmailAddress = EmailAddress.Text,
                UserName = Username.Text,
                PasswordHash = Database.DatabaseHelper.CalculateMD5Hash(Password.Text)
            };
            if (Database.DatabaseHelper.User_Update(user))
            {
                successPanel.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                "setTimeout(function() { window.location.replace('/Pages/Homes/Users/ManageList.aspx') }, 3000);", true);
            }
            else
            {
                errorPanel.Visible = true;
            }
        }
    }
}