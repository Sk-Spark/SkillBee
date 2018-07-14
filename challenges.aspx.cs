using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SkillBee.AppCode;

namespace SkillBee
{
    public partial class challenges : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int SubTopicID = Convert.ToInt32(Request.QueryString["SubTopicID"]);
            DLChallenge.DataSource = ChallengesDataAccessLayer.GetChallenges(SubTopicID);
            DLChallenge.DataBind();
            Session["SubTopic"] = ChallengesDataAccessLayer.GetSubtopic(SubTopicID);
        }
    }
}