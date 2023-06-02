
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="student" %>

<!DOCTYPE html>
<html>
<head>
    <!-- Google Fonts -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Vertical Tab</title>
    <style>
        body {
            background: #FFFFFF;
            padding: 0;
            margin: 0;
            font-family: 'Lato', sans-serif;
            color: #000;
        }

        .vertical-tabs {
            position: fixed;
            top: 150px;
            left: 20px;
            display: flex;
            flex-direction: column;
        }

        .vertical-tabs .tab {
            padding: 10px;
            background-color: #f2f2f2;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .vertical-tabs .tab.active {
            background-color: #ddd;
        }

        .content-container {
            margin-left: 120px;
            padding: 20px;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

         .content-container {
            margin-left: 120px;
            padding: 20px;
        }

         body {
        background:	#87CEEB;
        padding: 0;
        margin: 0;
        font-family: 'Lato', sans-serif;
        color:#000;
    }

    .student-profile .card h3 {
        font-size: 20px;
        font-weight: 700;
    }

    .student-profile .card p {
        font-size: 16px;
        color:  #000;
    }

    .student-profile .card {
        width: 80%;
        margin-left: 60px;
       
    }

    .student-profile .card-body {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .card-gap {
        margin-bottom: 24px;
    }

    .horizontal-tabs .tab {
            padding: 10px;
            background-color: #f2f2f2;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .horizontal-tabs .tab.active {
            background-color: #ddd;
        }

        .horizontal-tabs .tab-content {
            display: none;
            padding: 10px;
            border-top: 4px solid #ddd;
        }

        .horizontal-tabs .tab-content.active {
            display: block;
        }

        .horizontal-tabs-container {
            margin-top: 130px;
             margin-left: 110px;
        }

       .blue-header {
          background-color: #007bff;
          color: white;
       }

        .margin-settings {

          margin-left: 260px;
          margin-top: 50px;
       }

        .course-dropdown {
       
            margin-top: 70px;
        }

    .attendance-table {
        
        margin-top: 100px;
        width: 80%;
    }

      .date-dropdown {
      
           margin-top: 40px;
           margin-left: 100px;
      }

    .transcript-header {
    display: grid;
    grid-template-columns: auto auto auto;
    align-items: center;
    grid-gap: 10px;
  }

  .cgpa-container {
    
    margin-top: 280px;
  }

   
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="vertical-tabs">
        <div class="tab active" onclick="openTab(event, 'home')">Home</div>
        <div class="tab" onclick="openTab(event, 'registration')">Course Registration</div>
        <div class="tab" onclick="openTab(event, 'marks')">Marks</div>
        <div class="tab" onclick="openTab(event, 'attendance')">Attendance</div>
        <div class="tab" onclick="openTab(event, 'feedback')">Course Feedback</div>
        <div class="tab" onclick="openTab(event, 'transcript')">Transcript</div>
    </div>

    <div class="content-container">
        <div id="home" class="tab-content active">
            <h3>Flex Home</h3>
            <div class="student-profile py-4">
                <div class="card">
                    <div class="card-header bg-transparent text-center">
                        <h3 class="mb-0"><i class="far fa-clone pr-1"></i>University Information</h3>
                    </div>
                    <div class="card-body">
                      <%--  <p><strong>Roll No:</strong>21i-2559</p>
                        <p><strong>Class:</strong> 4</p>
                        <p><strong>Section:</strong> A</p>--%>
                      <%-- <p><strong>Roll No:</strong> <span id="lblRollNumber" runat="server"></span></p>--%>
                      <p><strong>Roll No:</strong> <asp:Label ID="lblRollNumber" runat="server" /></p>

                        <p><strong>Class:</strong> <span id="lblClass" runat="server"></span></p>
                        <p><strong>Section:</strong> <span id="lblSection" runat="server"></span></p>

                    </div>
                </div>

                <div class="card">
                    <div class="card-header bg-transparent text-center">
                        <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Personal Information</h3>
                    </div>
                    <div class="card-body">
                        <p><strong>Name:</strong> Malaika</p>
                        <p><strong>DOB:</strong> 1/25/2002</p>
                        <p><strong>Gender:</strong> Female</p>
                        <p><strong>CNIC:</strong> 32102-0818260-2</p>
                        <p><strong>Mobile No:</strong> 03310157254</p>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header bg-transparent text-center">
                        <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Contact Information</h3>
                    </div>
                    <div class="card-body">
                        <p><strong>Address:</strong> House 71, Street 81, G-13/1</p>
                        <p><strong>City:</strong> Islamabad</p>
                        <p><strong>Country:</strong> Pakistan</p>
                        </div>
                        </div>
                            <div class="card">
                <div class="card-header bg-transparent text-center">
                    <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Attendance</h3>
                </div>
                <div class="card-body">
                    <p>Attendance content goes here.</p>
                </div>
            </div>

            <div class="card">
                <div class="card-header bg-transparent text-center">
                    <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Semester GPA</h3>
                </div>
                <div class="card-body">
                    <p>Semester GPA content goes here.</p>
                </div>
            </div>
        </div>
    </div>

        <div id="registration" class="tab-content">
    <h3>Course Registration</h3>
    <div class="container attendance-table" style="background-color:azure">
        <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="CourseCode" HeaderText="Course Code" SortExpression="CourseCode" />
                <asp:BoundField DataField="Cdescription" HeaderText="Course Description" SortExpression="CourseName" />
                <asp:BoundField DataField="CreditHours" HeaderText="Credit Hours" SortExpression="CreditHours" />
                <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CommandArgument='<%# Eval("CourseCode") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>  
        </div>

        <%--<asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnlRegistration" runat="server" Visible="false">
                    <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="CourseCode" HeaderText="Course Code" SortExpression="CourseCode" />
                            <asp:BoundField DataField="Cdescription" HeaderText="Course Description" SortExpression="CourseName" />
                            <asp:BoundField DataField="CreditHours" HeaderText="Credit Hours" SortExpression="CreditHours" />
                            <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                <asp:Button ID="btnRefreshCourses" runat="server" Text="Refresh Courses" OnClick="btnRefreshCourses_Click" style="display:none;" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnRefreshCourses" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>--%>

     <%--   <div id="registration" class="tab-content">
    <h3>Course Registration</h3>
    <div class="container attendance-table" style="background-color:azure">

        <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
            <Columns>
                <asp:BoundField DataField="CourseCode" HeaderText="Course Code" />
                <asp:BoundField DataField="Cdescription" HeaderText="Course Name" />
                <asp:BoundField DataField="CreditHours" HeaderText="Credit Hours" />
                <asp:BoundField DataField="Semester" HeaderText="Semester" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" CommandArgument='<%# Eval("CourseCode") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:Button ID="btnRefreshCourses" runat="server" Text="Refresh Courses" OnClick="btnRefreshCourses_Click" style="display:none;" />
    </div>
</div>--%>






    <div id="marks" class="tab-content horizontal-tabs-container">
   
    <asp:UpdatePanel ID="MarksUpdatePanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
 
    <asp:DropDownList ID="courses" name="courses" class="margin-settings" runat="server" AutoPostBack="true" OnSelectedIndexChanged="courses_SelectedIndexChanged"></asp:DropDownList>



     <h3>Marks</h3>
     <div class="container" style="background-color:azure">
  
    <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" onclick="openSubTab(event, 'quiz')">Quiz</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" onclick="openSubTab(event, 'assignments')">Assignments</a>
    </li>
      <li class="nav-item">
      <a class="nav-link" onclick="openSubTab(event, 'sessional1')">SessionalI</a>
    </li>
      <li class="nav-item">
      <a class="nav-link" onclick="openSubTab(event, 'sessional2')">SessionalII</a>
    </li>
      <li class="nav-item">
      <a class="nav-link" onclick="openSubTab(event, 'project')">Project</a>
    </li>
  </ul>

  <div id="quiz" class="container tab-pane active" style="display: block;"><br>
    <h3>Quiz</h3>
    <table class="table table-bordered table-striped">
        <thead class="blue-header">
            <tr>
                <th>Quiz No</th>
                <th>Weightage</th>
                <th>Obtained Marks</th>
                <th>Total Marks</th>
                <th>Average</th>
                <th>Minimum</th>
                <th>Maximum</th>
            </tr>
        </thead>
        <tbody id="quizTableBody" runat="server">
        </tbody>
    </table>
  </div>

      <div id="assignments" class="container tab-pane" style="display: none;"><br>
        <h3>Assignment</h3>
        <table class="table table-bordered table-striped">
            <thead class="blue-header">
                <tr>
                    <th>Assignment No</th>
                    <th>Weightage</th>
                    <th>Obtained Marks</th>
                    <th>Total Marks</th>
                    <th>Average</th>
                    <th>Minimum</th>
                    <th>Maximum</th>
                </tr>
            </thead>
            
            <tbody id="assignmentTableBody" runat="server">
            
            </tbody>
        </table>
  </div>



      <div id="sessional1" class="container tab-pane" style="display:  none;"><br>
        <h3>Sessional I</h3>
        <table class="table table-bordered table-striped">
            <thead class="blue-header">
                <tr>
                    <th>Sessional No</th>
                    <th>Weightage</th>
                    <th>Obtained Marks</th>
                    <th>Total Marks</th>
                    <th>Average</th>
                    <th>Minimum</th>
                    <th>Maximum</th>
                </tr>
            </thead>
            
            <tbody id="sessional1TableBody" runat="server">
            
            </tbody>
        </table>
  </div>

      <div id="sessional2" class="container tab-pane" style="display:  none;"><br>
    <h3>Sessional II</h3>
    <table class="table table-bordered table-striped">
        <thead class="blue-header">
            <tr>
                <th>Weightage</th>
                <th>Obtained Marks</th>
                <th>Total Marks</th>
                <th>Average</th>
                <th>Minimum</th>
                <th>Maximum</th>
            </tr>
        </thead>
       <tbody id="sessional2TableBody" runat="server">
            
            </tbody>
        
    </table>
  </div>


     <div id="project" class="container tab-pane" style="display:  none;"><br>
    <h3>Project</h3>
    <table class="table table-bordered table-striped">
        <thead class="blue-header">
            <tr>
                <th>Weightage</th>
                <th>Obtained Marks</th>
                <th>Total Marks</th>
                <th>Average</th>
                <th>Minimum</th>
                <th>Maximum</th>
            </tr>
        </thead>

        <tbody id="projectTableBody" runat="server">
            </tbody>   
    </table>
  </div>
</div>
</div>

 </ContentTemplate>
</asp:UpdatePanel>

  <div id="attendance" class="tab-content">
  <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
      <asp:DropDownList ID="DropDownList2" name="courses2" class="margin-settings" runat="server" AutoPostBack="true" OnSelectedIndexChanged="courses2_SelectedIndexChanged"></asp:DropDownList>
      <h3>Attendance</h3>
      <div class="container attendance-table" style="background-color:azure">
        <table class="table table-bordered table-striped">
          <thead class="blue-header">
            <tr>
              <th>Lecture no</th>
              <th>Date</th>
              <th>Section</th>
              <th>Presence</th>
            </tr>
          </thead>
          <tbody id="attendanceTableBody" runat="server">
          </tbody>
        </table>
      </div> 
    </ContentTemplate>
  </asp:UpdatePanel> 
</div> 



       <div id="transcript" class="tab-content">
         <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
       <asp:DropDownList ID="semesterDropDownList" runat="server" CssClass="margin-settings course-dropdown" AutoPostBack="true" OnSelectedIndexChanged="semesterDropDownList_SelectedIndexChanged">
        </asp:DropDownList>


        <h3>Transcript</h3>
      
    <div class="container attendance-table" style="background-color:azure">

    <table class="table table-bordered table-striped">
            <thead class="blue-header">
                <tr>
                    <th>Course Code</th>
                    <th>Course Name</th>
                    <th>Section</th>
                    <th>Credit Hours</th>
                     <th>Grade</th>
                </tr>
            </thead>
             <tbody id="transcriptTableBody" runat="server">
            </tbody>
            </table>
        </div> 
         </ContentTemplate>
         </asp:UpdatePanel>
    </div>




        <div id="feedback" class="tab-content date-dropdown">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h2>Teacher Feedback Form</h2>
      

            <div class="form-group">
    <label for="date_input">Date:</label>
    <asp:TextBox ID="date_input" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    </div>
 

            <asp:DropDownList ID="dropdownTeacher" runat="server" DataTextField="FacultyName" DataValueField="FacultyID">
            </asp:DropDownList>


            <h4>Questions</h4>

             <h4>Appearance and Personal Presentation</h4>

            <div class="form-group">
                    <label>1. The teacher attends class in a well-presentable manner.</label>
                    <asp:RadioButtonList ID="Question1" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>


          

            <div class="form-group">
                    <label>2. The teacher shows enthusiasm while teaching in class.</label>
                    <asp:RadioButtonList ID="Question2" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>


              <div class="form-group">
                    <label>3. Teacher shows initiative and flexibility in teaching.</label>
                    <asp:RadioButtonList ID="Question3" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>


            <div class="form-group">
                    <label>4. Teacher is well articulated and shows full knowledge of the subject in teaching.</label>
                    <asp:RadioButtonList ID="Question4" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

           <div class="form-group">
                    <label>5. Teacher speaks loud and clear enough to be heard by the whole class.</label>
                    <asp:RadioButtonList ID="Question5" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <h4>Professional Practices</h4>


             <div class="form-group">
                    <label>1. Teacher shows professionalism in class.</label>
                    <asp:RadioButtonList ID="Question6" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <div class="form-group">
                    <label>2. Teacher shows commitment to teaching the class.</label>
                    <asp:RadioButtonList ID="Question7" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                 <div class="form-group">
                    <label>3. Teachers encourages student to engage in class discussions.</label>
                    <asp:RadioButtonList ID="Question8" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
           

                <div class="form-group">
                    <label>4. Teacher handles criticism and suggestions professionally.</label>
                    <asp:RadioButtonList ID="Question9" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>



          <div class="form-group">
                    <label>5. Teacher starts class on time.</label>
                    <asp:RadioButtonList ID="Question10" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

            
          <div class="form-group">
                    <label>6. Teacher ends class on time.</label>
                    <asp:RadioButtonList ID="Question11" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

             <h4>Teaching Methods</h4>


            <div class="form-group">
                    <label>1. Teacher shows well rounded knowledge over the subject matter.</label>
                    <asp:RadioButtonList ID="Question12" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

           <div class="form-group">
                    <label>2. Teacher has organized the lesson conductive for easy understanding of students.</label>
                    <asp:RadioButtonList ID="Question13" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>



                <div class="form-group">
                    <label>3. Teacher shows dynamism and enthusiasm.</label>
                    <asp:RadioButtonList ID="Question14" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

            <div class="form-group">
                    <label>4. Teacher stimulates the critical thinking of students.</label>
                    <asp:RadioButtonList ID="Question15" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                 <div class="form-group">
                    <label>5. Teacher handles the class environment conductive for learning.</label>
                    <asp:RadioButtonList ID="Question16" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
              
               <h4>Dipsosition Towards Students</h4>

                
                 <div class="form-group">
                    <label>1. Teacher believes that student can learn from the class.</label>
                    <asp:RadioButtonList ID="Question17" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
              

            <div class="form-group">
                    <label>2. Teacher shows equal respect to various cultural backgrounds, individuals and race.</label>
                    <asp:RadioButtonList ID="Question18" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

            <div class="form-group">
                    <label>3. Teacher finds the students strengths as basis for growth and weaknesses as opportunities for improvement.</label>
                    <asp:RadioButtonList ID="Question19" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

             <div class="form-group">
                    <label>4.  Teacher understands the weakness of a student and helps in student's improvement.</label>
                    <asp:RadioButtonList ID="Question20" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

           <h4>Comments</h4>

        <div class="form-group">
            <label for="Comment">Add your comments about the teacher:</label>
            <asp:TextBox ID="Comment" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
        </div>
            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>

            <asp:Button ID="btnSubmitFeedback" runat="server" Text="Submit" OnClick="btnSubmitFeedback_Click" CssClass="btn btn-primary" />
          
          </div>
          </div>
          </div>
         </div>

</div>
</div>
</form>
<script>
    function openTab(evt, tabName) {
        var i, tabContent, tabLinks;
        tabContent = document.getElementsByClassName("tab-content");
        for (i = 0; i < tabContent.length; i++) {
            tabContent[i].style.display = "none";
        }
        tabLinks = document.getElementsByClassName("tab");
        for (i = 0; i < tabLinks.length; i++) {
            tabLinks[i].classList.remove("active");
        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.classList.add("active");

        <%--if (tabName === 'registration') {
            document.getElementById('<%= btnRefreshCourses.ClientID %>').click();
        }--%>

    }

    function openSubTab(evt, subTabName) {
        var i, subTabContent, subTabLinks;
        subTabContent = document.getElementsByClassName("tab-pane");
        for (i = 0; i < subTabContent.length; i++) {
            subTabContent[i].style.display = "none";
        }
        subTabLinks = document.getElementsByClassName("nav-link");
        for (i = 0; i < subTabLinks.length; i++) {
            subTabLinks[i].classList.remove("active");
        }
        document.getElementById(subTabName).style.display = "block";
        evt.currentTarget.classList.add("active");
    }

    function validateForm() {
        var allAnswered = true;
        for (var i = 1; i <= 5; i++) {
            var radios = document.getElementsByName('question' + i);
            var answered = false;

            for (var j = 0; j < radios.length; j++) {
                if (radios[j].checked) {
                    answered = true;
                    break;
                }
            }

            if (!answered) {
                allAnswered = false;
                alert('Please answer question ' + i);
                break;
            }
        }
        return allAnswered;
    }
  
 
</script>


</body>

</html>



