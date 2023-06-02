
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultyLogin.aspx.cs" Inherits="FacultyLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }
        
        .container {
            width: 300px;
            padding: 16px;
            background-color: white;
            margin: 50px auto;
            box-shadow: 0px 0px 10px 0px #000;
            border-radius: 5px;
        }
        
        h2 {
            text-align: center;
            color: #1a73e8;
        }
        
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        
        button {
            background-color: #1a73e8;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        
        button:hover {
            opacity: 0.8;
        }
        
        .signup {
            background-color: #f1f1f1;
            text-align: center;
            padding: 12px;
            border-top: 1px solid #ccc;
        }
        
        a {
            color: #1a73e8;
        }
    </style>
</head>
<body>
    <form id="loginForm" runat="server" class="container">
        <h2>Login</h2>
        
        <label for="Email"><b>Email.</b></label>
        <input type="text" placeholder="Enter Email" name="email" id="email" runat="server" required>
        
        <label for="password"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="password" id="password" runat="server" required>
        
        <button type="submit" runat="server" onserverclick="Login_Click">Login</button>
        
    </form>
</body>
</html>
