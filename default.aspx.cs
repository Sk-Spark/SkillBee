using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SkillBee.AppCode;

namespace SkillBee
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindTopics();
        }

        protected void BindTopics()
        {

            DLTopic.DataSource = TopicDataAccessLayer.GetTopics();
            DLTopic.DataBind();
        }



    }
}