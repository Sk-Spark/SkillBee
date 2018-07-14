using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SkillBee.AppCode;

namespace SkillBee
{
    public partial class contactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string Name = string.Empty;
            string Email = string.Empty;
            string Subject = string.Empty;
            string Msg = string.Empty;

            Name = TextBoxName.Text.ToString();
            Email = TextBoxEmail.Text.ToString();
            Subject = TextBoxSubject.Text.ToString();
            Msg = TextBoxMsg.Text.ToString();

            if (BusinessLogic.Contact(Name, Email, Subject, Msg))
            {
                divForm.Visible = false;
                divResponce.Visible = true;
                result.InnerHtml = "Your Message Save Successfully...";
            }
            else
            {
                divForm.Visible = false;
                divResponce.Visible = true; 
                Response.Write("Your Message was NOT Save Successfully...");            
            }

        }

    }
}    