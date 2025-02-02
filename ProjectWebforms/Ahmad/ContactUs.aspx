<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="ProjectWebforms.Ahmad.ContactUs" %>

<!DOCTYPE html>
<html>
<head>
    <title>Contact Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #E4E4E4; /* Light Gray */
        }
        .container {
            max-width: 900px;
            margin: 50px auto;
            background-color: #FFFFFF;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            color: #464646; /* Dark Gray */
            font-size: 2.5em;
        }
        p {
            color: #9F9F9F; /* Gray */
            line-height: 1.6;
            font-size: 1.1em;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            color: #464646; /* Dark Gray */
            font-size: 1.1em;
        }
        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            border: 1px solid #9F9F9F; /* Gray */
            border-radius: 5px;
            background-color: #F5F5F5; /* Slightly lighter gray */
        }
        button {
            background-color: #464646; /* Dark Gray */
            color: #FFFFFF; /* White */
            padding: 10px 20px;
            font-size: 1.1em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #000000; /* Black */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Contact Us</h1>
            <p>
                Have questions or need assistance? Feel free to reach out to us by filling out the form below. We’d love to hear from you!
            </p>

            <label for="txtName">Your Name:</label>
            <asp:TextBox ID="txtName" runat="server" Placeholder="Enter your name"></asp:TextBox>

            <label for="txtEmail">Your Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Placeholder="Enter your email"></asp:TextBox>

            <label for="txtMessage">Your Message:</label>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" Placeholder="Enter your message"></asp:TextBox>

            <asp:Button ID="btnSubmit" runat="server" Text="Send Message" OnClick="btnSubmit_Click" CssClass="btn" />
        </div>
    </form>
</body>
</html>

