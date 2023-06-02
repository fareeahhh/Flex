<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Course.aspx.cs" Inherits="Course" %>

<!DOCTYPE html>
<html>

<head>
    <title>Offer Courses</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
   <!-- Font Awesome CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>
 <style>
        body {
            font-family: 'Lato', sans-serif;
            background-color: #f8f9fa;
        }
        .vertical-tabs {
            position: fixed;
            top: 250px;
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
          .page-header {
            margin-bottom: 20px;
            font-size: 32px;
            font-weight: 700;
        }
        .vertical-tabs .tab.active {
            background-color: #ddd;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .form-control {
            border-radius: 0;
        }
        .btn {
            border-radius: 0;
        }
        .content-container {
            margin-left: 160px;
            padding: 20px;
        }
    </style>
</head>

    
<body>
    <div class="vertical-tabs">
        <div class="tab" onclick="location.href='academicofficer.aspx'">Home</div>
        <div class="tab active" onclick="location.href='Course.aspx'">Offer Courses</div>
        <div class="tab" onclick="location.href='academicofficer-1.aspx'">Manage Students</div>
        <div class="tab" onclick="location.href='AssignCourses.aspx'">Assign Courses</div>
    </div>

    <div class="content-container">
       <h1 class="page-header">Offer Courses</h1>
        <div class="card">
             
            <div class="card-header text-center">
                <h2>Add New Course</h2>
            </div>
            <div class="card-body">
                <form id="addCourseForm" runat="server">
                    <div class="form-group">
                        <label for="courseCode">Course Code:</label>
                        <input type="text" id="courseCode" name="courseCode" class="form-control"  runat="server"/>
                    </div>
                    <div class="form-group">
                        <label for="courseName">Course Name:</label>
                        <input type="text" id="courseName" name="courseName" class="form-control"  runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="creditHours">Credit Hours:</label>
                        <input type="text" id="creditHours" name="creditHours" class="form-control" runat="server">
                    </div>
                    <div class="form-group">
                        <label for="semesterOffered">Semester Offered:</label>
                        <input type="text" id="semesterOffered" name="semesterOffered" class="form-control"  runat="server">
                    </div>
                    <div class="form-group">
                        <label for="preRequisite">Pre-Requisite:</label>
                                               <input type="text" id="preRequisite" name="preRequisite" class="form-control"  runat="server">
                    </div>
                    <div class="form-group">
                       
                       <asp:Button ID="AddCourse" runat="server" Text="Add Course" CssClass="btn btn-primary" OnClick="AddCourse_Click" />
                 
                            </div>
                
            </div>
        </div>
        
       <script>
           function showSuccessMessage() {
               var msgBox = document.getElementById('successMsg');
               msgBox.style.display = 'block';

               setTimeout(function () {
                   msgBox.style.display = 'none';
               }, 2000); // The message box will disappear after 2 seconds
           }
       </script>

        <!-- Offer a course section -->
       
        <div class="card mt-5">
            <div class="card-header text-center">
                <h2>Offer a Course</h2>
            </div>
            <div class="card-body">
               
                    <div class="form-group">
                        <label for="courseSelect">Course:</label>
                      <asp:DropDownList ID="courseSelect" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="semesterSelect">Semester:</label>
                      <asp:DropDownList ID="semesterSelect" runat="server" CssClass="form-control"></asp:DropDownList>
                            <!-- List of semesters -->
                    </div>
                    <div class="form-group">
                        <input id="OfferCourseBtn" type="submit" value="Offer Course" class="btn btn-primary" runat="server" onserverclick="OfferCourse_Click" />
                    </div>
            
             </form>
            </div>
        </div>
    </div>
</body>

 
</html>



