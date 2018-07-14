using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SkillBee.AppCode
{
    public class Challenges
    {
        public int ChallengesID { get; set; }
        public int SubTopicID { get; set; }
        public int Display { get; set; }
        public string Heading1 { get; set; }
        public string Heading2 { get; set; }
    }

    public class ChallengesDataAccessLayer
    {
        public static List<Challenges> GetChallenges(int SubTopicID)
        {
            List<Challenges> ListChallenges = new List<Challenges>();

            SqlConnection con = BusinessLogic.GetConnection();
            SqlCommand cmd = new SqlCommand("select * from challenges where SubTopicID=@SubTopicID", con);
            cmd.Parameters.AddWithValue("@SubTopicID", SubTopicID);

            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            con.Close();

            DataTable dt = new DataTable();
            sda.Fill(dt);

            

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Challenges ch = new Challenges();
                ch.ChallengesID = Convert.ToInt32(dt.Rows[i]["ChallengesID"]);
                ch.SubTopicID = Convert.ToInt32(dt.Rows[i]["SubTopicID"]);
                ch.Display = Convert.ToInt32(dt.Rows[i]["Display"]);
                ch.Heading1 = (string)dt.Rows[i]["Heading1"];
                ch.Heading2 = (string)dt.Rows[i]["Heading2"];

                ListChallenges.Add(ch);
            }

            return ListChallenges;
        }

        public static string GetSubtopic(int SubTopicID)
        {
            SqlConnection con = BusinessLogic.GetConnection();
            SqlCommand cmd = new SqlCommand("select SubTopicHeading from subTopics where SubTopicID=@SubTopicID", con);
            cmd.Parameters.AddWithValue("@SubTopicID", SubTopicID);

            con.Open();
            string ST = (string)cmd.ExecuteScalar();
            con.Close();

            return ST;
        }

    }
}