using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AcademicOfficer_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void addStudent_Click(object sender, EventArgs e)
    {
        string username1 = username.Text;
        string password1 = password.Text;
        string firstName1 = firstName.Text;
        string lastName1 = lastName.Text;
        string dob1 = dob.Text;
        string semester1 = currentSemester.Text;

        // Create connection string
        string connectionString = "Data Source=USER\\SQLEXPRESS; Initial Catalog = flex2; Integrated Security = True";

        // Create SQL queries

        // string numQuery = "Select top 1 userid from users order by desc";


        int nextUserID;

        //string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string sqlQuery = "SELECT ISNULL(MAX(UserID), 0) FROM Users";
            using (SqlCommand command = new SqlCommand(sqlQuery, connection))
            {

                //nextSectionID = (int)command.ExecuteScalar();
                object result = command.ExecuteScalar();
                nextUserID = (result == null || result == DBNull.Value) ? 0 : Convert.ToInt32(result);


            }
        }


        nextUserID++;


        string userQuery = $"INSERT INTO Users (UserID, Username, Password, FirstName, LastName, DOB) VALUES (@UserID, @Username, @Password, @FirstName, @LastName, @DOB)";
        string studentQuery = $"INSERT INTO Students (RollNumber, CurrentSemester, UserID) SELECT @Username, @Semester, UserID FROM Users WHERE Username = @Username";

        // Execute the queries to add the student
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Insert into Users table
            using (SqlCommand userCommand = new SqlCommand(userQuery, connection))
            {
                userCommand.Parameters.AddWithValue("@UserID", nextUserID);
                userCommand.Parameters.AddWithValue("@Username", username1);
                userCommand.Parameters.AddWithValue("@Password", password1);
                userCommand.Parameters.AddWithValue("@FirstName", firstName1);
                userCommand.Parameters.AddWithValue("@LastName", lastName1);
                userCommand.Parameters.AddWithValue("@DOB", dob1);
               

                userCommand.ExecuteNonQuery();
            }

            // Insert into Students table
            using (SqlCommand studentCommand = new SqlCommand(studentQuery, connection))
            {
                studentCommand.Parameters.AddWithValue("@Username", username1);
                studentCommand.Parameters.AddWithValue("@Semester", semester1);

                studentCommand.ExecuteNonQuery();
            }

            connection.Close();
        }
    }
}
