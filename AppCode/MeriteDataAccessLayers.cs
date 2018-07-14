using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using SkillBee.AppCode;
using System.Data.SqlClient;

namespace SkillBee.AppCode
{
    public class MeriteDataAccessLayers
    {
        public static void UpdateMerit()
        {
            SqlConnection con = BusinessLogic.GetConnection();
            SqlCommand cmd;

            DataTable UserTD = new DataTable();

            cmd = new SqlCommand("select ");



        }
    }
}