using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected int GetUserId(string un, string pass)
    {

        return 0;
    }

    protected void SignUp_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True"); //Connection String
        conn.Open();
        SqlCommand cm;
        string un = Email.Value;
        string passw = pass.Value;
        string fname = firstName.Value;
        string lname = lastName.Value;
        string DateOfBirth = DOB.Value;

        string query = "Insert into Users( username, password, firstName, lastName, DOB) Values( '" + un + "','" + passw + "','" + fname + "' , '" + lname + "' , '" + DateOfBirth + "')";

        cm = new SqlCommand(query, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();
        conn.Close();

    }
}