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
    public partial class subTopics : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack && Event.Value == "edit")
            {
                addE_Click(sender, e);
            }

            if (!IsPostBack)
            {
                FillDDl(DDLTopicID);
            }

            DataTable dt = BusinessLogic.GetTableSubTopics();
            DataTable DtTopic = BusinessLogic.GetTopicsFromTableTopics();

            if (dt.Rows.Count > 0)
            {
                for (int i = dt.Rows.Count - 1; i >= 0; i--)
                {
                    int SubTopicID = Convert.ToInt32(dt.Rows[i]["SubTopicID"]);
                    int TopicID = Convert.ToInt32(dt.Rows[i]["TopicID"]);
                    int Display = Convert.ToInt32(dt.Rows[i]["display"]);
                    string SubTopicHeading = dt.Rows[i]["SubTopicHeading"].ToString();
                    string SubTopicImg = dt.Rows[i]["SubTopicImg"].ToString();
                    Button Edit = new Button();
                    Button Del = new Button();

                    TableRow tr = new TableRow();
                    TableCell c1 = new TableCell();
                    TableCell c2 = new TableCell();
                    TableCell c3 = new TableCell();
                    TableCell c4 = new TableCell();
                    TableCell c5 = new TableCell();
                    TableCell c6 = new TableCell();

                    tr.ID = SubTopicID.ToString();
                    c1.ID = tr.ID + "c1";
                    c2.ID = tr.ID + "c2";
                    c3.ID = tr.ID + "c3";
                    c4.ID = tr.ID + "c4";
                    c5.ID = tr.ID + "c5";
                    c6.ID = tr.ID + "c6";

                    //LblResult.Text += " : " + tr.ID;

                    Edit.Text = "Edit";
                    Del.Text = "Delete";

                    Edit.ID = "Edit_" + SubTopicID.ToString();
                    Del.ID = "Del_" + SubTopicID.ToString();
                    Edit.CssClass = Del.CssClass = "button";

                    Del.Click += Del_Click;
                    Edit.Click += Edit_Click;

                    c1.CssClass = "TableCell";
                    c2.CssClass = "TableCell";
                    c3.CssClass = "TableCell";
                    c4.CssClass = "TableCell";
                    c5.CssClass = "TableCell";
                    c6.CssClass = "TableCell";

                    c1.Text = SubTopicID.ToString();

                    for (int j = 0; j < DtTopic.Rows.Count; j++)
                    {
                        if ((Convert.ToInt32(TopicID)) == (Convert.ToInt32(DtTopic.Rows[j]["TopicID"])))
                        {
                            c2.Text = DtTopic.Rows[j]["Topic"].ToString();
                        }

                    }

                    c3.Text = SubTopicHeading;

                    Image img = new Image();
                    img.ID = "Img_" + tr.ID;
                    img.ImageUrl = SubTopicImg;
                    img.Width = 120;
                    img.Height = 120;
                    c4.Controls.Add(img);

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

        private void FillDDl(DropDownList dll)
        {
            DataTable dt = BusinessLogic.GetTopicsFromTableTopics();

            dll.DataSource = dt;
            dll.DataTextField = "Topic";
            dll.DataValueField = "TopicID";
            dll.DataBind();

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int TopicID = Convert.ToInt32(DDLTopicID.SelectedValue.ToString());
            int Display = Convert.ToInt32(TextBoxDisplay.Text.ToString());
            string SubTopicHeading = TextBoxSubTopicHeading.Text.ToString();
            string SubTopicImg = TextBoxSubTopicImg.FileName.ToString();
            string ImgPath = "~/img/" + SubTopicImg;

            TextBoxSubTopicImg.SaveAs(Server.MapPath(ImgPath));

            if (BusinessLogic.InsertSubTopic(TopicID, SubTopicHeading, ImgPath, Display))
            {
                Response.Redirect("~/subTopics.aspx");
            }
            else
            {
                result.InnerHtml = "Unable to Add Topic to Database";
            }
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            DataTable DtTopic = BusinessLogic.GetTopicsFromTableTopics();
            Button btn = (Button)sender;
            string id = btn.ID;
            int x = id.LastIndexOf("_");
            string trid = id.Substring(x + 1);

            SubTopicID.Value = trid;
            //LblResult.Text += " : trid " + trid;

            //TopicID.Value = trid;

            TableRow tr = (TableRow)TableTopic.FindControl(trid);
            TableCell c1 = (TableCell)TableTopic.FindControl(trid + "c1");
            TableCell c2 = (TableCell)TableTopic.FindControl(trid + "c2");
            TableCell c3 = (TableCell)TableTopic.FindControl(trid + "c3");
            TableCell c4 = (TableCell)TableTopic.FindControl(trid + "c4");
            TableCell c5 = (TableCell)TableTopic.FindControl(trid + "c5");
            TableCell c6 = (TableCell)TableTopic.FindControl(trid + "c6");

            Image img = (Image)TableTopic.FindControl("Img_" + trid);


            //if (img == null)
            //    LblResult.Text += "Image: No";
            //else
            //    LblResult.Text += "Image: Yes";


            Button addE = new Button();
            addE.ID = "addE_" + trid;
            addE.Text = "SAVE";
            addE.CssClass = "button";
            addE.Click += addE_Click;
            addE.OnClientClick = "return EditFunction();";


            ////LblResult.Text = "C2Text : " + TableTopic.FindControl(trid).ID;

            string c2Text, c3Text, c4Text, c5Text;

            c2Text = c2.Text;
            c3Text = c3.Text;
            //c4Text = c4.Text;
            c5Text = c5.Text;

            //LblResult.Text += " c2.Text: " + c2Text + " c3.Text: " + c3Text + " c5.Text: " + c5Text;


            c2.Text = "";
            c3.Text = "";
            //c4.Text = "";
            c5.Text = "";
            c6.Controls.RemoveAt(0);
            c6.Controls.RemoveAt(0);

            DropDownList TopicName = new DropDownList();
            FileUpload TopicImg = new FileUpload();
            TextBox TextBoxSubTopic = new TextBox();
            TextBox TextBoxDisplay = new TextBox();

            TextBoxSubTopic.CssClass = "txtBox";
            TextBoxDisplay.CssClass = "txtBox";
            TopicImg.CssClass = "txtBox";

            FillDDl(TopicName);
            TopicImg.Attributes.Add("value", img.ImageUrl.Substring(img.ImageUrl.LastIndexOf('/') + 1));

            TopicName.Items.FindByText(c2Text).Selected = true;
            TopicName.EnableViewState = true;

            TextBoxSubTopic.Text = c3Text;
            TextBoxDisplay.Text = c5Text;

            if (c5Text == "Hidden")
                TextBoxDisplay.Text = "0";
            else
                TextBoxDisplay.Text = "1";

            TopicName.ID = "DDLTopicIDE";
            TopicImg.ID = "TextBoxSubTopicImgE";
            TextBoxSubTopic.ID = "TextBoxSubTopicHeadingE";
            TextBoxDisplay.ID = "TextBoxDisplayE";

            TopicImg.Width = 200;


            c2.Controls.Add(TopicName);
            c3.Controls.Add(TextBoxSubTopic);
            c4.Controls.AddAt(1, TopicImg);
            c5.Controls.Add(TextBoxDisplay);
            c6.Controls.Add(addE);

        }

        private void addE_Click(object sender, EventArgs e)
        {
            Event.Value = "";

            string ImgPath = "~/img/DemoImg/" + SubTopicImg.Value;
            FileUpload TopicImg = new FileUpload();
            TopicImg.ID = "TextBoxSubTopicImgE";
            TableCell1.Controls.Add(TopicImg);
            TopicImg.SaveAs(Server.MapPath(ImgPath));

            if (BusinessLogic.UpdateSubTopic(Convert.ToInt32(Display.Value), Convert.ToInt32(SubTopicID.Value), Convert.ToInt32(TopicID.Value), SubTopicHeading.Value, ImgPath))
            {
                Response.Redirect("~/subTopics.aspx");
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

            if (BusinessLogic.DelFromSubTopic(Convert.ToInt32(xid)))
            {
                Response.Redirect("~/subTopics.aspx");
            }
            else
            {
                LblResult.Text = "Unable to Delete";
            }
        }


    }
}