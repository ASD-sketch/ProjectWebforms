<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="ProjectWebforms.Ahmad.AboutUs" %>

<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #E4E4E4; /* Light Gray */
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 20px;
        }
        .header img {
            width: 200px;
            border-radius: 10px;
        }
        .header-content {
            flex: 1;
        }
        .header-content h1 {
            font-size: 2.5em;
            color: #464646; /* Dark Gray */
        }
        .header-content p {
            font-size: 1.2em;
            color: #9F9F9F; /* Gray */
            line-height: 1.6;
        }
        .header-content button {
            background-color: #464646; /* Dark Gray */
            color: #FFFFFF;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
        }
        .header-content button:hover {
            background-color: #000000; /* Black */
        }
        .features {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 30px;
        }
        .feature {
            flex: 1;
            min-width: 250px;
            background-color: #CCE0C5; /* Light Green */
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .feature h2 {
            font-size: 1.5em;
            color: #464646; /* Dark Gray */
        }
        .feature p {
            font-size: 1em;
            color: #9F9F9F; /* Gray */
            margin-top: 10px;
        }
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                text-align: center;
            }
            .features {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Header Section -->
            <div class="header">
                <img src="image.jpg" alt="Library Image">
                <div class="header-content">
                    <h1>About Us</h1>
                    <p>
                        Welcome to the University Library Management System! We are here to provide a seamless and user-friendly experience for all your library needs.
                    </p>
                    <button type="button">Book a Call</button>
                </div>
            </div>

            <!-- Features Section -->
            <div class="features">
                <div class="feature">
                    <h2>01<br>Development</h2>
                    <p>
                        We focus on creating efficient and modern solutions for library management to enhance user experience.
                    </p>
                </div>
                <div class="feature">
                    <h2>02<br>Design Projects</h2>
                    <p>
                        Our team designs projects tailored to the specific needs of libraries and their users.
                    </p>
                </div>
                <div class="feature">
                    <h2>03<br>New Materials</h2>
                    <p>
                        Stay updated with the latest tools and technologies to make library management easier and more effective.
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
