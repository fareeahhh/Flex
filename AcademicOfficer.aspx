<%@ Page Language="C#" AutoEventWireup="true" CodeFile="academicofficer.aspx.cs" Inherits="academicofficer" %>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<!-- Font Awesome CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>


<!DOCTYPE html>
<html>
<head>
    <title>Vertical Tab</title>
    <style>
        .vertical-tabs {
            position: fixed;
            top: 150;
            left: 20;
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

        .vertical-tabs .tab-content {
            display: none;
            padding: 10px;
            border-left: 4px solid #ddd;
        }

        .vertical-tabs .tab-content.active {
            display: block;
        }
        
        .content-container {
            margin-left: 120px;
            padding: 20px;
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
        margin-left: 60;
       
    }

    .student-profile .card-body {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .card-gap {
        margin-bottom: 24px;
    }
    </style>
</head>
<body>
    <div class="vertical-tabs">
        <div class="tab active" onclick="openTab(event, 'home')">Home</div>
        <div class="tab" onclick="location.href='Course.aspx'">Offer Courses</div>
        <div class="tab" onclick="location.href='academicofficer-1.aspx'">Manage Students</div>
        <div class="tab" onclick="openTab(event, 'Assign Courses')">Assign Courses</div>

    </div>

    <div class="content-container">
        <div id="home" class="tab-content active">
            <h3>Flex Home</h3>

            <div class="student-profile py-4">
        <div class="container">
            <div class="row">
                <div class="col-lg-11">
                    <div class="card card-gap shadow-sm">
                        <div class="card-header bg-transparent text-center">
                         <h3 class="mb-0"><i class="far fa-clone pr-1"></i>University Information</h3>
                        </div>
                        <div class="card-body">
                            <p class="mb-0" ><strong class="pr-1">Department:</strong>CS</p>
                            <p class="mb-0"><strong class="pr-1">Designation:</strong>Academic Officer Manager</p>
                            <p class="mb-0"><strong class="pr-1">ID:</strong>123456789876</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-11">
                    <div class="card card-gap shadow-sm">
                        <div class="card-header bg-transparent text-center">
                            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Personal Information</h3>
                        </div>
                        <div class="card-body pt-0">
                            <p><strong>Name:</strong> Amir Rehman</p>
                            <p><strong>DOB:</strong> 05/02/1990</p>
                            <p><strong>Gender:</strong> Male</p>
                            <p><strong>CNIC:</strong> 12345-6789123-4</p>
                            <p><strong>Mobile No:</strong> 01234567892</p>
                        </div>
                       
                    </div>
                </div>
                <div class="col-lg-11">
                    <div class="card card-gap shadow-sm">
                        <div class="card-header bg-transparent text-center">
                            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Contact Information</h3>
                        </div>
                        <div class="card-body pt-0">
                             <p><strong>Address:</strong> </p>
                             <p><strong>City:</strong> Islamabad</p>
                             <p><strong>Country:</strong> Pakistan</p>
                        </div>
                    </div>
                </div>

                   
          
        </div>
    </div>
        </div>
     </div>       
    </div>

    <script>
        function openTab(evt, tabName) {
            var i, tabContent, tabLinks;
            tabContent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabContent.length; i++) {
                tabContent[i].style.display = "none";
            }
            tabLinks = document.getElementsByClassName("tab");
            for (i = 0; i < tabLinks.length; i++) {
                tabLinks[i].className = tabLinks[i].className.replace(" active", "");
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.className += " active";
        }
    </script>
</body>
</html>
















