﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SkillBee.AppCode;

namespace SkillBee
{
    public partial class Results : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int UserID = Convert.ToInt32(Session["UserID"]);
            GVResult.DataSource = ResultDataAccessLayer.GetResults(UserID);
            GVResult.DataBind();
        }
    }
}