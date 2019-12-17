using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrphansHome.Pages.Users.Manage
{
    public partial class ManageAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var oid = (Database.Handlers.User)(Session["LoginUser"]);
                if (oid != null &&
                    RoleManagment.HasAccess(Request.Path, oid.RoleName))
                {
                    successPanel.Visible = errorPanel.Visible = false;
                }
                else
                    Response.Redirect("/");
            }
        }
        protected void send_Click(object sender, EventArgs e)
        {
            Database.Handlers.User user = new Database.Handlers.User
            {
                FirstName = FirstName.Text,
                FullName = FirstName.Text + " " + LastName.Text,
                SurName = LastName.Text,
                PhoneNumber = PhoneNumber.Text,
                EmailAddress = EmailAddress.Text,
                UserName = Username.Text,
                PasswordHash = Database.DatabaseHelper.CalculateMD5Hash(Password.Text)
            };
            if (Database.DatabaseHelper.User_Add(user))
            {
                successPanel.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                "setTimeout(function() { window.location.replace('/Pages/Users/Manage/ManageList.aspx') }, 3000);", true);
            }
            else
            {
                errorPanel.Visible = true;
            }
        }
    }
}