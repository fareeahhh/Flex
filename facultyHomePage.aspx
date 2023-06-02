<%@ Page Language="C#" AutoEventWireup="true" CodeFile="facultyHomePage.aspx.cs" Inherits="faculty" %>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<!-- Font Awesome CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>


<!DOCTYPE html>
<html>
<head>
    <title>Faculty Home Page</title>
    <style>
    
        .vertical-tabs {
            display: inline-block;
            background-color: #f1f1f1;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 200px;
            overflow: hidden;
            position: fixed; /* Fixed sidebar (stay in place on scroll and position the sidebar) */
            top: 20%; /* Adjust the position from the top of the screen */
            left: 20px; /* Adjust the position from the left of the screen */
        }

        .vertical-tabs .tab {
            background-color: inherit;
            color: black;
            display: block;
            padding: 8px 16px;
            text-decoration: none;
            cursor: pointer;
        }

        .vertical-tabs .tab:hover {
            background-color: #ddd;
        }

        .vertical-tabs .tab.active {
            background-color: #ccc;
        }

        .content-container {
            margin-left: 150px; /* Adjust as needed (same as width of .vertical-tabs + a bit extra) */
            padding: 1px 16px;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        body {
            background: 	 #FFFFFF;  /* fallback for old browsers */
            padding: 0;
            margin: 0;
            font-family: 'Lato', sans-serif;
            color: #000;
        }

        .student-profile .card h3 {
            font-size: 20px;
            font-weight: 700;
        }

        .student-profile .card p {
            font-size: 16px;
            color: #000;
        }

        .student-profile .card {
            width: 100%;
            margin-left: 100px;
       
        }

        .student-profile .card-body {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .card-gap {
            margin-bottom: 24px;
        }
        
        .SMD{
            margin-left: 120px;
        }

        .MA{
            margin-left: 120px;
        }

        .ME{
            margin-left: 120px;
        }

        td {
            text-align: left;
        }

        .SMD2{
            margin-left: 120px;
        }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="vertical-tabs">
            <div class="tab" onclick="openTab(event, 'home')" id="defaultOpen">Home</div>
            <div class="tab" onclick="openTab(event, 'setMarksDistribution')">Set Marks Distribution</div>
            <div class="tab" onclick="openTab(event, 'manageAttendance')">Manage Attendance</div>
            <div class="tab" onclick="openTab(event, 'manageEvaluations')">Manage Evaluations</div>
            <div class="tab" onclick="openTab(event, 'generateGradesAndReport')">Generate Grades and Report</div>
            <div class="tab" onclick="openTab(event, 'Feedback')">Feedback</div>
        </div>

        <div class="content-container">
            <div id="home" class="tab-content">
                <br />
                <br />
                <h4 style="margin-left: 120px">Flex Home</h4>

                <div class="student-profile py-4">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-11">
                            <div class="card card-gap shadow-sm">
                                <div class="card-header bg-transparent text-center">
                                 <h3 class="mb-0"><i class="far fa-clone pr-1"></i>University Information</h3>
                                </div>
                                <div class="card-body">
                                    <p class="mb-0"><strong class="pr-1">Faculty ID:</strong>123</p>
                                    <p class="mb-0"><strong class="pr-1">Email:</strong>malaikahussain@nu.edu.pk</p>
                                    <p class="mb-0"><strong class="pr-1">Designation:</strong>Lecturer</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-11">
                            <div class="card card-gap shadow-sm">
                                <div class="card-header bg-transparent text-center">
                                    <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Personal Information</h3>
                                </div>
                                <div class="card-body">
                                    <p class="mb-0"><strong>Name:</strong> Malaika</p>
                                    <p class="mb-0"><strong>DOB:</strong> 1/25/2002</p>
                                    <p class="mb-0"><strong>Gender:</strong> Female</p>
                                    <p class="mb-0"><strong>CNIC:</strong> 32102-0818260-2</p>
                                    <p class="mb=0"><strong>Mobile No:</strong> 03310157254</p>
                                </div>
                       
                            </div>
                        </div>
                        <div class="col-lg-11">
                            <div class="card card-gap shadow-sm">
                                <div class="card-header bg-transparent text-center">
                                    <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Contact Information</h3>
                                </div>
                                <div class="card-body">
                                     <p class="mb-0"><strong>Address:</strong> House 71, Street 81, G-13/1</p>
                                     <p class="mb-0"><strong>City:</strong> Islamabad</p>
                                     <p class="mb-0"><strong>Country:</strong> Pakistan</p>
                                </div>
                            </div>
                        </div>          
                    </div>
                </div>
            </div>
        </div>

        <div id="setMarksDistribution" class="tab-content">

            <div class="SMD">
                <br />
                <br />
                <br />
                <h4>Set Marks Distribution</h4>

                <br />

                <table style="width:100%">
                    <tr>
                        <th>Campus</th>
                        <th>Semester</th>
                    </tr>
                    <tr>
                        <th>
                            <asp:DropDownList ID="Campus" runat="server"></asp:DropDownList>
                        </th>
                        <th>
                            <asp:DropDownList ID="semester" runat="server"></asp:DropDownList>
                        </th>
                    </tr>
                </table>

                <hr />

                <asp:GridView ID="CoursesGridView" runat="server" AutoGenerateColumns="False" CellPadding="10" Width="100%">
                    <Columns> 
                        <asp:TemplateField HeaderText="Code-Title">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="openTab(event, 'setMarksDistribution2', '<%# Eval("CourseTitle") %>', 'section<%# Container.DataItemIndex %>');"><%# Eval("CourseTitle") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Section">
                            <ItemTemplate>
                                <span id="section<%# Container.DataItemIndex %>"><%# Eval("Section") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Teacher" HeaderText="Teacher" />
                    </Columns>
                </asp:GridView>

            </div>

        </div>

        <%--<div id="manageAttendance" class="tab-content">

            <div class="MA">
                <br />
                <br />
                <br />
                <h4>Manage Attendance</h4>

                <br />

                <table style="width:100%">
                    <tr>
                        <th>Course</th>
                        <th>Section</th>
                        <th>Semester</th>
                        <th>Date</th>
                    </tr>
                    <tr>
                        <th>
                            <select id="course" name="course">
                                <option value="CS2001 - Data Structures">CS2001 - Data Structures</option>
                                <option value="CS2005 - Database Systems - Lab">CS2005 - Database Systems - Lab</option>
                            </select>
                        </th>
                        <th>
                            <select id="section" name="section">
                                <option value="BCS-4A">BCS-4A</option>
                                <option value="BCS-4B">BCS-4B</option>
                                <option value="BCS-4C">BCS-4C</option>
                            </select>
                        </th>
                        <th>
                            <select id="semesterr" name="semesterr">
                                <option value="Fall 2020">Fall 2020</option>
                                <option value="Spring 2021">Spring 2021</option>
                                <option value="Fall 2021">Fall 2021</option>
                                <option value="Spring 2022">Spring 2022</option>
                                <option value="Fall 2022">Fall 2022</option>
                                <option value="Spring 2023">Spring 2023</option>
                            </select>
                        </th>
                        <th>
                            <div class="form-group">
                                <input type="date" class="form-control" id="date-input" name="date">
                            </div>
                        </th>
                    </tr>
                </table>

                <hr />

                <table style="width:100%">
                    <tr>
                        <th>Student Name</th>
                        <th>Student Roll No.</th>
                        <th>Attendance</th>
                    </tr>
                    <tr>
                        <td>Fareeah Naseem</td>
                        <td>21i-0500</td>
                        <td>
                            <select id="a1" name="attendance">
                                <option value="A">A</option>
                                <option value="P">P</option>
                                <option value="L">L</option>
                            </select>
                        </td>
                   </tr>
                   <tr>
                        <td>Malaika</td>
                        <td>21i-2559</td>
                        <td>
                            <select id="a2" name="attendance">
                                <option value="A">A</option>
                                <option value="P">P</option>
                                <option value="L">L</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Saman Ahmed</td>
                        <td>21i-2499</td>
                        <td>
                            <select id="a3" name="attendance">
                                <option value="A">A</option>
                                <option value="P">P</option>
                                <option value="L">L</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Haider Naqvi</td>
                        <td>20i-0816</td>
                        <td>
                            <select id="a4" name="attendance">
                                <option value="A">A</option>
                                <option value="P">P</option>
                                <option value="L">L</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Fatima Khan</td>
                        <td>21i-0725</td>
                        <td>
                            <select id="a5" name="attendance">
                                <option value="A">A</option>
                                <option value="P">P</option>
                                <option value="L">L</option>
                            </select>
                        </td>
                    </tr>
                </table>

            </div>
        </div>--%>

        <div id="manageAttendance" class="tab-content">
            <div class="MA">
                <br />
                <br />
                <br />
                <h4>Manage Attendance</h4>
                <br />

                <table style="width:100%">
                    <tr>
                        <th>Course</th>
                        <th>Section</th>
                        <th>Semester</th>
                        <th>Date</th>
                    </tr>
                    <tr>
                        <th>
                            <asp:DropDownList ID="courseDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="courseDropDownList_SelectedIndexChanged" />
                            <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
                        </th>
                        <th>
                            <asp:DropDownList ID="sectionDropDown" runat="server">
                                <asp:ListItem Value="BCS-4A">BCS-4A</asp:ListItem>
                                <asp:ListItem Value="BCS-4B">BCS-4B</asp:ListItem>
                                <asp:ListItem Value="BCS-4C">BCS-4C</asp:ListItem>
                            </asp:DropDownList>
                        </th>
                        <th>
                            <asp:DropDownList ID="semesterDropDown" runat="server">
                                <asp:ListItem Value="Fall 2020">Fall 2020</asp:ListItem>
                                <asp:ListItem Value="Spring 2021">Spring 2021</asp:ListItem>
                                <asp:ListItem Value="Fall 2021">Fall 2021</asp:ListItem>
                                <asp:ListItem Value="Spring 2022">Spring 2022</asp:ListItem>
                                <asp:ListItem Value="Fall 2022">Fall 2022</asp:ListItem>
                                <asp:ListItem Value="Spring 2023">Spring 2023</asp:ListItem>
                            </asp:DropDownList>
                        </th>
                        <th>
                            <div class="form-group">
                                <asp:TextBox ID="dateInput" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </th>
                    </tr>
                </table>

                <hr/>

                <asp:Repeater ID="StudentRepeater" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th>Student Name</th>
                                <th>Student Roll No.</th>
                                <th>Attendance</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /></td>
                            <td><asp:Label ID="RollNumberLabel" runat="server" Text='<%# Eval("RollNumber") %>' /></td>
                            <td>
                                <asp:DropDownList ID="attendanceDropDown" runat="server">
                                    <asp:ListItem Value="A">A</asp:ListItem>
                                    <asp:ListItem Value="P">P</asp:ListItem>
                                    <asp:ListItem Value="L">L</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>

        <div id="manageEvaluations" class="tab-content">

            <div class="ME">
                <br />
                <br />
                <br />
                <h4>Manage Evaluations</h4>

                <br />

                <table style="width:100%">
                    <tr>
                        <th>Course</th>
                        <th>Evaluation Type</th>
                        <th>Section</th>
                        <th>Semester</th>
                    </tr>
                    <tr>
                        <th>
                            <select id="coursee" name="course">
                                <option value="CS2001 - Data Structures">CS2001 - Data Structures</option>
                                <option value="CS2005 - Database Systems - Lab">CS2005 - Database Systems - Lab</option>
                            </select>
                        </th>
                        <th>
                            <select id="evalutationType" name="evaluationType">
                                <option value="Assignment">Assignment</option>
                                <option value="Quiz">Quiz</option>
                                <option value="Sessional-I">Sessional-I</option>
                                <option value="Sessional-II">Sessional-II</option>
                                <option value="Project">Project</option>
                                <option value="Final Exam">Final Exam</option>
                            </select>
                        </th>
                        <th>
                            <select id="sectionn" name="section">
                                <option value="BCS-4A">BCS-4A</option>
                                <option value="BCS-4B">BCS-4B</option>
                                <option value="BCS-4C">BCS-4C</option>
                            </select>
                        </th>
                        <th>
                            <select id="semesterrr" name="semesterr">
                                <option value="Fall 2020">Fall 2020</option>
                                <option value="Spring 2021">Spring 2021</option>
                                <option value="Fall 2021">Fall 2021</option>
                                <option value="Spring 2022">Spring 2022</option>
                                <option value="Fall 2022">Fall 2022</option>
                                <option value="Spring 2023">Spring 2023</option>
                            </select>
                        </th>
                    </tr>
                </table>

                <hr />

                <%--<table style="width:100%">
                    <tr>
                        <th>Student Name</th>
                        <th>Student Roll No.</th>
                        <th>Obtained Marks</th>
                        <th>Average Marks</th>
                        <th>Total Marks</th>
                        <th>Weightage</th>
                    </tr>
                    <tr>
                        <td>Fareeah Naseem</td>
                        <td>21i-0500</td>
                        <td>5</td>
                        <td>5</td>
                        <td>10</td>
                        <td>1.0</td>
                   </tr>
                   <tr>
                        <td>Malaika</td>
                        <td>21i-2559</td>
                        <td>5</td>
                        <td>5</td>
                        <td>10</td>
                        <td>1.0</td>
                    </tr>
                    <tr>
                        <td>Saman Ahmed</td>
                        <td>21i-2499</td>
                        <td>5</td>
                        <td>5</td>
                        <td>10</td>
                        <td>1.0</td>
                    </tr>
                    <tr>
                        <td>Haider Naqvi</td>
                        <td>20i-0816</td>
                        <td>5</td>
                        <td>5</td>
                        <td>10</td>
                        <td>1.0</td>
                    </tr>
                    <tr>
                        <td>Fatima Khan</td>
                        <td>21i-0725</td>
                        <td>5</td>
                        <td>5</td>
                        <td>10</td>
                        <td>1.0</td>
                    </tr>
                </table>--%>

                <asp:Repeater ID="EvaluationRepeater" runat="server">
                    <HeaderTemplate>
                        <table style="width:100%">
                            <tr>
                                <th>Student Name</th>
                                <th>Student Roll No.</th>
                                <th>Obtained Marks</th>
                                <th>Total Marks</th>
                                <th>Weightage</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("FirstName") + " " + Eval("LastName") %>' /></td>
                            <td><asp:Label ID="RollNumberLabel" runat="server" Text='<%# Eval("RollNumber") %>' /></td>
                            <td><asp:Label ID="ObtainedMarksLabel" runat="server" Text='<%# Eval("ObtainedMarks") %>' /></td>
                            <td><asp:Label ID="TotalMarksLabel" runat="server" Text='<%# Eval("TotalMarks") %>' /></td>
                            <td><asp:Label ID="WeightageLabel" runat="server" Text='<%# Eval("Weightage") %>' /></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>

            </div>

        </div>


        <div id="setMarksDistribution2" class="tab-content">

            <div class="SMD2">

                <br />
                <br />
                <br />
                
                <p id="courseTitleDisplay"></p>
                <p id="sectionDisplay"></p>
                <p><b>NOTE:</b> To remove evaluation, insert zero.</p>

                <br />

                <h7>Evaluation Type:  </h7>
                <select id="evalType" name="evalType">
                    <option value="Fall 2020">Assignment</option>
                    <option value="Spring 2021">Quiz</option>
                    <option value="Fall 2021">Sessional-I</option>
                    <option value="Spring 2022">Sessional-II</option>
                    <option value="Fall 2022">Project</option>
                    <option value="Spring 2023">Final Exam</option>
                </select>

                <hr />

                <%--<table style="width:100%">
                    <tr>
                        <th>Sr#</th>
                        <th>Evaluation Name</th>
                        <th>Weightage</th>
                        <th>Range</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Assignment</td>
                        <td>
                            <form action="/action_page.php">
                                <input type="number" id="ET1" name="evalType" value="15" min="1" max="100"/>
                            </form>
                        </td>
                        <td>Range: 0 to 100</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Quiz</td>
                        <td>
                            <form action="/action_page.php">
                                <input type="number" id="ET2" name="evalType" value="15" size="4" maxlength="4"/>
                            </form>
                        </td>
                        <td>Range: 0 to 100</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Sessional-I</td>
                        <td>
                            <form action="/action_page.php">
                                <input type="number" id="ET3" name="evalType" value="15" size="4" maxlength="4"/>
                            </form>
                        </td>
                        <td>Range: 0 to 100</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Sessional-II</td>
                        <td>
                            <form action="/action_page.php">
                                <input type="number" id="ET4" name="evalType" value="15" size="4" maxlength="4"/>
                            </form>
                        </td>
                        <td>Range: 0 to 100</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>Project</td>
                        <td>
                            <form action="/action_page.php">
                                <input type="number" id="ET5" name="evalType" value="15" size="4" maxlength="4"/>
                            </form>
                        </td>
                        <td>Range: 0 to 100</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>Final Exam</td>
                        <td>
                            <form action="/action_page.php">
                                <input type="number" id="ET6" name="evalType" value="15" size="4" maxlength="4"/>
                            </form>
                        </td>
                        <td>Range: 0 to 100</td>
                    </tr>

                </table>--%>

                <%--<asp:GridView ID="EvaluationGridView" runat="server" AutoGenerateColumns="False" CellPadding="10" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="EvaluationType" HeaderText="Evaluation Type" />
                        <asp:BoundField DataField="Weightage" HeaderText="Weightage" />
                        <asp:TemplateField HeaderText="Range">
                            <ItemTemplate>
                                0 - 100
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>--%>

                <asp:GridView ID="EvaluationGridView" runat="server" AutoGenerateColumns="False" CellPadding="10" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="EvaluationType" HeaderText="Evaluation Type" />
                        <asp:TemplateField HeaderText="Weightage">
                            <ItemTemplate>
                                <asp:Label ID="lblWeightage" runat="server" Text='<%# Bind("Weightage") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtWeightage" runat="server" Text='<%# Bind("Weightage") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Range">
                            <ItemTemplate>
                                1 - 100
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                </asp:GridView>


                <br />

               <asp:Button ID="ResetButton" runat="server" Text="Reset Default Values" OnClick="ResetButton_Click" />
               <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />


                <br />
                <br />
                <br />

            </div>
            
        </div>

    </div>

    </form>

<script>

    function openTab(evt, tabName, courseTitle = null, sectionId = null) {
        evt.preventDefault();

        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tab-content");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tab");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        if (courseTitle) {
            document.getElementById("courseTitleDisplay").innerHTML = "Course: " + "<b>" + courseTitle + "</b>";
        }

        if (sectionId) {
            var section = document.getElementById(sectionId).innerText;
            document.getElementById("sectionDisplay").innerHTML = "Section: " + "<b>" + section + "</b>";
        }

        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    document.getElementById("defaultOpen").click();

</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
