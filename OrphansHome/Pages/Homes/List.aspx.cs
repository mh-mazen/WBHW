using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrphansHome.Pages.Homes
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "البيوت قيد الرعاية";
            var list = Database.DatabaseHelper.Orphanage_GetAll();
            listRepeater.DataSource = list;
            listRepeater.DataBind();
        }
        public string GetString(string s, char c)
        {
            return StringHelper.Truncate(s, c);
        }
    }
}