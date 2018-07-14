using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SkillBee.AppCode
{
    public class Questions
    {
        public int    QuesID { get; set; }
        public int    ChallengeID{ get; set; }
        public string Challenge  { get; set; }
        public string Ques{ get; set; }
        public string Ans1{ get; set; }
        public string Ans2{ get; set; }
        public string Ans3{ get; set; }
        public string Ans4{ get; set; }
        public int    CorrectAns{ get; set; }

        public Questions()
        {
            QuesID     =0;
            ChallengeID=0;
            Challenge = "Demo";
            Ques = "Demo";
            Ans1 = "Demo";
            Ans2 = "Demo";
            Ans3 = "Demo";
            Ans4 = "Demo";
            CorrectAns = 0;        
        }
    }
        
    
    public class QuestionDataAccessLayer
    {
        public static List<Questions> GetQuestions(int ChallengeID)
        {
            DataTable dt = new DataTable();
            List<Questions> QuesList = new List<Questions>();

            string qry = "select * from questions where ChallengesID="+ChallengeID;
            SqlConnection con = BusinessLogic.GetConnection();
            SqlDataAdapter sda = new SqlDataAdapter(qry,con);
            sda.Fill(dt);

            string CurrQues;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Questions q = new Questions();
                q.ChallengeID = ChallengeID;
                                
                CurrQues = (string)dt.Rows[i]["Ques"];
                dt.Rows[i]["Ques"] = CurrQues.Replace("/br/", "<br>");

                q.Ques= (string)dt.Rows[i]["Ques"];
                q.QuesID=(Int32)dt.Rows[i]["QuesID"];
                q.Ans1=(string)dt.Rows[i]["Ans1"];
                q.Ans2=(string)dt.Rows[i]["Ans2"];
                q.Ans3=(string)dt.Rows[i]["Ans3"];
                q.Ans4=(string)dt.Rows[i]["Ans4"];
                q.CorrectAns=(Int32)dt.Rows[i]["CorrectAns"];
                q.Challenge = GetChallengeName(ChallengeID);
                QuesList.Add(q);
            }

            return QuesList;
        }

        public static string GetChallengeName(int ChallengeID)
        {
            SqlConnection con = BusinessLogic.GetConnection();
            SqlCommand cmd = new SqlCommand("select Heading1 from challenges where ChallengesID="+ChallengeID,con);
            con.Open();
            string challengeName = (string)cmd.ExecuteScalar();

            cmd = new SqlCommand("select Heading2 from challenges where ChallengesID=" + ChallengeID,con);
            challengeName += " " + (string)cmd.ExecuteScalar();
            challengeName += " Challenge";

            con.Close();
            return challengeName;
        }
    }
}