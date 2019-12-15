using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OrphansHome.Database;
using OrphansHome.Database.Handlers;

namespace OrphansHome
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "اكفل يتيم - رعاية الايتام";
            User user = (User)Session["LoginUser"];
            if (user != null)
            {
                ShowUserMenu(true);
                LoginUserNameLabel.Text = user.FullName;
                userMenuRepeater.DataSource = RoleManagment.GetRoles(user.RoleName);
                userMenuRepeater.DataBind();
            }
            else
                ShowUserMenu(false);
        }
        private void ShowUserMenu(bool show)
        {
            loginBtnPanel.Visible = !show;
            LoginMenuPanel.Visible = show;
        }
        protected void loginButton_Click(object sender, EventArgs e)
        {
            bool login = DatabaseHelper.Login(loginUsername.Text, loginPassword.Text);
            Response.Redirect("~/");
        }
    }
}