<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PesndingRequestsRooms.aspx.cs" Inherits="ProjectWebforms.Ahmad.PesndingRequestsRooms" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Manage Reservations</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <h2>Library Admin</h2>
            <asp:Button CssClass="menu-button" runat="server" Text="Home" PostBackUrl="AdminDashboard.aspx" />
            <asp:Button CssClass="menu-button" runat="server" Text="Manage Books" PostBackUrl="ManageBooks.aspx" />
            <asp:Button CssClass="menu-button" runat="server" Text="Manage Rooms" PostBackUrl="ManageRooms.aspx" />
            <asp:Button CssClass="menu-button" runat="server" Text="Notifications" PostBackUrl="Notifications.aspx" />
            <asp:Button CssClass="menu-button" runat="server" Text="Pending Requests Books" PostBackUrl="PendingRequestsBooks.aspx" />
            <asp:Button CssClass="menu-button" runat="server" Text="Pending Requests Rooms" PostBackUrl="PesndingRequestsRooms.aspx" />
            <asp:Button CssClass="menu-button" runat="server" Text="Manage Rooms" PostBackUrl="ManageRooms.aspx" />
            <asp:Button CssClass="menu-button" runat="server" Text="Logout" PostBackUrl="loginadmin.aspx" />
        </div>
        <div class="container mt-5">
            <h2>Pending Reservation Requests</h2>
            <asp:GridView ID="gvPendingRequests" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" OnRowCommand="gvPendingRequests_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
                    <asp:BoundField DataField="FullName" HeaderText="Name" SortExpression="FullName" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="ReservationDate" HeaderText="Date" SortExpression="ReservationDate" />
                    <asp:BoundField DataField="ReservationTime" HeaderText="Time" SortExpression="ReservationTime" />
                    <asp:BoundField DataField="SnackAndPrice" HeaderText="Snack" SortExpression="SnackAndPrice" />
                    <asp:ButtonField ButtonType="Button" Text="Approve" CommandName="Approve" />
                </Columns>
            </asp:GridView>

            <hr />

            <h2>Approved Reservation Requests</h2>
            <asp:GridView ID="gvApprovedRequests" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="Room" HeaderText="Room" />
                    <asp:BoundField DataField="FullName" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="ReservationDate" HeaderText="Date" />
                    <asp:BoundField DataField="ReservationTime" HeaderText="Time" />
                    <asp:BoundField DataField="SnackAndPrice" HeaderText="Snack" />
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblAdminMessage" runat="server" CssClass="alert"></asp:Label>
        </div>
    </form>
</body>
</html>
