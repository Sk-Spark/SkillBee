using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SkillBee.AppCode;

namespace SkillBee
{
    public partial class register : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonSigUp_Click(object sender, EventArgs e)
        {
            string UserName, Password, Email, Gender;

            UserName = TextBoxUserNameSignUp.Text;
            Password = TextBoxPasswordSignUp1.Text;
            Email = TextBoxEmail.Text;
            Gender = RadioButtonList1.Text;
            //SqlConnection con = new SqlConnection("data source=BOBY\\SQLEXPRESS; database=SkillBeeDB; integrated security=SSPI ");

            SqlConnection con = BusinessLogic.GetConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select count(Email) from registration where Email= @email";
            cmd.Parameters.AddWithValue("@email", Email);
            con.Open();
            int rv = (Int32)cmd.ExecuteScalar();
            con.Close();
            st.Value = "rv: "+rv;


            if (rv > 0)
            {
                st.Value = "1";
                HiddenFieldValue.Value = "Email Id You Entered is already in USE !!!";
                return;
            }

            cmd.CommandText = "insert into registration values(@nm, @email2, @pass, @gen)";
            cmd.Parameters.AddWithValue("@nm", UserName);
            cmd.Parameters.AddWithValue("@email2", Email);
            cmd.Parameters.AddWithValue("@pass", Password);
            cmd.Parameters.AddWithValue("@gen", Gender);

            con.Open();
            rv = cmd.ExecuteNonQuery();
            con.Close();

            if (rv > 0)
            {
                st.Value = "1";
                HiddenFieldValue.Value = "Registration Successfull !!!";
                return;
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string email, pass,UserName,UserID;
            email = TextBoxEmailLogin.Text.ToString();
            pass = TextBoxPassword.Text.ToString();

            if (BusinessLogic.Login(email, pass,out UserName, out UserID))
            {
                st.Value = "2";
                HiddenFieldValue.Value = "Login Successfull !!!";
                Session["CurrentUser"] = UserName;
                Session["UserID"] = UserID;
                Response.Redirect("default.aspx");
                return;
            }
            else
            {
                st.Value = "2";
                HiddenFieldValue.Value = "Email and Password Combination is WRONG";
                return;
            }
            
        }
    }
}