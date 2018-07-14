using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SkillBee.AppCode;
using System.Data.SqlClient;

namespace SkillBee
{
    public partial class ExamForm : System.Web.UI.Page
    {
        int QuesNo;
        string ChallengesID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/register.aspx");
            }
            
            ChallengesID = Request.QueryString["ID"];

            if(!IsPostBack)
            BindData(Convert.ToInt32(ChallengesID));
        }

        public void BindData(int ChallengesID)
        {
            List<Questions> QuesList = QuestionDataAccessLayer.GetQuestions(ChallengesID);

            if (HiddenQuesNo.Value != "")
                QuesNo = Convert.ToInt32(HiddenQuesNo.Value);
            else
            {
                QuesNo = 0;
                HiddenQuesNo.Value = "0";
            }

            if (QuesNo == 0)
                BtnPrevious.Visible = false;
            else
                BtnPrevious.Visible = true;

            if (QuesNo == 9)
            {
                BtnNext.Visible = false;
                BtnSubmit.Visible = true;
            }
            else
                BtnNext.Visible = true;

            DivChallengeHead.InnerHtml = QuesList[QuesNo].Challenge;
            DivQues.InnerHtml ="Q"+ (QuesNo+1)+". " +QuesList[QuesNo].Ques;
            DivAns1.InnerHtml = QuesList[QuesNo].Ans1;
            DivAns2.InnerHtml = QuesList[QuesNo].Ans2;
            DivAns3.InnerHtml = QuesList[QuesNo].Ans3;
            DivAns4.InnerHtml = QuesList[QuesNo].Ans4;
        }

        protected void BtnPrevious_Click(object sender, EventArgs e)
        {
            int Ans = CheckBoxCheck();
            int Qn = Convert.ToInt32(HiddenQuesNo.Value);
            RecordAns(Qn, Ans);

            HiddenQuesNo.Value = (Convert.ToInt32(HiddenQuesNo.Value) - 1).ToString();
            BindData(Convert.ToInt32(ChallengesID));
            CheckBoxCheck();

            ClearCheckBox();
        }

        protected void BtnNext_Click(object sender, EventArgs e)
        {
            int Ans = CheckBoxCheck();
            int Qn = Convert.ToInt32(HiddenQuesNo.Value);
            RecordAns( Qn, Ans);
            
            HiddenQuesNo.Value = (Convert.ToInt32(HiddenQuesNo.Value) + 1).ToString();
            BindData(Convert.ToInt32(ChallengesID));

            ClearCheckBox();
        }

        protected void RecordAns(int Qn, int Ans)
        {
            if (Ans == 0)
                return;
            if (Qn == 0)
                HiddenQues1.Value = Ans.ToString();
            if (Qn == 1)
                HiddenQues2.Value = Ans.ToString(); 
            if (Qn == 2)
                HiddenQues3.Value = Ans.ToString(); 
            if (Qn == 3)
                HiddenQues4.Value = Ans.ToString(); 
            if (Qn == 4)
                HiddenQues5.Value = Ans.ToString(); 
            if (Qn == 5)
                HiddenQues6.Value = Ans.ToString(); 
            if (Qn == 6)
                HiddenQues7.Value = Ans.ToString(); 
            if (Qn == 7)
                HiddenQues8.Value = Ans.ToString(); 
            if (Qn == 8)
                HiddenQues9.Value = Ans.ToString();
            if (Qn == 9)
                HiddenQues10.Value = Ans.ToString();
        }

        protected void ClearCheckBox()
        {
            checkbox1.Checked = checkbox2.Checked = checkbox3.Checked = checkbox4.Checked = false;
        }

        protected int CheckBoxCheck()
        {
            int rv = 0;
            if (checkbox1.Checked == true)
            {
                rv = 1;
            }

            if (checkbox2.Checked == true)
            {
                rv = 2;
            }

            if (checkbox3.Checked == true)
            {
                rv = 3;
            }

            if (checkbox4.Checked == true)
            {
                rv = 4;
            }

            return rv;
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            int MaxMarks = 10;
            int ObtainMarks = 0;
            int ChallengeID = Convert.ToInt32(ChallengesID);
            int UserID = Convert.ToInt32(Session["UserID"]);

            int x = 0;
            string qry = "select count(*) from results where UserID=" + UserID + " and ChallengeID=" + ChallengeID;
            SqlConnection con = BusinessLogic.GetConnection();
            SqlCommand cmd = new SqlCommand(qry,con);

            con.Open();
            x = (Int32)cmd.ExecuteScalar();
            con.Close();

            if (x > 0)
            {
                qry = "delete from results where UserID=" + UserID + " and ChallengeID=" + ChallengeID;
                cmd = new SqlCommand(qry, con);

                con.Open();
                x = cmd.ExecuteNonQuery();
                con.Close();
 
            }

            List<Questions> QuesList = QuestionDataAccessLayer.GetQuestions(ChallengeID);

            if (Convert.ToInt32(HiddenQues1.Value) == QuesList[0].CorrectAns)
            {
                ObtainMarks++;
            }

            if (Convert.ToInt32(HiddenQues2.Value) == QuesList[1].CorrectAns)
            {
                ObtainMarks++;
            }
            if (Convert.ToInt32(HiddenQues3.Value) == QuesList[2].CorrectAns)
            {
                ObtainMarks++;
            }
            if (Convert.ToInt32(HiddenQues4.Value) == QuesList[3].CorrectAns)
            {
                ObtainMarks++;
            }
            if (Convert.ToInt32(HiddenQues5.Value) == QuesList[4].CorrectAns)
            {
                ObtainMarks++;
            }
            if (Convert.ToInt32(HiddenQues6.Value) == QuesList[5].CorrectAns)
            {
                ObtainMarks++;
            }
            if (Convert.ToInt32(HiddenQues7.Value) == QuesList[6].CorrectAns)
            {
                ObtainMarks++;
            }
            if (Convert.ToInt32(HiddenQues8.Value) == QuesList[7].CorrectAns)
            {
                ObtainMarks++;
            }
            if (Convert.ToInt32(HiddenQues9.Value) == QuesList[8].CorrectAns)
            {
                ObtainMarks++;
            }
            if (Convert.ToInt32(HiddenQues10.Value) == QuesList[9].CorrectAns)
            {
                ObtainMarks++;
            }


            if (BusinessLogic.InsertResult(UserID, ChallengeID, MaxMarks, ObtainMarks))
            {
                Response.Write(" Test Completed Successfully... ");
                DivCounterCall.Visible = false;
                Response.Redirect("~/Results.aspx");
            }
            else
            {
                Response.Write(" Test was NOT Completed Successfully... ");
                DivCounterCall.Visible = false; 
            }

        }
    }
}