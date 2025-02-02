<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReserveRoom.aspx.cs" Inherits="ProjectWebforms.saja.ReserveRoom" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Room Reservation</title>
    <style>
        /* General styles for box-sizing, body font, and container layout */
        * { box-sizing: border-box; }
        body { font-family: Arial, sans-serif; }
        
        /* Navigation styles */
        nav { background-color: #34495E; color: white; padding: 1.5rem; text-align: center; }
        
        /* Container for layout */
        .container { max-width: 1200px; margin: 2rem auto; padding: 1rem; }
        
        /* Grid layout for room maze */
        .maze { display: grid; grid-template-columns: repeat(5, 1fr); gap: 15px; }
        
        /* Room styling (available and booked states) */
        .room { padding: 20px; text-align: center; cursor: pointer; height: 120px; }
        .available { background-color: #2ECC71; color: white; }
        .booked { background-color: #E74C3C; color: white; cursor: not-allowed; }
        
        /* Booking form styles */
        .booking-form { background-color: #f9f9f9; padding: 2rem; border-radius: 10px; margin-top: 2rem; }
        input, select { width: 100%; padding: 0.8rem; margin: 0.5rem 0; }
        button { background-color: #2980B9; color: white; border: none; padding: 1rem; cursor: pointer; width: 100%; }
        
        /* Footer styles */
        footer { background-color: #34495E; color: white; text-align: center; padding: 1.5rem; }
        
        /* Overriding booked room style with more priority */
        .booked { background-color: red !important; color: white; cursor: not-allowed; }
    </style>

    <script type="text/javascript">
        /* Function to handle room selection */
        function setSelectedRoom(room, elem) {
            // Update hidden field with selected room
            document.getElementById('<%= hiddenSelectedRoom.ClientID %>').value = room;

    // Display the selected room in label
            document.getElementById('<%= lblRoomDetails.ClientID %>').innerText = "Selected Room: " + room;

            // Remove 'selected' class from other rooms and apply it to clicked room
            var rooms = document.getElementsByClassName('room');
            for (var i = 0; i < rooms.length; i++) {
                rooms[i].classList.remove('selected');
            }
            elem.classList.add('selected');
        }


        /* Function to mark a room as booked */
        function markRoomAsBooked(room) {
            var rooms = document.getElementsByClassName('room');
            for (var i = 0; i < rooms.length; i++) {
                if (rooms[i].innerText.includes(room)) {
                    rooms[i].classList.remove('available');
                    rooms[i].classList.add('booked');
                    break;
                }
            }
        }

    </script>

</head>
<body>
 <form id="form1" runat="server">
        <div>
            <!-- Navigation Section -->
            <nav>
                <h1>Study Room Reservation System 📚</h1>
            </nav>

            <div class="container">
                <h2>Room Layout</h2>
                
                <!-- Grid layout of available and booked rooms -->
                <div class="maze">
                    <div class="room booked">
                        <div class="room-label">Room 1</div>
                    </div>
                    <div class="room available" onclick="setSelectedRoom('Room 2', this)">
                        <div class="room-label">Room 2</div>
                    </div>
                    <div class="room available" onclick="setSelectedRoom('Room 3', this)">
                        <div class="room-label">Room 3</div>
                    </div>
                    <div class="room available" onclick="setSelectedRoom('Room 4', this)">
                        <div class="room-label">Room 4</div>
                    </div>
                    <div class="room booked">
                        <div class="room-label">Room 5</div>
                    </div>
                </div>

                <!-- Booking Form Section -->
                <div class="booking-form">
                    <h2>Booking Form</h2>
                    <asp:Label ID="lblCountdown" runat="server" ForeColor="Blue"></asp:Label>

                    <!-- Display the selected room -->
                    <asp:Label ID="lblRoomDetails" runat="server" Text="Selected Room: None"></asp:Label>
                    
                    <!-- Hidden field to store the selected room -->
                    <asp:HiddenField ID="hiddenSelectedRoom" runat="server" />

                    <!-- User's Full Name Input -->
                    <asp:TextBox ID="txtFullName" runat="server" placeholder="Full Name" required="true"></asp:TextBox>
                    
                    <!-- Date and Time Inputs -->
                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" required="true"></asp:TextBox>
                    <asp:TextBox ID="txtTime" runat="server" TextMode="Time" required="true"></asp:TextBox>
                    
                    <!-- Snack selection dropdown -->
                    <asp:DropDownList ID="ddlSnack" runat="server">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Chips - 10 JD" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Cookies - 5 JD" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Soda - 7 JD" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Chocolate - 8 JD" Value="8"></asp:ListItem>
                    </asp:DropDownList>
                    
                    <!-- Submit Button -->
                    <asp:Button ID="btnSubmit" runat="server" Text="Confirm Reservation" OnClick="btnSubmit_Click" />

                    <!-- Error Message Label -->
                   <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>

                </div>
            </div>

            <!-- Footer Section -->
            <footer>
                <p>&copy; 2025 Reservation System. All rights reserved.</p>
            </footer>
        </div>
    </form>
</body>
</html>    