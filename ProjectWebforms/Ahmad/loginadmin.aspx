<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginadmin.aspx.cs" Inherits="ProjectWebforms.Ahmad.loginadmin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
     body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: url('https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ffe484cdf-45b4-4a85-8046-0bc7ef7f45fe_4032x3024.jpeg') no-repeat center center fixed;
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.login-container {
    background: rgba(255, 255, 255, 0.95);
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
    width: 400px;
    text-align: center;
}

.login-container h2 {
    color: #2c3e50;
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: bold;
}

.input-group {
    position: relative;
    margin-bottom: 20px;
}

.input-group input {
    width: calc(100% - 40px);
    padding: 12px 15px;
    border: 2px solid #2c3e50;
    border-radius: 5px;
    font-size: 16px;
    padding-left: 45px;
    outline: none;
}

.input-group i {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #2c3e50;
    font-size: 18px;
}

.btn-login {
    width: 100%;
    background: #2c3e50;
    color: white;
    padding: 12px;
    border: none;
    border-radius: 5px;
    font-size: 18px;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
}

.btn-login:hover {
    background: #1a252f;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Library Admin Login</h2>
            <div class="input-group">
                <i class="fa fa-user"></i>
                <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email"></asp:TextBox>
            </div>
            <div class="input-group">
                <i class="fa fa-lock"></i>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>
            </div>
            <asp:Button ID="btnLogin" runat="server" CssClass="btn-login" Text="Login" OnClick="btnLogin_Click" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
