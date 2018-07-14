using SkillBee.AppCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillBee
{
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string Name = string.Empty;
            string Email = string.Empty;
            string Feedback = string.Empty;

            Name = TextBoxName.Text.ToString();
            Email = TextBoxEmail.Text.ToString();
            Feedback = TextBoxMsg.Text.ToString();

            int LookFeel, Layout;
            LookFeel = Int32.Parse(LookFeelValue.Value.ToString());
            Layout = Int32.Parse(LayoutValue.Value.ToString());

            if (BusinessLogic.Feedback(Name, Email, Feedback, LookFeel, Layout))
            {
                divForm.Visible = false;
                divResponce.Visible = true;
                result.InnerHtml = "Your Feedback Saved Successfully...";
            }
            else
            {
                divForm.Visible = false;
                divResponce.Visible = true;
                result.InnerHtml ="Your Feedback was NOT Save Successfully...";
            }
        }
    }
}