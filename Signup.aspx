<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up Form</title>
    <style>
        body{
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-color: white;
        }
        .sign-up-form{
            width: 300px;
            box-shadow: 0 0 3px 0 rgba(0,0,0,0.3);
            background: #fff;
            padding: 20px;
            margin: 8% auto 0;
            text-align: center;
        }
        .sign-up-form h1{
            color: #1c8adb;
            margin-bottom: 30px;
        }
        .input-box{
            border-radius: 20px;
            padding: 10px;
            margin: 10px 0;
            width: 85%;
            border: 1px solid #999;
            outline: none;
        }
        button{
            color: #fff;
            width: 100%;
            padding: 10px;
            border-radius: 20px;
            font-size: 15px;
            margin: 10px 0;
            border: none;
            outline: none;
            cursor: pointer;
        }
        .signup-btn{
            background-color: #1c8adb;
        }
        a{
            text-decoration: none;
        }
        hr{
            margin-top:20px;
            width: 80%;
        }
        .or{
            background: #fff;
            width: 30px;
            margin: -19px auto 10px;
        }
    </style>
</head>
<body>
    <div class="sign-up-form">
        <h1>Sign Up Now</h1>
        <form id ="SignUp" runat="server">
          
            <input type="text" class="input-box" placeholder="First Name" name="firstName" id="firstName" runat="server">
            <input type="text" class="input-box" placeholder="Last Name" name="lastName" id="lastName" runat="server" >
            
            <input type="text" class="input-box" placeholder="DOB" name ="DOB" id ="DOB" runat ="server" >
              
            <input type="email" class="input-box" placeholder="Email" name ="Email" id ="Email" runat ="server" >
            <input type="password" class="input-box" placeholder="Password" name ="pass" id ="pass" runat="server"> 
            <input type="password" class="input-box" placeholder="Retype Password" > 
            <p><span><input type="checkbox" /></span>I agree to the Terms and Conditions.</p>
           <button type="submit" runat="server" onserverclick="SignUp_Click">Sign Up</button>
            <hr />
            <p class="or">OR</p>
            <p>Already have an account? <a href="AOLogin.aspx">Log in.</a></p>
        </form>
    </div>
</body>
</html>
