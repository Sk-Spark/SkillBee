using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace SkillBee.AppCode
{
    public class BusinessLogic
    {

        public static SqlConnection GetConnection()
        {
            SqlConnection con = new SqlConnection(@"data source=SPARKWINDOWS-PC\SQLEXPRESS; database=SkillBeeDB; integrated security=SSPI ");
            //SqlConnection con = new SqlConnection(@"data source=BOBY\SQLEXPRESS; database=SkillBeeDB; integrated security=SSPI ");
            return con;
        }

        public static bool Login(string email, string pass, out string name, out string UserID)
        {
            SqlConnection con = GetConnection();
            int n = 0;
            name = UserID = null;
            SqlCommand cmd = new SqlCommand("select count(UserId) from registration where Email=@email and Password=@pass", con);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@pass", pass);

            con.Open();
            try
            {
                n = (Int32)cmd.ExecuteScalar();
                if (n == 1)
                {
                    cmd = new SqlCommand("select UserName from registration where Email=@email and Password=@pass", con);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@pass", pass);
                    name = (string)cmd.ExecuteScalar();

                    cmd = new SqlCommand("select UserId from registration where Email=@email and Password=@pass", con);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@pass", pass);
                    UserID = ((Int32)cmd.ExecuteScalar()).ToString();

                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }

            return false;

        }

        public static bool Contact(string nm, string email, string subj, string msg)
        {
            SqlConnection con = GetConnection();
            SqlCommand cmd = new SqlCommand("insert into contact values (@nm , @email, @sub, @msg) ", con);
            cmd.Parameters.AddWithValue("@nm", nm);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@sub", subj);
            cmd.Parameters.AddWithValue("@msg", msg);

            con.Open();
            int rv = cmd.ExecuteNonQuery();
            con.Close();

            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public static bool Feedback(string Name, string Email, string Msg, int LookFeel, int Layout)
        {
            SqlConnection con = GetConnection();
            int rv = 0;
            SqlCommand cmd = new SqlCommand("insert into feedBack values (@nm , @email, @msg, @lookFeel, @layout) ", con);
            cmd.Parameters.AddWithValue("@nm", Name);
            cmd.Parameters.AddWithValue("@email", Email);
            cmd.Parameters.AddWithValue("@msg", Msg);
            cmd.Parameters.AddWithValue("@lookFeel", LookFeel);
            cmd.Parameters.AddWithValue("@layout", Layout);

            try
            {
                con.Open();
                rv = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }


            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool AdminLogin(string UserID, string Pass)
        {
            SqlConnection con = GetConnection();
            int rv = 0;
            SqlCommand cmd = new SqlCommand("select count(AdminId) from adminLogin where AdminUserID=@userId and Pass=@pass", con);
            cmd.Parameters.AddWithValue("@userId", UserID);
            cmd.Parameters.AddWithValue("@pass", Pass);

            try
            {
                con.Open();
                rv = (Int32)cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }


            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static DataTable GetTableTopics()
        {
            SqlConnection con = GetConnection();
            SqlDataAdapter da = new SqlDataAdapter("select * from topics",con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return (dt);
        }

        public static DataTable GetTableSubTopics()
        {
            SqlConnection con = GetConnection();
            SqlDataAdapter da = new SqlDataAdapter("select * from subTopics", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return (dt);
        }

        public static DataTable GetTableChallenges()
        {
            SqlConnection con = GetConnection();
            SqlDataAdapter da = new SqlDataAdapter("select * from challenges", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return (dt);
        }

        public static DataTable GetTableQuestion()
        {
            SqlConnection con = GetConnection();
            SqlDataAdapter da = new SqlDataAdapter("select * from questions", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return (dt);
        }

        public static DataTable GetTopicsFromTableTopics()
        {
            SqlConnection con = GetConnection();
            SqlDataAdapter da = new SqlDataAdapter("select TopicID, Topic from topics", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return (dt);
        }
        
        public static DataTable GetSubTopicsFromTableSubTopics()
        {
            SqlConnection con = GetConnection();
            SqlDataAdapter da = new SqlDataAdapter("select SubTopicID, SubTopicHeading from subTopics", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return (dt);
        }

        public static DataTable GetChallengesFromTableChallenges()
        {
            SqlConnection con = GetConnection();
            SqlDataAdapter da = new SqlDataAdapter("select ChallengesID , Heading1+' '+Heading2 as Heading from challenges", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return (dt);
        }

        public static bool InsertTopic(int Display, string TopicName, string TopinPageID)
        {
            SqlConnection con = GetConnection();
            int rv = 0;
            SqlCommand cmd = new SqlCommand("insert into topics values (@TopicName, @Display, @TopicPageID)", con);
            cmd.Parameters.AddWithValue("@TopicName", TopicName);
            cmd.Parameters.AddWithValue("@Display", Display);
            cmd.Parameters.AddWithValue("@TopicPageID", TopinPageID);

            try
            {
                con.Open();
                rv = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }


            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public static bool InsertSubTopic( int TopicID, string SubTopicHeading, string SubTopicImg, int Display)
        {
            SqlConnection con = GetConnection();
            int rv = 0;
            SqlCommand cmd = new SqlCommand("insert into subTopics values(@TopicID, @SubTopicHeading, @SubTopicImg, @Display)", con);
            cmd.Parameters.AddWithValue("@TopicID", TopicID);
            cmd.Parameters.AddWithValue("@SubTopicHeading", SubTopicHeading);
            cmd.Parameters.AddWithValue("@SubTopicImg", SubTopicImg);
            cmd.Parameters.AddWithValue("@Display", Display);

            try
            {
                con.Open();
                rv = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }


            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public static bool InsertChallenges(int Display, int SubTopicID, string Heading1, string Heading2)
        {
            SqlConnection con = GetConnection();
            int rv = 0;
            SqlCommand cmd = new SqlCommand("insert into challenges values (@SubTopicID, @Heading1, @Heading2, @Display)", con);
            cmd.Parameters.AddWithValue("@SubTopicID", SubTopicID);
            cmd.Parameters.AddWithValue("@Display", Display);
            cmd.Parameters.AddWithValue("@Heading1", Heading1);
            cmd.Parameters.AddWithValue("@Heading2", Heading2);

            try
            {
                con.Open();
                rv = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }


            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public static bool InsertQuestions(int ChallengesID, int CorrectAns, string Ques, string Ans1, string Ans2, string Ans3, string Ans4)
        {
            SqlConnection con = GetConnection();
            int rv = 0;
            SqlCommand cmd = new SqlCommand("insert into questions values(@ChallengesID,@Ques,@Ans1,@Ans2,@Ans3,@Ans4,@CorrectAns)", con);
            cmd.Parameters.AddWithValue("@ChallengesID", ChallengesID);
            cmd.Parameters.AddWithValue("@Ques", Ques);
            cmd.Parameters.AddWithValue("@Ans1", Ans1);
            cmd.Parameters.AddWithValue("@Ans2", Ans2);
            cmd.Parameters.AddWithValue("@Ans3", Ans3);
            cmd.Parameters.AddWithValue("@Ans4", Ans4);
            cmd.Parameters.AddWithValue("@CorrectAns", CorrectAns);

            try
            {
                con.Open();
                rv = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }

            //con.Open();
            //rv = cmd.ExecuteNonQuery();
            //con.Close();


            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public static bool InsertResult(int UserID, int ChallengeID, int MaxMarks, int ObtainMarks)
        {

            SqlConnection con = GetConnection();
            int rv = 0;
            SqlCommand cmd = new SqlCommand("insert into Results values(@UserID, @ChallengeID, @MaxMarks, @ObtainMarks)", con);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@ChallengeID", ChallengeID);
            cmd.Parameters.AddWithValue("@MaxMarks", MaxMarks);
            cmd.Parameters.AddWithValue("@ObtainMarks", ObtainMarks);

            //try
            //{
            //    con.Open();
            //    rv = cmd.ExecuteNonQuery();
            //}
            //catch (Exception ex)
            //{
            //    ex.Message.ToString();
            //}
            //finally
            //{
            //    con.Close();
            //}

            con.Open();
            rv = cmd.ExecuteNonQuery();
            con.Close();


            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public static bool DelFromTopic(int id)
        {
            SqlConnection con = GetConnection();
            SqlCommand cmd = new SqlCommand("delete from topics where TopicID=@ID", con);
            cmd.Parameters.AddWithValue("@ID",id);

            con.Open();
            int rv = cmd.ExecuteNonQuery();
            con.Close();

            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool DelFromSubTopic(int id)
        {
            SqlConnection con = GetConnection();
            SqlCommand cmd = new SqlCommand("delete from subTopics where SubTopicID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", id);

            con.Open();
            int rv = cmd.ExecuteNonQuery();
            con.Close();

            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool DelFromChallenges(int id)
        {
            SqlConnection con = GetConnection();
            SqlCommand cmd = new SqlCommand("delete from challenges where ChallengesID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", id);

            con.Open();
            int rv = cmd.ExecuteNonQuery();
            con.Close();

            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool DelFromQuestion(int id)
        {
            SqlConnection con = GetConnection();
            SqlCommand cmd = new SqlCommand("delete from questions where QuesID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", id);

            con.Open();
            int rv = cmd.ExecuteNonQuery();
            con.Close();

            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool UpdateTopic(int Display, int id, string TopicName, string TopinPageID)
        {
            SqlConnection con = GetConnection();
            int rv = 0;
            SqlCommand cmd = new SqlCommand("update topics set Topic=@TopicName, display=@Display, TopicPageID=@TopicPageID where TopicID=@ID", con);


            cmd.Parameters.AddWithValue("@TopicName", TopicName);
            cmd.Parameters.AddWithValue("@Display", Display);
            cmd.Parameters.AddWithValue("@TopicPageID", TopinPageID);
            cmd.Parameters.AddWithValue("@ID", id);

            try
            {
                con.Open();
                rv = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }

            //con.Open();
            //rv = cmd.ExecuteNonQuery();
            //con.Close();

            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool UpdateChallenges(int SubTopicID, string Heading1, string Heading2, int Display, int ChallengesID)
        {
            SqlConnection con = GetConnection();
            int rv = 0;
            SqlCommand cmd = new SqlCommand("update challenges set SubTopicID=@SubTopicID, Heading1=@Heading1, Heading2=@Heading2 ,Display=@Display where  ChallengesID=@ChallengesID", con);


            cmd.Parameters.AddWithValue("@SubTopicID", SubTopicID);
            cmd.Parameters.AddWithValue("@Heading1", Heading1);
            cmd.Parameters.AddWithValue("@Heading2", Heading2);
            cmd.Parameters.AddWithValue("@Display", Display);
            cmd.Parameters.AddWithValue("@ChallengesID", ChallengesID);

            try
            {
                con.Open();
                rv = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }

            //con.Open();
            //rv = cmd.ExecuteNonQuery();
            //con.Close();

            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool UpdateSubTopic(int Display, int id, int TopicID, string SubTopicHeading, string SubTopicImg)
        {
            SqlConnection con = GetConnection();
            int rv = 0;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            if (SubTopicImg != "")
            {
                cmd.CommandText ="update subTopics set TopicID=@TopicID , SubTopicHeading=@SubTopicHeading , SubTopicImg=@SubTopicImg , Display=@Display where SubTopicID=@SubTopicID ";
                cmd.Parameters.AddWithValue("@SubTopicImg", SubTopicImg);
                
            }
            else
            {
                cmd.CommandText = "update subTopics set TopicID=@TopicID , SubTopicHeading=@SubTopicHeading , Display=@Display where SubTopicID=@SubTopicID ";
            }


            //update topics set Topic='MSO', display=1, TopicPageID='msso' where TopicID=7


            cmd.Parameters.AddWithValue("@TopicID", TopicID);
            cmd.Parameters.AddWithValue("@Display", Display);
            cmd.Parameters.AddWithValue("@SubTopicHeading", SubTopicHeading);
            cmd.Parameters.AddWithValue("@SubTopicID", id);

            try
            {
                con.Open();
                rv = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }

            //con.Open();
            //rv = cmd.ExecuteNonQuery();
            //con.Close();

            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool UpdateQuestions(int QuesID, int ChallengesID, int CorrectAns, string Ques, string Ans1, string Ans2, string Ans3, string Ans4)
        {
            SqlConnection con = GetConnection();
            int rv = 0;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            cmd.CommandText = "update questions set ChallengesID=@ChallengesID , CorrectAns=@CorrectAns , Ques=@Ques , Ans1=@Ans1, Ans2=@Ans2, Ans3=@Ans3, Ans4=@Ans4 where QuesID=@QuesID ";
            cmd.Parameters.AddWithValue("@ChallengesID", ChallengesID);
            cmd.Parameters.AddWithValue("@CorrectAns", CorrectAns);
            cmd.Parameters.AddWithValue("@Ques", Ques);
            cmd.Parameters.AddWithValue("@Ans1", Ans1);
            cmd.Parameters.AddWithValue("@Ans2", Ans2);
            cmd.Parameters.AddWithValue("@Ans3", Ans3);
            cmd.Parameters.AddWithValue("@Ans4", Ans4);
            cmd.Parameters.AddWithValue("@QuesID", QuesID);

            try
            {
                con.Open();
                rv = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }

            //con.Open();
            //rv = cmd.ExecuteNonQuery();
            //con.Close();

            if (rv > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    
        

    }

}

