using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FacultyLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected int GetUserId(string un, string pass)
    {

        int UserID = 0;
        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True"); //Connection String
        conn.Open();
        SqlCommand cm;
        string query = "Select UserId from Users where Username = '" + un + "' AND Password = '" + pass + "'";
        cm = new SqlCommand(query, conn);
        SqlDataReader sqlDataReader = cm.ExecuteReader();

        if (sqlDataReader.Read())
        {

            //UserID = sqlDataReader.GetInt32(0);
            UserID = (int)sqlDataReader.GetByte(0);
        }

        return UserID;
    }
    protected void Login_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True"); //Connection String
        conn.Open();
        SqlCommand cm;
        string un = email.Value;
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
            Session["UserID"] = GetUserId(un, pass);
            Response.Redirect("facultyHomePage.aspx");

        }

        else
        {

            Response.Redirect("FacultyLogin.aspx");

        }
    }
}