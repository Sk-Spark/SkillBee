using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SkillBee.AppCode;

namespace SkillBee
{
    public partial class adminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string UserID = string.Empty;
            string Pass = string.Empty;
            UserID = TextBoxAdminId.Text.ToString();
            Pass = TextBoxAdminPass.Text.ToString();

            if (BusinessLogic.AdminLogin(UserID, Pass))
            {
                Session["CurrentUser"] = "Admin";
                Response.Redirect("addTopics.aspx");
            }
            else
            {
                Response.Write("Failed....");
            }

        }
    }
}