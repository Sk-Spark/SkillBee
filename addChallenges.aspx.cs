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
    public partial class addChallenges : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack && Event.Value == "edit")
            {
                addE_Click(sender, e);
            }

            if (!IsPostBack)
            {
                FillDDl(DDLSubTopicID);
            }

            DataTable dt = BusinessLogic.GetTableChallenges();
            DataTable DtTopic = BusinessLogic.GetSubTopicsFromTableSubTopics();

            if (dt.Rows.Count > 0)
            {
                for (int i = dt.Rows.Count - 1; i >= 0; i--)
                {
                    int ChallengesID = Convert.ToInt32(dt.Rows[i]["ChallengesID"]);
                    int SubTopicID = Convert.ToInt32(dt.Rows[i]["SubTopicID"]);
                    int Display = Convert.ToInt32(dt.Rows[i]["Display"]);
                    string Heading1 = dt.Rows[i]["Heading1"].ToString();
                    string Heading2 = dt.Rows[i]["Heading2"].ToString();
                    Button Edit = new Button();
                    Button Del = new Button();

                    TableRow tr = new TableRow();
                    TableCell c1 = new TableCell();
                    TableCell c2 = new TableCell();
                    TableCell c3 = new TableCell();
                    TableCell c4 = new TableCell();
                    TableCell c5 = new TableCell();
                    TableCell c6 = new TableCell();

                    tr.ID = ChallengesID.ToString();
                    c1.ID = tr.ID + "c1";
                    c2.ID = tr.ID + "c2";
                    c3.ID = tr.ID + "c3";
                    c4.ID = tr.ID + "c4";
                    c5.ID = tr.ID + "c5";
                    c6.ID = tr.ID + "c6";

                    //LblResult.Text += " : " + tr.ID;

                    Edit.Text = "Edit";
                    Del.Text = "Delete";

                    Edit.ID = "Edit_" + ChallengesID.ToString();
                    Del.ID = "Del_" + ChallengesID.ToString();
                    Edit.CssClass = Del.CssClass = "button";

                    Del.Click += Del_Click;
                    Edit.Click += Edit_Click;

                    c1.CssClass = "TableCell";
                    c2.CssClass = "TableCell";
                    c3.CssClass = "TableCell";
                    c4.CssClass = "TableCell";
                    c5.CssClass = "TableCell";
                    c6.CssClass = "TableCell";

                    c1.Text = ChallengesID.ToString();

                    for (int j = 0; j < DtTopic.Rows.Count; j++)
                    {
                        if ((Convert.ToInt32(SubTopicID)) == (Convert.ToInt32(DtTopic.Rows[j]["SubTopicID"])))
                        {
                            c2.Text = DtTopic.Rows[j]["SubTopicHeading"].ToString();
                        }

                    }

                    c3.Text = Heading1;
                    c4.Text = Heading2;

                    if (Display == 0)
                        c5.Text = "Hidden";
                    else
                        c5.Text = "Visible";

                    c6.Controls.Add(Edit);
                    c6.Controls.Add(Del);

                    tr.Controls.Add(c1);
                    tr.Controls.Add(c2);
                    tr.Controls.Add(c3);
                    tr.Controls.Add(c4);
                    tr.Controls.Add(c5);
                    tr.Controls.Add(c6);

                    TableTopic.Controls.Add(tr);

                    //Control cont = TableTopic.FindControl(tr.ID);

                }
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int SubTopicID = Convert.ToInt32(DDLSubTopicID.SelectedValue.ToString());
            int Display = Convert.ToInt32(TextBoxDisplay.Text.ToString());
            string Heading1 = TextBoxHeading1.Text.ToString();
            string Heading2 = TextBoxHeading2.Text.ToString();

            if (BusinessLogic.InsertChallenges(Display, SubTopicID, Heading1, Heading2))
            {
                Response.Redirect("~/addChallenges.aspx");
            }
            else
            {
                result.InnerHtml = "Unable to Add Topic to Database";
            }
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.ID;
            int x = id.LastIndexOf("_");
            string trid = id.Substring(x + 1);
            //LblResult.Text += " : trid " + trid;

            Challange.Value = trid;

            TableRow tr = (TableRow)TableTopic.FindControl(trid);
            TableCell c1 = (TableCell)TableTopic.FindControl(trid + "c1");
            TableCell c2 = (TableCell)TableTopic.FindControl(trid + "c2");
            TableCell c3 = (TableCell)TableTopic.FindControl(trid + "c3");
            TableCell c4 = (TableCell)TableTopic.FindControl(trid + "c4");
            TableCell c5 = (TableCell)TableTopic.FindControl(trid + "c5");
            TableCell c6 = (TableCell)TableTopic.FindControl(trid + "c6");

            Button addE = new Button();
            addE.Text = "SAVE";
            addE.CssClass = "button";
            //addE.Click += addE_Click;
            addE.OnClientClick = "return EditFunction();";

            addE.ID = "addE_" + trid;

            //LblResult.Text = "C2Text : " + TableTopic.FindControl(trid).ID;

            string c2Text, c3Text, c4Text, c5Text;

            c2Text = c2.Text;
            c3Text = c3.Text;
            c4Text = c4.Text;
            c5Text = c5.Text;

            c2.Text = "";
            c3.Text = "";
            c4.Text = "";
            c5.Text = "";
            c6.Controls.RemoveAt(0);
            c6.Controls.RemoveAt(0);

            DropDownList DDLSubTopicName = new DropDownList();
            TextBox TextBoxHeading1 = new TextBox();
            TextBox TextBoxHeading2 = new TextBox();
            TextBox TextBoxDisplay = new TextBox();

            FillDDl(DDLSubTopicName);
            DDLSubTopicName.Items.FindByText(c2Text).Selected = true;


            TextBoxHeading1.CssClass = "txtBox";
            TextBoxHeading2.CssClass = "txtBox";
            TextBoxDisplay.CssClass = "txtBox";

            DDLSubTopicName.Text = c2Text;
            TextBoxHeading1.Text = c3Text;
            TextBoxHeading2.Text = c4Text;

            if (c5Text == "Hidden")
                TextBoxDisplay.Text = "0";
            else
                TextBoxDisplay.Text = "1";

            c6.Controls.Add(addE);


            DDLSubTopicName.ID = "DDLSubTopicNameE";
            TextBoxHeading1.ID = "TextBoxHeading1E";
            TextBoxHeading2.ID = "TextBoxHeading2E";
            TextBoxDisplay. ID = "TextBoxDisplayE";

            DDLSubTopicName.EnableViewState = true;
            TextBoxHeading1.EnableViewState = true;
            TextBoxHeading2.EnableViewState = true;
            TextBoxDisplay.EnableViewState = true;

            c2.Controls.Add(DDLSubTopicName);
            c3.Controls.Add(TextBoxHeading1);
            c4.Controls.Add(TextBoxHeading2);
            c5.Controls.Add(TextBoxDisplay);

            
        }

        private void addE_Click(object sender, EventArgs e)
        {
            Event.Value = "";

            LblResult.Text += " Challange " + Challange.Value + " Subtopic : " + SubTopicID.Value + " : " + Heading1.Value + " : " + Heading2.Value + " : " + Display.Value;


            if (BusinessLogic.UpdateChallenges(Convert.ToInt32(SubTopicID.Value.ToString()), Heading1.Value, Heading2.Value, Convert.ToInt32(Display.Value), Convert.ToInt32(Challange.Value)))
            {
                Response.Redirect("~/addChallenges.aspx");
            }
            else
            {
                LblResult.Text = "Unable to Add Topic to Database";
            }


        }

        private void Del_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.ID;
            int x = id.LastIndexOf("_");
            string xid = id.Substring(x + 1);

            if (BusinessLogic.DelFromChallenges(Convert.ToInt32(xid)))
            {
                Response.Redirect("~/addChallenges.aspx");
            }
            else
            {
                LblResult.Text = "Unable to Delete";
            }
        }


        private void FillDDl(DropDownList dll)
        {
            DataTable dt = BusinessLogic.GetSubTopicsFromTableSubTopics();

            dll.DataSource = dt;
            dll.DataTextField = "SubTopicHeading";
            dll.DataValueField = "SubTopicID";
            dll.DataBind();

        }
    }
}