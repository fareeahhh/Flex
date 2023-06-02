using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

public partial class faculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int userID = Convert.ToInt32(Session["UserID"]);
            string facultyID = GetFacultyID(userID);
            LoadCampusDropdown(facultyID);
            LoadSemesterDropdown(facultyID);
            LoadCoursesGridView(facultyID);
            setMarksDistribution();
            GetFacultyCourses(facultyID);
            EvaluationRepeater.DataSource = GetEvaluationData();
            EvaluationRepeater.DataBind();
        }
    }

    public string GetSectionId(string courseId, string facultyId)
    {
        string sectionId = string.Empty;
        using (SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True"))
        {
            conn.Open();
            string query = @"SELECT SectionId 
                         FROM Section sec 
                         JOIN OfferedCourse oc ON sec.offeredcourseId = oc.OfferedCourseID
                         JOIN Faculty f ON sec.facultyID = f.FacultyID
                         WHERE oc.courseID = @courseId AND f.FacultyID = @facultyId";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@courseId", courseId);
                cmd.Parameters.AddWithValue("@facultyId", facultyId);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        sectionId = reader["SectionId"].ToString();
                    }
                }
            }
        }
        return sectionId;
    }

    public class Student
    {
        public string Name { get; set; }
        public string RollNumber { get; set; }
    }

    protected void courseDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string courseId = courseDropDownList.SelectedValue;

        List<Student> students = new List<Student>();
        using (SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True"))
        {
            conn.Open();
            string query = @"SELECT s.RollNumber, u.FirstName, u.LastName 
                         FROM Students s
                         JOIN Users u ON s.userID = u.UserID
                         JOIN StudentSection ss ON s.RollNumber = ss.StudentID
                         JOIN Section sec ON ss.SectionId = sec.SectionID
                         JOIN OfferedCourse oc ON sec.offeredcourseId = oc.OfferedCourseID
                         WHERE oc.courseID = @courseId";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@courseId", courseId);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Student student = new Student
                        {
                            RollNumber = reader["RollNumber"].ToString(),
                            Name = reader["FirstName"].ToString() + " " + reader["LastName"].ToString()
                        };
                        students.Add(student);
                    }
                }
            }
        }

        StudentRepeater.DataSource = students;
        StudentRepeater.DataBind();
    }

    private DataTable GetEvaluationData()
    {
        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        //string query = "SELECT * FROM Evaluation";
        string query = @"SELECT Users.FirstName, Users.LastName, Students.RollNumber, Marks.Score AS ObtainedMarks, Marks.TotalMarks, Evaluation.Weightage 
                        FROM Marks JOIN Students ON Marks.rollNumber = Students.RollNumber
                        JOIN Users ON Students.userID = Users.UserID
                        JOIN Evaluation ON Marks.evaluationID = Evaluation.EvaluationID";

        DataTable dataTable = new DataTable();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                dataTable.Load(reader);
            }
        }

        return dataTable;
    }


    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in StudentRepeater.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                var attendanceDropDown = (DropDownList)item.FindControl("attendanceDropDown");
                var RollNumberLabel = (Label)item.FindControl("RollNumberLabel");

                string attendance = attendanceDropDown.SelectedValue;
                string rollNumber = RollNumberLabel.Text;

                UpdateAttendance(rollNumber, attendance);
            }
        }
    }

    private void UpdateAttendance(string rollNumber, string attendance)
    {
        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        string query = "UPDATE Attendance SET Attendance.Status = @Attendance WHERE Attendance.RollNumber = @RollNumber";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@Attendance", attendance);
                command.Parameters.AddWithValue("@RollNumber", rollNumber);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }


    public void GetFacultyCourses(string facultyID)
    {
        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True");
        conn.Open();
        SqlCommand cm;
        string query = @"SELECT c.CourseID, c.CourseCode, c.Cdescription, c.CreditHours, c.Semester_Offered, c.PreRequisiteID 
                        FROM Faculty f
                        JOIN Section s ON f.FacultyID = s.facultyID
                        JOIN OfferedCourse oc ON s.offeredcourseId = oc.OfferedCourseID
                        JOIN Courses c ON oc.courseID = c.CourseID
                        WHERE f.FacultyID = @facultyID";

        int userID = Convert.ToInt32(Session["UserID"]);
        string facid = GetFacultyID(userID);

        cm = new SqlCommand(query, conn);
        cm.Parameters.AddWithValue("@facultyID", facid);

        using (SqlDataReader reader = cm.ExecuteReader())
        {
            while (reader.Read())
            {
                //ListItem item = new ListItem(reader["Cdescription"].ToString(), reader["CourseCode"].ToString(), reader["CourseID"].ToString());
                ListItem item = new ListItem(reader["CourseCode"].ToString() + " - " + reader["Cdescription"].ToString(), reader["CourseID"].ToString());

                courseDropDownList.Items.Add(item);

            }
        }


    }

    private void LoadCampusDropdown(string facultyID)
    {
        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Campus FROM Faculty WHERE FacultyID = @facultyID", con);
            cmd.Parameters.AddWithValue("@facultyID", facultyID); // Add this line to declare and assign a value to the @facultyID parameter
            SqlDataReader dr = cmd.ExecuteReader();
            Campus.DataSource = dr;
            Campus.DataTextField = "Campus"; //column name in your database
            Campus.DataValueField = "Campus"; //same as the TextField or ID if you have one
            Campus.DataBind();
        }
    }

    private void LoadSemesterDropdown(string facultyID)
    {
        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(connectionString))
        {

            string query = @"SELECT DISTINCT oc.Semester 
                            FROM Faculty f
                            INNER JOIN Section s ON f.FacultyID = s.facultyID
                            INNER JOIN OfferedCourse oc ON s.offeredcourseId = oc.OfferedCourseID
                            WHERE f.FacultyID = @FacultyID";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@FacultyID", facultyID);
                cmd.CommandType = CommandType.Text;
                con.Open();
                semester.DataSource = cmd.ExecuteReader();
                semester.DataTextField = "Semester";
                semester.DataValueField = "Semester";
                semester.DataBind();
                con.Close();
            }

        }
    }

    private void LoadCoursesGridView(string facultyID)
    {
        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = @"SELECT c.CourseCode + ' - ' + c.Cdescription AS CourseTitle, s.SectionName AS Section, u.FirstName + ' ' + u.LastName AS Teacher
                         FROM Faculty f
                         INNER JOIN Section s ON f.FacultyID = s.facultyID
                         INNER JOIN OfferedCourse oc ON s.offeredcourseId = oc.OfferedCourseID
                         INNER JOIN Courses c ON oc.courseID = c.CourseID
                         INNER JOIN Users u ON f.userID = u.UserID
                         WHERE f.FacultyID = @FacultyID";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@FacultyID", facultyID);
                cmd.CommandType = CommandType.Text;
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                CoursesGridView.DataSource = dr;
                CoursesGridView.DataBind();
                con.Close();
            }
        }
    }

    //private void setMarksDistribution(object sender, EventArgs e)
    private void setMarksDistribution()
    {
        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        string sql = "SELECT EvaluationType, Weightage FROM Evaluation where SectionId = '1'"; // Replace this with your actual SQL query
        DataTable dt = new DataTable();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    dt.Load(reader);
                }
            }
        }

        // Bind the DataTable to the GridView
        EvaluationGridView.DataSource = dt;
        EvaluationGridView.DataBind();

    }

    protected void EvaluationGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the ID of the evaluation
        int evaluationId = Convert.ToInt32(EvaluationGridView.DataKeys[e.RowIndex].Value.ToString());

        // Get the GridViewRow that is currently being edited
        GridViewRow row = EvaluationGridView.Rows[e.RowIndex];

        // Find the TextBox inside the row
        TextBox textWeightage = (TextBox)row.FindControl("txtWeightage");

        // Get the new weightage from the TextBox
        int newWeightage = int.Parse(textWeightage.Text);

        // Define the update SQL
        string updateSQL = "UPDATE Evaluation SET Weightage = @Weightage WHERE EvaluationID = @EvaluationID";

        // Get the connection string from the web.config file
        string connectionString = ConfigurationManager.ConnectionStrings["Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True"].ConnectionString;

        DataTable dt = new DataTable();

        // Create a new SQL connection
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            // Create a new SQL command
            using (SqlCommand command = new SqlCommand(updateSQL, connection))
            {
                // Add the parameters to the command
                command.Parameters.AddWithValue("@Weightage", newWeightage);
                command.Parameters.AddWithValue("@EvaluationID", evaluationId);

                // Open the connection
                connection.Open();

                // Execute the command
                command.ExecuteNonQuery();

                // Close the connection
                connection.Close();
            }
        }

        // Set the EditIndex to -1 to exit edit mode
        EvaluationGridView.EditIndex = -1;

        // Rebind the data to the GridView
        //BindData();
        EvaluationGridView.DataSource = dt;
        EvaluationGridView.DataBind();
    }

    private void BindData()
    {
        // This method should bind the data from the database to the GridView
        // You need to implement it based on your own database structure
    }



    private string GetFacultyID(int userID)
    {
        string facultyID = string.Empty;
        string constr = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        using (SqlConnection con = new SqlConnection(constr))
        {
            string query = "SELECT FacultyID FROM Faculty WHERE userID = @UserID";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.CommandType = CommandType.Text;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    facultyID = reader["FacultyID"].ToString();
                }
                con.Close();
            }
        }
        return facultyID;
    }

    protected void ResetButton_Click(object sender, EventArgs e)
    {
        // Code for resetting to default values
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        // Code for saving changes
    }

}

