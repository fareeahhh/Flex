using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Course : System.Web.UI.Page
{
    // protected HtmlSelect courseSelects;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCourses();
            BindSemesters();
        }
    }

    private void BindSemesters()
    {
        // Define semesters
        string[] semesters = new string[] { "1", "2", "3", "4", "5", "6", "7", "8" };

        // Add semesters to dropdown
        semesterSelect.Items.Clear(); // clear all existing items
        foreach (string semester in semesters)
        {
            semesterSelect.Items.Add(new ListItem(semester));
        }
    }

    private void BindCourses()
    {
        // Get the connection string from your Web.config file
        string connectionString = "Data Source=USER\\SQLEXPRESS; Initial Catalog = flex2; Integrated Security = True"; //Connection String

        // Create a SQL query to fetch the course data
        string query = "SELECT * FROM Courses";

        // Set up the connection and command objects
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Open the connection
                connection.Open();

                // Execute the command and read the data
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    // Clear the DropDownList items
                    courseSelect.Items.Clear();

                    // Loop through the results and add each course to the DropDownList
                    while (reader.Read())
                    {
                        string CDescription = reader["CDescription"].ToString();
                        courseSelect.Items.Add(new ListItem(CDescription));
                    }
                }
            }
        }
    }

    protected void AddCourse_Click(object sender, EventArgs e)
    {
        string connectionString = "Data Source=USER\\SQLEXPRESS; Initial Catalog = flex2; Integrated Security = True"; ; // replace with your database connection string
        string courseC = courseCode.Value;
        string courseN = courseName.Value;
        int creditHrs = int.Parse(creditHours.Value);
        string semOffered = semesterOffered.Value;
        int preReq = int.Parse(preRequisite.Value);

        string query = "INSERT INTO Courses (CourseCode, Cdescription, CreditHours, semesterOffered, PreRequisiteID) VALUES (@courseCode, @Cdescription, @creditHours, @semesterOffered, @preRequisiteID)";

        Console.WriteLine(query);
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@courseCode", courseC);
            command.Parameters.AddWithValue("@cdescription", courseN);
            command.Parameters.AddWithValue("@creditHours", creditHrs);
            command.Parameters.AddWithValue("@semesterOffered", semOffered);
            command.Parameters.AddWithValue("@preRequisiteID", preReq);

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        // show success message
        ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessMessage", "showSuccessMessage();", true);


    }



    protected void OfferCourse_Click(object sender, EventArgs e)
    {
        // Get selected course description and semester
        string selectedCourseDescription = courseSelect.SelectedItem.Text;
        string selectedSemester = semesterSelect.SelectedItem.Text;

        // Get connection string
        
        string connectionString = "Data Source=USER\\SQLEXPRESS; Initial Catalog = flex2; Integrated Security = True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            try
            {
                // Open connection
                connection.Open();

                // Retrieve the courseID based on the selected course description
                string query = "SELECT CourseID FROM Courses WHERE CDescription = @SelectedCourseDescription";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@SelectedCourseDescription", selectedCourseDescription);
                int courseID = Convert.ToInt32(command.ExecuteScalar());
               
                // Insert into OfferedCourse table
                query = "INSERT INTO OfferedCourse (courseID, Semester) VALUES ( @CourseID, @Semester)";
                command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@CourseID", courseID);
                command.Parameters.AddWithValue("@Semester", selectedSemester);
                command.ExecuteNonQuery();

                // Display success message
                ScriptManager.RegisterStartupScript(this, GetType(), "SuccessMessage", "showSuccessMessage();", true);
            }
            catch (Exception ex)
            {
                // Handle any errors that may have occurred
                // For example, you can write the error to the Console or a log file, or display an error message.
                Console.WriteLine(ex.Message);
            }
        }
    }
}
