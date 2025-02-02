<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmBooks.aspx.cs" Inherits="ProjectWebforms.Ahmad.ConfirmBooks" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Manage Reservations</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Pending Reservation Requests</h2>
            <asp:GridView ID="gvPendingRequests" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" OnRowCommand="gvPendingRequests_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Room" HeaderText="Room" />
                    <asp:BoundField DataField="FullName" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="Time" HeaderText="Time" />
                    <asp:ButtonField ButtonType="Button" Text="Approve" CommandName="Approve" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblAdminMessage" runat="server" CssClass="alert"></asp:Label>
        </div>
    </form>
</body>
</html>