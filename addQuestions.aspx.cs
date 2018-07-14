using SkillBee.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillBee
{
    public partial class addQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack && Event.Value == "edit")
            {
                addE_Click(sender, e);
            }

            if (!IsPostBack)
            {
                FillDDl(DDLChallengeID);
            }

            DataTable dt = BusinessLogic.GetTableQuestion();
            DataTable DtChallenges = BusinessLogic.GetChallengesFromTableChallenges();

            if (dt.Rows.Count > 0)
            {
                for (int i = dt.Rows.Count - 1; i >= 0; i--)
                {
                    int ChallengesID = Convert.ToInt32(dt.Rows[i]["ChallengesID"]);
                    int QuesID = Convert.ToInt32(dt.Rows[i]["QuesID"]);
                    int CorrectAns = Convert.ToInt32(dt.Rows[i]["CorrectAns"].ToString());
                    string Ques = dt.Rows[i]["Ques"].ToString();
                    string Ans1 = dt.Rows[i]["Ans1"].ToString();
                    string Ans2 = dt.Rows[i]["Ans2"].ToString();
                    string Ans3 = dt.Rows[i]["Ans3"].ToString();
                    string Ans4 = dt.Rows[i]["Ans4"].ToString();
                    Button Edit = new Button();
                    Button Del = new Button();

                    TableRow tr = new TableRow();
                    TableCell c1 = new TableCell();
                    TableCell c2 = new TableCell();
                    TableCell c3 = new TableCell();
                    TableCell c4 = new TableCell();
                    TableCell c5 = new TableCell();
                    TableCell c6 = new TableCell();
                    TableCell c7 = new TableCell();
                    TableCell c8 = new TableCell();
                    TableCell c9 = new TableCell();

                    tr.ID = QuesID.ToString();
                    c1.ID = tr.ID + "c1";
                    c2.ID = tr.ID + "c2";
                    c3.ID = tr.ID + "c3";
                    c4.ID = tr.ID + "c4";
                    c5.ID = tr.ID + "c5";
                    c6.ID = tr.ID + "c6";
                    c7.ID = tr.ID + "c7";
                    c8.ID = tr.ID + "c8";
                    c9.ID = tr.ID + "c9";

                    //LblResult.Text += " : " + tr.ID;

                    Edit.Text = "Edit";
                    Del.Text = "Delete";

                    Edit.ID = "Edit_" + QuesID.ToString();
                    Del.ID = "Del_" + QuesID.ToString();
                    Edit.CssClass = Del.CssClass = "button";

                    Del.Click += Del_Click;
                    Edit.Click += Edit_Click;

                    c1.CssClass = "TableCell";
                    c2.CssClass = "TableCell";
                    c3.CssClass = "TableCell";
                    c4.CssClass = "TableCell";
                    c5.CssClass = "TableCell";
                    c6.CssClass = "TableCell";
                    c7.CssClass = "TableCell";
                    c8.CssClass = "TableCell";
                    c9.CssClass = "TableCell";

                    c1.Text = QuesID.ToString();

                    for (int j = 0; j < DtChallenges.Rows.Count; j++)
                    {
                        if (ChallengesID == (Convert.ToInt32(DtChallenges.Rows[j]["ChallengesID"])))
                        {
                            c2.Text = DtChallenges.Rows[j]["Heading"].ToString();
                        }

                    }

                    c3.Text = Ques;
                    c4.Text = Ans1;
                    c5.Text = Ans2;
                    c6.Text = Ans3;
                    c7.Text = Ans4;
                    c8.Text = CorrectAns.ToString(); ;

                    c9.Controls.Add(Edit);
                    c9.Controls.Add(Del);

                    tr.Controls.Add(c1);
                    tr.Controls.Add(c2);
                    tr.Controls.Add(c3);
                    tr.Controls.Add(c4);
                    tr.Controls.Add(c5);
                    tr.Controls.Add(c6);
                    tr.Controls.Add(c7);
                    tr.Controls.Add(c8);
                    tr.Controls.Add(c9);

                    TableTopic.Controls.Add(tr);

                    //Control cont = TableTopic.FindControl(tr.ID);

                }
            }

        }

        private void addE_Click(object sender, EventArgs e)
        {
            //UpdateQuestions(int QuesID, int ChallengesID, int CorrectAns, string Ques, string Ans1, string Ans2, string Ans3, string Ans4)
            Event.Value = "";

            //LblResult.Text += " Challange " + QuesID.Value + " Subtopic : " + ChallengesID.Value;

            if (BusinessLogic.UpdateQuestions(Convert.ToInt32(QuesID.Value.ToString()), Convert.ToInt32(ChallengesID.Value.ToString()), Convert.ToInt32(CorrectAns.Value.ToString()), Ques.Value, Ans1.Value, Ans2.Value, Ans3.Value, Ans4.Value))
            {
                Response.Redirect("~/addQuestions.aspx");
            }
            else
            {
                LblResult.Text = "Unable to Add Questions to Database";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int ChallengesID = Convert.ToInt32(DDLChallengeID.SelectedValue.ToString());
            int CorrectAns = Convert.ToInt32(TextBoxCorrectAns.Text.ToString());
            string Ques = TextBoxQues.Text.ToString();
            string Ans1 = TextBoxAns1.Text;
            string Ans2 = TextBoxAns2.Text;
            string Ans3 = TextBoxAns3.Text;
            string Ans4 = TextBoxAns4.Text;

            if (BusinessLogic.InsertQuestions(ChallengesID, CorrectAns, Ques, Ans1, Ans2, Ans3, Ans4))
            {
                Response.Redirect("~/addQuestions.aspx");
            }
            else
            {
                LblResult.Text = "Unable to Add Question to Database";
            }
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.ID;
            int x = id.LastIndexOf("_");
            string trid = id.Substring(x + 1);
            //LblResult.Text += " : trid " + trid;
            QuesID.Value = trid;

            TableRow tr = (TableRow)TableTopic.FindControl(trid);
            TableCell c1 = (TableCell)TableTopic.FindControl(trid + "c1");
            TableCell c2 = (TableCell)TableTopic.FindControl(trid + "c2");
            TableCell c3 = (TableCell)TableTopic.FindControl(trid + "c3");
            TableCell c4 = (TableCell)TableTopic.FindControl(trid + "c4");
            TableCell c5 = (TableCell)TableTopic.FindControl(trid + "c5");
            TableCell c6 = (TableCell)TableTopic.FindControl(trid + "c6");
            TableCell c7 = (TableCell)TableTopic.FindControl(trid + "c7");
            TableCell c8 = (TableCell)TableTopic.FindControl(trid + "c8");
            TableCell c9 = (TableCell)TableTopic.FindControl(trid + "c9");

            Button addE = new Button();
            addE.Text = "SAVE";
            addE.CssClass = "button";
            //addE.Click += addE_Click;
            addE.OnClientClick = "return EditFunction();";

            addE.ID = "addE_" + trid;

            //LblResult.Text = "C2Text : " + TableTopic.FindControl(trid).ID;

            string c2Text, c3Text, c4Text, c5Text, c6Text, c7Text, c8Text;

            c2Text = c2.Text;
            c3Text = c3.Text;
            c4Text = c4.Text;
            c5Text = c5.Text;
            c6Text = c6.Text;
            c7Text = c7.Text;
            c8Text = c8.Text;

            c2.Text = "";
            c3.Text = "";
            c4.Text = "";
            c5.Text = "";
            c6.Text = "";
            c7.Text = "";
            c8.Text = "";
            c9.Controls.RemoveAt(0);
            c9.Controls.RemoveAt(0);

            DropDownList DDLChallengeID = new DropDownList();
            TextBox TextBoxQues = new TextBox();
            TextBox TextBoxAns1 = new TextBox();
            TextBox TextBoxAns2 = new TextBox();
            TextBox TextBoxAns3 = new TextBox();
            TextBox TextBoxAns4 = new TextBox();
            TextBox TextBoxCorrectAns = new TextBox();

            FillDDl(DDLChallengeID);
            DDLChallengeID.Items.FindByText(c2Text).Selected = true;

            TextBoxQues.CssClass = "txtBox";
            TextBoxAns1.CssClass = "txtBox";
            TextBoxAns2.CssClass = "txtBox";
            TextBoxAns3.CssClass = "txtBox";
            TextBoxAns4.CssClass = "txtBox";
            TextBoxCorrectAns.CssClass = "txtBox";

            TextBoxQues.Text = c3Text;
            TextBoxAns1.Text = c4Text;
            TextBoxAns2.Text = c5Text;
            TextBoxAns3.Text = c6Text;
            TextBoxAns4.Text = c7Text;
            TextBoxCorrectAns.Text = c8Text;

            DDLChallengeID.ID = "DDLChallengeIDE";
            TextBoxQues.ID = "TextBoxQuesE";
            TextBoxAns1.ID = "TextBoxAns1E";
            TextBoxAns2.ID = "TextBoxAns2E";
            TextBoxAns3.ID = "TextBoxAns3E";
            TextBoxAns4.ID = "TextBoxAns4E";
            TextBoxCorrectAns.ID = "TextBoxCorrectAnsE";

            c2.Controls.Add(DDLChallengeID);
            c3.Controls.Add(TextBoxQues);
            c4.Controls.Add(TextBoxAns1);
            c5.Controls.Add(TextBoxAns2);
            c6.Controls.Add(TextBoxAns3);
            c7.Controls.Add(TextBoxAns4);
            c8.Controls.Add(TextBoxCorrectAns);
            c9.Controls.Add(addE);

        }

        private void Del_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.ID;
            int x = id.LastIndexOf("_");
            string xid = id.Substring(x + 1);

            if (BusinessLogic.DelFromQuestion(Convert.ToInt32(xid)))
            {
                Response.Redirect("~/addQuestions.aspx");
            }
            else
            {
                LblResult.Text = "Unable to Delete";
            }
        }

        private void FillDDl(DropDownList dll)
        {
            DataTable dt = BusinessLogic.GetChallengesFromTableChallenges();

            dll.DataSource = dt;
            dll.DataTextField = "Heading";
            dll.DataValueField = "ChallengesID";
            dll.DataBind();

        }

    }
}