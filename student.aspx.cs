using System;
using System.Activities.Expressions;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static student;
using static System.Collections.Specialized.BitVector32;


public partial class student : System.Web.UI.Page 
{
    private string GetRollNumberByUserID(int userID)
    {
        string rollNumber = string.Empty;

        // Replace this connection string with your own
        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True");
        conn.Open();
        SqlCommand cm;
        string query = "SELECT RollNumber FROM Students WHERE userID = @UserID";
        cm = new SqlCommand(query, conn);

        cm.Parameters.AddWithValue("@UserID", userID);

        using (SqlDataReader reader = cm.ExecuteReader())
        {
            if (reader.Read())
            {
                rollNumber = reader["RollNumber"].ToString();
            }
        }
           
     

        return rollNumber;
    }

    private void LoadCourses()
    {
        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True");

        // using (SqlConnection connection = new SqlConnection(connectionString))
        //{
        conn.Open();
        SqlCommand cm;
        string query = @"SELECT oc.CourseID, c.Cdescription, c.CourseCode
                         FROM StudentSection ss
                         INNER JOIN Section s ON ss.SectionId = s.SectionID
                         INNER JOIN OfferedCourse oc ON s.offeredcourseId = oc.OfferedCourseID
                         INNER JOIN Courses c ON oc.CourseID = c.CourseID
                         WHERE ss.StudentID = @StudentID";

        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);
        cm = new SqlCommand(query, conn);
        cm.Parameters.AddWithValue("@StudentID", studentRollNumber);

        using (SqlDataReader reader = cm.ExecuteReader())
        {
            while (reader.Read())
            {
                //ListItem item = new ListItem(reader["Cdescription"].ToString(), reader["CourseCode"].ToString(), reader["CourseID"].ToString());
                ListItem item = new ListItem(reader["CourseCode"].ToString() + " - " + reader["Cdescription"].ToString(), reader["CourseID"].ToString());

                courses.Items.Add(item);
                DropDownList2.Items.Add(item);
            }
        }
    }
    private void LoadQuizData(string courseID)
    {
        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True");

        
        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);

        string query = @"
       SELECT e.EvaluationID, e.Weightage, m.Score, m.TotalMarks
        FROM Marks m
        INNER JOIN Evaluation e ON m.evaluationID = e.EvaluationID
        INNER JOIN Section s ON e.SectionId = s.SectionID
        INNER JOIN OfferedCourse oc ON s.offeredcourseId = oc.OfferedCourseID
        INNER JOIN StudentSection ss ON s.SectionID = ss.SectionId
        WHERE ss.StudentID = @StudentID AND e.EvaluationType = 'Quiz' AND oc.CourseID = @CourseID
        ";

        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@StudentID", studentRollNumber);
        cmd.Parameters.AddWithValue("@CourseID", courseID);

        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            
            quizTableBody.InnerHtml = "";

           
            int quizCounter = 1;
            while (reader.Read())
            {
                quizTableBody.InnerHtml += $@"
                <tr>
                    <td>{quizCounter++}</td>
                    <td>{reader["Weightage"]}</td>
                    <td>{reader["Score"]}</td>
                    <td>{reader["TotalMarks"]}</td>
                </tr>
            ";
            }
        }

        conn.Close();
    }


    private void LoadAssignmentData(string courseID)
    {
        
        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True");

        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);

        string query = @"
        SELECT e.EvaluationID, e.Weightage, m.Score, m.TotalMarks
        FROM Marks m
        INNER JOIN Evaluation e ON m.evaluationID = e.EvaluationID
        INNER JOIN Section s ON e.SectionId = s.SectionID
        INNER JOIN OfferedCourse oc ON s.offeredcourseId = oc.OfferedCourseID
        INNER JOIN StudentSection ss ON s.SectionID = ss.SectionId
        WHERE ss.StudentID = @StudentID AND e.EvaluationType = 'Assignment' AND oc.CourseID = @CourseID
        ";

        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);

        cmd.Parameters.AddWithValue("@StudentID", studentRollNumber);
        cmd.Parameters.AddWithValue("@CourseID", courseID);

        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            assignmentTableBody.InnerHtml = "";
            int assignmentCounter = 1;

            while (reader.Read())
            {
                assignmentTableBody.InnerHtml += $@"
                <tr>
                    <td>{assignmentCounter++}</td>
                    <td>{reader["Weightage"]}</td>
                    <td>{reader["Score"]}</td>
                    <td>{reader["TotalMarks"]}</td>
                </tr>
                ";
            }
        }

        conn.Close();
    }


    private void LoadSessional1Data(string courseID)
    {

        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True");

        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);

        string query = @"
        SELECT e.EvaluationID, e.Weightage, m.Score, m.TotalMarks
        FROM Marks m
        INNER JOIN Evaluation e ON m.evaluationID = e.EvaluationID
        INNER JOIN Section s ON e.SectionId = s.SectionID
        INNER JOIN OfferedCourse oc ON s.offeredcourseId = oc.OfferedCourseID
        INNER JOIN StudentSection ss ON s.SectionID = ss.SectionId
        WHERE ss.StudentID = @StudentID AND e.EvaluationType = 'Midterm' AND oc.CourseID = @CourseID
        ";

        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);

        cmd.Parameters.AddWithValue("@StudentID", studentRollNumber);
        cmd.Parameters.AddWithValue("@CourseID", courseID);

        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            sessional1TableBody.InnerHtml = "";
            int Counter = 1;

            while (reader.Read())
            {
                sessional1TableBody.InnerHtml += $@"
                <tr>
                    <td>{Counter++}</td>
                    <td>{reader["Weightage"]}</td>
                    <td>{reader["Score"]}</td>
                    <td>{reader["TotalMarks"]}</td>
                </tr>
                ";
            }
        }

        conn.Close();
    }


    private void LoadSessional2Data(string courseID)
    {

        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True");

        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);

        string query = @"
        SELECT e.EvaluationID, e.Weightage, m.Score, m.TotalMarks
        FROM Marks m
        INNER JOIN Evaluation e ON m.evaluationID = e.EvaluationID
        INNER JOIN Section s ON e.SectionId = s.SectionID
        INNER JOIN OfferedCourse oc ON s.offeredcourseId = oc.OfferedCourseID
        INNER JOIN StudentSection ss ON s.SectionID = ss.SectionId
        WHERE ss.StudentID = @StudentID AND e.EvaluationType = 'Midterm2' AND oc.CourseID = @CourseID
        ";

        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);

        cmd.Parameters.AddWithValue("@StudentID", studentRollNumber);
        cmd.Parameters.AddWithValue("@CourseID", courseID);

        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            sessional2TableBody.InnerHtml = "";
            int Counter = 1;

            while (reader.Read())
            {
                sessional2TableBody.InnerHtml += $@"
                <tr>
                    <td>{Counter++}</td>
                    <td>{reader["Weightage"]}</td>
                    <td>{reader["Score"]}</td>
                    <td>{reader["TotalMarks"]}</td>
                </tr>
                ";
            }
        }

        conn.Close();
    }

    private void LoadProjectData(string courseID)
    {

        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True");

        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);

        string query = @"
        SELECT e.EvaluationID, e.Weightage, m.Score, m.TotalMarks
        FROM Marks m
        INNER JOIN Evaluation e ON m.evaluationID = e.EvaluationID
        INNER JOIN Section s ON e.SectionId = s.SectionID
        INNER JOIN OfferedCourse oc ON s.offeredcourseId = oc.OfferedCourseID
        INNER JOIN StudentSection ss ON s.SectionID = ss.SectionId
        WHERE ss.StudentID = @StudentID AND e.EvaluationType = 'Project' AND oc.CourseID = @CourseID
        ";

        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);

        cmd.Parameters.AddWithValue("@StudentID", studentRollNumber);
        cmd.Parameters.AddWithValue("@CourseID", courseID);

        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            projectTableBody.InnerHtml = "";
            int Counter = 1;

            while (reader.Read())
            {
                projectTableBody.InnerHtml += $@"
                <tr>
                    <td>{Counter++}</td>
                    <td>{reader["Weightage"]}</td>
                    <td>{reader["Score"]}</td>
                    <td>{reader["TotalMarks"]}</td>
                </tr>
                ";
            }
        }

        conn.Close();
    }




    private void LoadAttendanceData(string courseID)
    {
        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True");

        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);

        string query = @"
       	SELECT a.AttendanceDate, a.SectionId, a.Status
        FROM Attendance a
        INNER JOIN Section s ON a.SectionId = s.SectionID
        INNER JOIN OfferedCourse oc ON s.offeredcourseId = oc.OfferedCourseID
        INNER JOIN StudentSection ss ON s.SectionID = ss.SectionId
        WHERE ss.StudentID = @StudentID AND oc.CourseID = @CourseID
        ";

        conn.Open();



        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@StudentID", studentRollNumber);
        cmd.Parameters.AddWithValue("@CourseID", courseID);

        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            attendanceTableBody.InnerHtml = ""; // Assuming you have an attendanceTableBody control
            int lectureCounter = 1;

            while (reader.Read())
            {
                attendanceTableBody.InnerHtml += $@"
                <tr>
                    <td>{lectureCounter++}</td>
                   <td>{Convert.ToDateTime(reader["AttendanceDate"]).ToShortDateString()}</td>
                    <td>{reader["SectionId"]}</td>
                    <td>{reader["Status"]}</td>
                </tr>
            ";
            }
        }

        conn.Close();
    }




    private void LoadCompletedSemesters()
    {
        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True");

        string query = @"
        SELECT DISTINCT o.Semester
        FROM OfferedCourse o
        INNER JOIN Section s ON o.OfferedCourseID = s.offeredcourseId
        INNER JOIN StudentSection ss ON s.SectionID = ss.SectionId
        INNER JOIN Marks m ON ss.StudentID = m.rollNumber
        WHERE ss.StudentID = @StudentID
    ";

        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);

        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@StudentID", studentRollNumber);

        conn.Open();

        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            semesterDropDownList.Items.Clear();

            while (reader.Read())
            {
                ListItem item = new ListItem(reader["Semester"].ToString(), reader["Semester"].ToString());
                semesterDropDownList.Items.Add(item);
            }
        }

        conn.Close();
    }


    private void LoadCourseDetails(string semester)
    {
        SqlConnection conn = new SqlConnection("Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True");

        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);

        string query = @"
        SELECT
            c.CourseCode,
            c.Cdescription as CourseName,
            s.SectionName,
            c.CreditHours,
            g.Grade
        FROM
            OfferedCourse oc
        INNER JOIN Courses c ON oc.CourseID = c.CourseID
        INNER JOIN Section s ON oc.OfferedCourseID = s.OfferedCourseID
        INNER JOIN StudentSection ss ON s.SectionID = ss.SectionID
        INNER JOIN Grades g ON ss.StudentSectionID = g.StudentSectionID
        WHERE
            ss.StudentID = @StudentID AND oc.Semester = @Semester
        ";

        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@StudentID", studentRollNumber);
        cmd.Parameters.AddWithValue("@Semester", semester);

        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            transcriptTableBody.InnerHtml = ""; 
           // int lectureCounter = 1;

            while (reader.Read())
            {
                transcriptTableBody.InnerHtml += $@"
                <tr>
                    <td>{reader["CourseCode"]}</td>
                   <td>{reader["CourseName"]}</td>
                    <td>{reader["SectionName"]}</td>
                    <td>{reader["CreditHours"]}</td>
                    <td>{reader["Grade"]}</td>
                </tr>
            ";
            }
        }

        conn.Close();
    }


    private void BindDropDownList()
    {
        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);

        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string sql = @"SELECT Faculty.FacultyID, Users.FirstName + ' ' + Users.LastName AS FacultyName
                        FROM Faculty INNER JOIN Users ON Faculty.UserID = Users.UserID
                        INNER JOIN Section ON Faculty.FacultyID = Section.FacultyID
                        INNER JOIN StudentSection ON Section.SectionID = StudentSection.SectionID
                        WHERE StudentSection.StudentID = @StudentID";

            using (SqlCommand command = new SqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue("@StudentID", studentRollNumber);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    dropdownTeacher.DataSource = reader;
                    dropdownTeacher.DataTextField = "FacultyName";
                    dropdownTeacher.DataValueField = "FacultyID";
                    dropdownTeacher.DataBind();
                }
            }
        }
    }

    

    private Control FindControlRecursive(Control root, string id)
    {
        if (root.ID == id)
        {
            return root;
        }

        foreach (Control c in root.Controls)
        {
            Control t = FindControlRecursive(c, id);
            if (t != null)
            {
                return t;
            }
        }

        return null;
    }

    private int CalculateFeedbackID()
    {
        int nextFeedbackID;

        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string sqlQuery = "SELECT ISNULL(MAX(FeedbackID), 0) FROM Feedback";
            using (SqlCommand command = new SqlCommand(sqlQuery, connection))
            {

                //nextSectionID = (int)command.ExecuteScalar();
                object result = command.ExecuteScalar();
                nextFeedbackID = (result == null || result == DBNull.Value) ? 0 : Convert.ToInt32(result);


            }
        }


        nextFeedbackID++;

        return nextFeedbackID;
    }


    protected void btnSubmitFeedback_Click(object sender, EventArgs e)
    {
        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);
        string comment = Comment.Text;
        int nextFeedbackID = CalculateFeedbackID();

        for (int i = 1; i <= 20; i++)
        {
            RadioButtonList questionResponseList = (RadioButtonList)FindControlRecursive(this, "Question" + i.ToString());

            if (questionResponseList != null)
            {
                string questionResponse = questionResponseList.SelectedValue;

                if (string.IsNullOrEmpty(questionResponse))
                {
                    // Show an error message and return from the function if any question is not answered
                    lblErrorMessage.Text = "Please answer all the questions.";
                    lblErrorMessage.Visible = true;
                    return;
                }
            }
        }

        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Insert the feedback into the Feedback table
            string feedbackSql = "INSERT INTO FeedBack (FeedbackID,facultyID, rollNumber, FeedbackFormData) OUTPUT INSERTED.FeedbackID VALUES (@facultyID, @rollNumber, @FeedbackFormData)";
            using (SqlCommand feedbackCommand = new SqlCommand(feedbackSql, connection))
            {
                feedbackCommand.Parameters.AddWithValue("@FeedbackID", nextFeedbackID);
                feedbackCommand.Parameters.AddWithValue("@facultyID", dropdownTeacher.SelectedValue);
                feedbackCommand.Parameters.AddWithValue("@rollNumber", studentRollNumber);
                feedbackCommand.Parameters.AddWithValue("@FeedbackFormData", comment);


                int feedbackID = (int)feedbackCommand.ExecuteScalar();

                // Insert the responses into the FeedbackResponse table
                for (int i = 1; i <= 20; i++)
                {
                    RadioButtonList questionResponseList = (RadioButtonList)FindControl("Question" + i.ToString());
                    string questionResponse = questionResponseList.SelectedValue;

                    if (questionResponseList != null && !string.IsNullOrEmpty(questionResponse))
                    {
                        string responseSql = "INSERT INTO FeedbackResponse (FeedbackID, QuestionID, Rating) VALUES (@FeedbackID, @QuestionID, @Rating)";
                        using (SqlCommand responseCommand = new SqlCommand(responseSql, connection))
                        {
                            responseCommand.Parameters.AddWithValue("@FeedbackID", feedbackID);
                            responseCommand.Parameters.AddWithValue("@QuestionID", i);
                            responseCommand.Parameters.AddWithValue("@Rating", int.Parse(questionResponse));

                            responseCommand.ExecuteNonQuery();
                        }
                    }
                }
            }
        }
    }


    private string GetCurrentSemester(string rollNumber)
    {
        string currentSemester = "";
        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string semesterSql = "SELECT CurrentSemester FROM Students WHERE RollNumber = @RollNumber";
            using (SqlCommand semesterCommand = new SqlCommand(semesterSql, connection))
            {
                semesterCommand.Parameters.AddWithValue("@RollNumber", rollNumber);
                currentSemester = semesterCommand.ExecuteScalar().ToString();
            }
        }

        return currentSemester;
    }


    private void BindCourses()
    {
        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);
        string currentSemester = GetCurrentSemester(studentRollNumber);

        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Get the courses for the current semester that the student has the prerequisites for
            string coursesSql = @"
                SELECT C.CourseCode, C.Cdescription, C.CreditHours, OC.Semester 
                FROM Courses C
                INNER JOIN OfferedCourse OC ON C.CourseID = OC.courseID
                WHERE OC.Semester = @Semester 
                AND (C.PreRequisiteID IS NULL OR C.PreRequisiteID IN (
                    SELECT OC2.courseID 
                    FROM StudentSection SS
                    INNER JOIN Section S ON SS.SectionID = S.SectionID
                    INNER JOIN OfferedCourse OC2 ON S.offeredcourseId = OC2.OfferedCourseID
                    INNER JOIN Grades G ON SS.StudentSectionID = G.StudentSectionID
                    WHERE SS.StudentID = @RollNumber
                    AND G.Grade <> 'F' -- only include courses that were not failed
                ))
                AND C.CourseID NOT IN (
                    SELECT OC2.courseID 
                    FROM StudentSection SS
                    INNER JOIN Section S ON SS.SectionID = S.SectionID
                    INNER JOIN OfferedCourse OC2 ON S.offeredcourseId = OC2.OfferedCourseID
                    WHERE SS.StudentID = @RollNumber
                )";


            using (SqlCommand coursesCommand = new SqlCommand(coursesSql, connection))
            {
                coursesCommand.Parameters.AddWithValue("@Semester", currentSemester);
                coursesCommand.Parameters.AddWithValue("@RollNumber", studentRollNumber);

                SqlDataAdapter da = new SqlDataAdapter(coursesCommand);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    // Bind the data to the grid view
                    gvCourses.DataSource = dt;
                    gvCourses.DataBind();
                }
            }
        }
    }


    protected void btnRefreshCourses_Click(object sender, EventArgs e)
    {
        BindCourses();
    }

    private int CalculateNextSectionID()
    {
        int nextSectionID;

        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string sqlQuery = "SELECT ISNULL(MAX(SectionID), 0) FROM Section";
            using (SqlCommand command = new SqlCommand(sqlQuery, connection))
            {

                //nextSectionID = (int)command.ExecuteScalar();
                object result = command.ExecuteScalar();
                nextSectionID = (result == null || result == DBNull.Value) ? 0 : Convert.ToInt32(result);


            }
        }

      
        nextSectionID++;

        return nextSectionID;
    }



    protected void btnRegister_Click(object sender, EventArgs e)
    {
       
        string courseCode = ((Button)sender).CommandArgument;
        int userID = Convert.ToInt32(Session["UserID"]);
        string studentRollNumber = GetRollNumberByUserID(userID);

        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Get the SectionID for the selected course
            string sectionSql = @"
            SELECT TOP 1 S.SectionID
            FROM Section S
            INNER JOIN OfferedCourse OC ON S.offeredcourseId = OC.OfferedCourseID
            INNER JOIN Courses C ON OC.courseID = C.CourseID
            WHERE C.CourseCode = @CourseCode";
            int sectionID;
            using (SqlCommand sectionCommand = new SqlCommand(sectionSql, connection))
            {
                sectionCommand.Parameters.AddWithValue("@CourseCode", courseCode);

                //sectionID = (int)sectionCommand.ExecuteScalar();
                sectionID = Convert.ToInt32(sectionCommand.ExecuteScalar());

            }


            string registerSql = "INSERT INTO StudentSection (StudentSectionID, StudentID, SectionId) VALUES (@StudentSectionID, @UserID, @SectionID)";
            using (SqlCommand registerCommand = new SqlCommand(registerSql, connection))
            {
                // You need to calculate a unique StudentSectionID here. For instance, it can be maximum StudentSectionID currently in the table + 1.
                int newStudentSectionID = CalculateNextSectionID();

                registerCommand.Parameters.AddWithValue("@StudentSectionID", newStudentSectionID);
                registerCommand.Parameters.AddWithValue("@UserID", studentRollNumber);
                registerCommand.Parameters.AddWithValue("@SectionID", sectionID);

                registerCommand.ExecuteNonQuery();
            }




        }

        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Course has been registered" + "');", true);
    }


    private void BindStudentInfo(int userId)
    {
        string connectionString = "Data Source=USER\\SQLEXPRESS;Initial Catalog=flex2;Integrated Security=True";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string studentInfoSql = @"
                           SELECT 
                    S.RollNumber,
                    S.CurrentSemester,
                    SE.SectionName
                FROM Students S
                LEFT JOIN StudentSection SS ON S.RollNumber = SS.StudentID
                LEFT JOIN Section SE ON SS.SectionID = SE.SectionID
                WHERE 
                    S.RollNumber = '21i-2559' 
                    AND SS.StudentSectionID = 
                    (
                        SELECT MAX(StudentSectionID) 
                        FROM StudentSection 
                        WHERE StudentID = S.RollNumber
            )";

            using (SqlCommand command = new SqlCommand(studentInfoSql, connection))
            {
                command.Parameters.AddWithValue("@UserID", userId);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        lblRollNumber.Text = reader["RollNumber"].ToString();
                        lblClass.InnerText = reader["CurrentSemester"].ToString();
                        lblSection.InnerText = reader["SectionName"].ToString();
                    }
                }
            }
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserID"] != null)
            {
                int userID = Convert.ToInt32(Session["UserID"]);
                string studentRollNumber = GetRollNumberByUserID(userID);
                LoadCourses();
                 string selectedCourseID = courses.SelectedValue;
                LoadQuizData(selectedCourseID);
                LoadAssignmentData(selectedCourseID);
                LoadSessional1Data(selectedCourseID);
                LoadSessional2Data(selectedCourseID);
                LoadProjectData(selectedCourseID);

                string SelectedCourseID = DropDownList2.SelectedValue;

                LoadAttendanceData(SelectedCourseID);
                LoadCompletedSemesters();

                string SelectedSemester = semesterDropDownList.SelectedValue;
                LoadCourseDetails(SelectedSemester);
                BindDropDownList();

                
                BindCourses();
               


            }
            else
            {
                // Redirect to the login page if the session variable is not set
                Response.Redirect("StudentLogin.aspx");
            }
        }
    }





    protected void courses_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selectedCourseID;

        if (int.TryParse(courses.SelectedValue, out selectedCourseID))
        {
            LoadQuizData(selectedCourseID.ToString());
            LoadAssignmentData(selectedCourseID.ToString());
            LoadSessional1Data(selectedCourseID.ToString());
            LoadSessional2Data(selectedCourseID.ToString());
            LoadProjectData(selectedCourseID.ToString());
        }
        else
        {
            string script = "alert('An error occurred while processing your request. Please try again.');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ErrorAlert", script, true);
        }
    }


    protected void courses2_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedCourseID = DropDownList2.SelectedValue;

        if (!string.IsNullOrEmpty(selectedCourseID))
        {
            LoadAttendanceData(selectedCourseID);
            
        }
        else
        {
            string script = "alert('An error occurred while processing your request. Please try again.');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ErrorAlert", script, true);
        }
    }

    protected void semesterDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedSemester = semesterDropDownList.SelectedValue;


        if (!string.IsNullOrEmpty(selectedSemester))
        {
            LoadCourseDetails(selectedSemester);

        }
        else
        {
            string script = "alert('An error occurred while processing your request. Please try again.');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ErrorAlert", script, true);
        }
    }



}




