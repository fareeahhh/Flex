<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Page1.aspx.cs" Inherits="Page1" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <!-- Add Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl7/1Z8+WIeA5cPSndayn1f5eG8f1KbySbRtS4FyCh" crossorigin="anonymous">
    <style>
        body {
            background-color: #F0F4F8;
            font-family: 'Helvetica Neue', sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 100px auto;
        }
        h1 {
            text-align: center;
            color: #0044FF;
            font-weight: bold;
            font-size: 36px;
            margin-bottom: 30px;
        }

         h2 {
            text-align: center;
            color: #4266db;
            font-size: 25px;
            margin-bottom: 60px;
        }
        .btn {
            background-color: #afdeea;
            font-size: 18px;
            font-weight: bold;
            width: 100%;
            height: 60px; /* Increase the height */
            margin-bottom: 10px;
            border-radius: 30px; /* Make the edges round */
}
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to FlexStudent </h1>
         <h2>Please select your role </h2>
        <button class="btn btn-primary" onclick="location.href='Signup.aspx'">Academic Officer</button>
        <button class="btn btn-success" onclick="location.href='studentlogin.aspx'">Student</button>
        <button class="btn btn-danger" onclick="location.href='FacultyLogin.aspx'">Faculty</button>
    </div>
    <!-- Add Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybBcuUpcPfFzE0rh1Z49cK0loDp4u/+T4yK7E/jPdx4G2C2w/" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-AwGgr/NItl94eaqF9Rgv2Q4uK959dMZij7+x3f3bqdIoCg6S4zi6I9X6q5KM6g/" crossorigin="anonymous"></script>
</body>
</html>
