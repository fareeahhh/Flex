using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class AOLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected int GetUserId(string un, string pass)
    {

        int UserId = 0;
        //SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True"); //Connection String
        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS; Initial Catalog = flex2; Integrated Security = True");
        conn.Open();
        SqlCommand cm;
        string query = "Select UserId from Users where Username = '" + un + "' AND Password = '" + pass + "'";
        cm = new SqlCommand(query, conn);
        SqlDataReader sqlDataReader = cm.ExecuteReader();

        if (sqlDataReader.Read())
        {

            //UserId = sqlDataReader.GetInt32(0);
            UserId = (int)sqlDataReader.GetByte(0);
        }

        return UserId;
    }

        protected void Login_Click(object sender, EventArgs e)
        {
        //SqlConnection conn = new SqlConnection("Data Source=DESKTOP-K756NQ6\SQLEXPRESS;Initial Catalog=flex;Integrated Security=True"); //Connection String
        //conn.Open();
        //SqlCommand cm;
        //string un = rollno.Value;
        //string pass = password.Value;
        ////string query = "Select * from [sign up] where Username = '" + un + "' AND Password = '" + pass + "'";
        //string query = "Insert into Login(Username, Password) values ('" + un + "','" + pass + "')";
        //cm = new SqlCommand(query, conn);
        //SqlDataReader rdr = cm.ExecuteReader();

        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS; Initial Catalog = flex2; Integrated Security = True"); //Connection String
            conn.Open();
            SqlCommand cm;
            string un = Email.Value;
            string pass = password.Value;
            string query = "Select count(*) from Users where Username = '" + un + "' AND Password = '" + pass + "'";
            cm = new SqlCommand(query, conn);
            object result = cm.ExecuteScalar();
            int count = 0;

            if (result != DBNull.Value)
            {
                count = (int)result;

            }

            if (count > 0)
            {
                Session["Rollno"] = un;
                Session["UserId"] = GetUserId(un, pass);
                Response.Redirect("AcademicOfficer.aspx");

            }

            else
            {

                Response.Redirect("AOLogin.aspx");

            }
        }


}


