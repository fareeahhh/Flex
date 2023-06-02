using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class academicofficer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   // Declare and initialize the SqlConnection object
       /* SqlConnection conn = new SqlConnection("Data Source=DESKTOP-0R2RD55\\SQLEXPRESS;Initial Catalog=flex;Integrated Security=True");

        // Open the connection
        conn.Open();
        string email = Session["username"] as string;
        SqlCommand cmd = new SqlCommand("SELECT Fname, Lname, Username FROM Users WHERE Username = @Email", conn);
        cmd.Parameters.AddWithValue("@Email", email);

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            NameLiteral.Text = reader["Fname"].ToString() + " "+ reader["Lname"].ToString();
        }
        reader.Close();*/

    }
}