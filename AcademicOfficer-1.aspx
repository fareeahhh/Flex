<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AcademicOfficer-1.aspx.cs" Inherits="AcademicOfficer_1" %>

<!DOCTYPE html>
<html>

<head>
    <title>Manage Students</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
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
        .page-header {
            margin-bottom: 20px;
            font-size: 32px;
            font-weight: 700;
        }
    </style>
</head>

<body>
    <div class="vertical-tabs">
        <div class="tab" onclick="location.href='academicofficer.aspx'">Home</div>
        <div class="tab" onclick="location.href='Course.aspx'">Offer Courses</div>
        <div class="tab active" onclick="location.href='ManageStudents.aspx'">Manage Students</div>
        <div class="tab" onclick="location.href='AssignCourses.aspx'">Assign Courses</div>
    </div>

    <div class="content-container">
        <h1 class="page-header">Manage Students</h1>
        <div class="card">
            <div class="card-header text-center">
                <h2>Add New Student</h2>
            </div>
            <div class="card-body">
                <form id="form1" runat="server">
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <asp:TextBox ID="username" placeholder="Username" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <asp:TextBox ID="password" TextMode="Password" placeholder="Password" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="firstName">First Name:</label>
                        <asp:TextBox ID="firstName" placeholder="First Name" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name:</label>
                        <asp:TextBox ID="lastName" placeholder="Last Name" CssClass="form-control" runat="server" />
</div>
<div class="form-group">
<label for="dob">Date of Birth:</label>
<asp:TextBox ID="dob" placeholder="Date of Birth (YYYY/MM/DD)" CssClass="form-control" runat="server" />
</div>
<div class="form-group">
<label for="currentSemester">Current Semester:</label>
<asp:TextBox ID="currentSemester" placeholder="Current Semester" CssClass="form-control" runat="server" />
</div>
<div class="form-group">
<asp:Button ID="addStudent" Text="Add Student" CssClass="btn btn-primary" runat="server" OnClick="addStudent_Click" />
</div>
</form>
</div>
</div>
</div>

</body>
</html>
