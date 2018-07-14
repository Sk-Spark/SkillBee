using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SkillBee.AppCode
{
    public class Result
    {
        public int ChallengeID { get; set; }
        public string ChallengeName { get; set; }
        public int MaxMarks { get; set; }
        public int MarksObtain { get; set; }
    }

    
    public class ResultDataAccessLayer
    {
        public static List<Result> GetResults(int UserID)
        {
            List<Result> ResultList = new List<Result>();
            DataTable dt = new DataTable();

            string qry = "select * from Results where UserID=" + UserID;
            SqlConnection con = BusinessLogic.GetConnection();
            SqlDataAdapter sda = new SqlDataAdapter(qry, con);
            sda.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Result r = new Result();

                r.ChallengeID = (Int32)dt.Rows[i]["ChallengeID"];
                r.MaxMarks = (Int32)dt.Rows[i]["MaxMarks"];
                r.MarksObtain = (Int32)dt.Rows[i]["ObtainMarks"];
                r.ChallengeName = QuestionDataAccessLayer.GetChallengeName(r.ChallengeID);
                ResultList.Add(r);
            }

            return ResultList;
        }
    }
}