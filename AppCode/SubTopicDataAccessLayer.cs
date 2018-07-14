using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SkillBee.AppCode
{

    public class SubTopic
    {
        public int SubTopicID { get; set; }
        public int TopicID { get; set; }
        public int Display { get; set; }
        public string SubTopicHeading { get; set; }
        public string SubTopicImg { get; set; }
    }

    public class SubTopicDataAccessLayer
    {
        public static List<SubTopic> GetSubTopics(int TopicID)
        {
            List<SubTopic> ListSubTopic = new List<SubTopic>();

            SqlConnection con = BusinessLogic.GetConnection();
            SqlCommand cmd = new SqlCommand("select * from subTopics where TopicID=@TopicID", con);
            cmd.Parameters.AddWithValue("@TopicID", TopicID);

            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            con.Close();

            DataTable dt = new DataTable();
            sda.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SubTopic ST = new SubTopic();
                ST.SubTopicID = Convert.ToInt32(dt.Rows[i]["SubTopicID"]);
                ST.TopicID = Convert.ToInt32(dt.Rows[i]["TopicID"]);
                ST.Display = Convert.ToInt32(dt.Rows[i]["Display"]);
                ST.SubTopicHeading = (string)dt.Rows[i]["SubTopicHeading"];
                ST.SubTopicImg = (string)dt.Rows[i]["SubTopicImg"];

                ListSubTopic.Add(ST);
            }

            return ListSubTopic;

        }
    }

}