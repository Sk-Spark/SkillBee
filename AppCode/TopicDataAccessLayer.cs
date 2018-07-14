using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SkillBee.AppCode
{
    public class Topic
    {
        public int TopicID { get; set; }
        public int Display { get; set; }
        public string TopicName { get; set; }
        public string TopicPageID { get; set; }
        public List<SubTopic> SubTopic
        {
            get
            { 
                return SubTopicDataAccessLayer. GetSubTopics(this.TopicID);
            }
        }
    }

    public class TopicDataAccessLayer
    {
        public static List<Topic> GetTopics()
        {
            List<Topic> ListTopic = new List<Topic>();

            SqlConnection con = BusinessLogic.GetConnection();
            SqlCommand cmd = new SqlCommand("select * from topics", con);

            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            con.Close();

            DataTable dt = new DataTable();
            sda.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Topic Tp = new Topic();
                Tp.TopicID = Convert.ToInt32(dt.Rows[i]["TopicID"]);
                Tp.Display = Convert.ToInt32(dt.Rows[i]["display"]);
                Tp.TopicName = (string)dt.Rows[i]["Topic"];
                Tp.TopicPageID = (string)dt.Rows[i]["TopicPageID"];

                ListTopic.Add(Tp);
            }

            return ListTopic;

        }
    }

}