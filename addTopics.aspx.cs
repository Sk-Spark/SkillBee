using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SkillBee.AppCode;

namespace SkillBee
{
    public partial class addTopics : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["CurrentUser"] == null)
            //{
            //    Response.Redirect("~/default.aspx");
            //}

            if (IsPostBack && Event.Value == "edit")
            {
                addE_Click(sender, e);
            }


            DataTable dt = BusinessLogic.GetTableTopics();

            if (dt.Rows.Count > 0)
            {
                for (int i = dt.Rows.Count - 1; i >= 0; i--)
                {
                    int TopicID = Convert.ToInt32(dt.Rows[i]["TopicID"]);
                    int Display = Convert.ToInt32(dt.Rows[i]["display"]);
                    string Topic = dt.Rows[i]["Topic"].ToString();
                    string TopicPageID = dt.Rows[i]["TopicPageID"].ToString();
                    Button Edit = new Button();
                    Button Del = new Button();

                    TableRow tr = new TableRow();
                    TableCell c1 = new TableCell();
                    TableCell c2 = new TableCell();
                    TableCell c3 = new TableCell();
                    TableCell c4 = new TableCell();
                    TableCell c5 = new TableCell();

                    tr.ID = TopicID.ToString();
                    c1.ID = tr.ID + "c1";
                    c2.ID = tr.ID + "c2";
                    c3.ID = tr.ID + "c3";
                    c4.ID = tr.ID + "c4";
                    c5.ID = tr.ID + "c5";

                    //LblResult.Text += " : " + tr.ID;

                    Edit.Text = "Edit";
                    Del.Text = "Delete";

                    Edit.ID = "Edit_" + TopicID.ToString();
                    Del.ID = "Del_" + TopicID.ToString();
                    Edit.CssClass = Del.CssClass = "button";

                    Del.Click += Del_Click;
                    Edit.Click += Edit_Click;


                    c1.CssClass = "TableCell";
                    c2.CssClass = "TableCell";
                    c3.CssClass = "TableCell";
                    c4.CssClass = "TableCell";
                    c5.CssClass = "TableCell";

                    c1.Text = TopicID.ToString();
                    c2.Text = Topic;
                    c3.Text = TopicPageID;

                    if (Display == 0)
                        c4.Text = "Hidden";
                    else
                        c4.Text = "Visible";

                    c5.Controls.Add(Edit);
                    c5.Controls.Add(Del);

                    tr.Controls.Add(c1);
                    tr.Controls.Add(c2);
                    tr.Controls.Add(c3);
                    tr.Controls.Add(c4);
                    tr.Controls.Add(c5);

                    TableTopic.Controls.Add(tr);

                    Control cont = TableTopic.FindControl(tr.ID);

                    //if (cont == null)
                    //{
                    //    LblResult.Text += " tr " + tr.ID + " :: Not ";
                    //}
                    //else
                    //{
                    //    LblResult.Text += " tr " + tr.ID + " :: Yes ";
                    //}
                }
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int Display = Convert.ToInt32(TextBoxDisplay.Text.ToString());
            string TopicName = TextBoxTopicName.Text.ToString();
            string TopicPageID = TextBoxTopicID.Text.ToString();

            if (BusinessLogic.InsertTopic(Display, TopicName, TopicPageID))
            {
                Response.Redirect("~/addTopics.aspx");
            }
            else
            {
                result.InnerHtml = "Unable to Add Topic to Database";
            }
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.ID;
            int x = id.LastIndexOf("_");
            string xid = id.Substring(x + 1);
            //LblResult.Text = xid;

            if (BusinessLogic.DelFromTopic(Convert.ToInt32(xid)))
            {
                Response.Redirect("~/addTopics.aspx");
            }
            else
            {
                Response.Write("Unable to Delete");
            }
        }


        protected void Edit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.ID;
            int x = id.LastIndexOf("_");
            string trid = id.Substring(x + 1);
            //LblResult.Text += " : trid " + trid;

            TopicID.Value = trid;

            TableRow tr = (TableRow)TableTopic.FindControl(trid);
            TableCell c1 = (TableCell)TableTopic.FindControl(trid + "c1");
            TableCell c2 = (TableCell)TableTopic.FindControl(trid + "c2");
            TableCell c3 = (TableCell)TableTopic.FindControl(trid + "c3");
            TableCell c4 = (TableCell)TableTopic.FindControl(trid + "c4");
            TableCell c5 = (TableCell)TableTopic.FindControl(trid + "c5");

            Button addE = new Button();
            addE.Text = "SAVE";
            addE.CssClass = "button";
            //addE.Click += addE_Click;
            addE.OnClientClick = "return EditFunction();";

            addE.ID = "addE_" + trid;

            //LblResult.Text = "C2Text : " + TableTopic.FindControl(trid).ID;

            string c2Text, c3Text, c4Text;

            c2Text = c2.Text;
            c3Text = c3.Text;
            c4Text = c4.Text;

            c2.Text = "";
            c3.Text = "";
            c4.Text = "";
            c5.Controls.RemoveAt(0);
            c5.Controls.RemoveAt(0);

            TextBox TextBoxTopicName = new TextBox();
            TextBox TextBoxTopicID = new TextBox();
            TextBox TextBoxDisplay = new TextBox();

            TextBoxTopicName.CssClass = "txtBox";
            TextBoxTopicID.CssClass = "txtBox";
            TextBoxDisplay.CssClass = "txtBox";

            TextBoxTopicName.Text = c2Text;
            TextBoxTopicID.Text = c3Text;

            if (c4Text == "Hidden")
                TextBoxDisplay.Text = "0";
            else
                TextBoxDisplay.Text = "1";

            c5.Controls.Add(addE);

            TextBoxTopicName.ID = "TextBoxTopicNameE";
            TextBoxTopicID.ID = "TextBoxTopicIDE";
            TextBoxDisplay.ID = "TextBoxDisplayE";

            c2.Controls.Add(TextBoxTopicName);
            c3.Controls.Add(TextBoxTopicID);
            c4.Controls.Add(TextBoxDisplay);

            //bool l = BusinessLogic.UpdateTopic(1, 10, "ssss", "ssss");
            //addE_Click(sender, e);

        }

        protected void addE_Click(object sender, EventArgs e)
        {

            Event.Value = "";            
            //TextBox TopicName = (TextBox)TableTopic.FindControl("TextBoxTopicNameE");
            //TextBox PageID = (TextBox)TableTopic.FindControl("TextBoxTopicIDE");
            //TextBox Display = (TextBox)TableTopic.FindControl("TextBoxDisplayE");

            //Button btn = (Button)sender;
            //string id = btn.ID;
            //int x = id.LastIndexOf("_");
            //string xid = id.Substring(x + 1);
            int ID = Convert.ToInt32(TopicID.Value);

            //LblResult.Text += " addE : " + ID;

            if (BusinessLogic.UpdateTopic(Convert.ToInt32(Display.Value), ID, TopicName.Value, PageID.Value))
            {
                Response.Redirect("~/addTopics.aspx");
            }
            else
            {
                LblResult.Text = "Unable to Add Topic to Database";
            }
        }

        protected void SubTopics_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.ID;
            int x = id.LastIndexOf("_");
            string xid = id.Substring(x + 1);
            LblResult.Text = xid;
        }

    }
}