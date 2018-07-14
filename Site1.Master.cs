using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillBee
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] != null)
            {
                string nm;
                nm = Session["CurrentUser"].ToString();
                nm = nm.TrimEnd();
                UserLoginText.Text = "Hello " + nm;

                if (nm == "Admin")
                {
                    LinkHome.Visible = false;
                    LinkResult.Visible = false;
                }
                else
                {
                    LinkHome.Visible = true;
                    LinkResult.Visible = true;
                }

                divLogout.Visible = true;
                loginText.Visible = false;
            }
            else
            {
                divLogout.Visible = false;
                loginText.Visible = true;
            }

            //Response.Write(Session["CurrentUser"].ToString());
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["CurrentUser"] = null;
            Response.Redirect("~/default.aspx");
        }
    }
}