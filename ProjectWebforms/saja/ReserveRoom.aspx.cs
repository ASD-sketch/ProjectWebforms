using com.sun.xml.@internal.ws.encoding.xml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWebforms.saja
{
    public partial class ReserveRoom : System.Web.UI.Page
    {

        public class Reservation
        {
            public int Id { get; set; }
            public string FullName { get; set; }
            public string Room { get; set; }
            public string Date { get; set; }
            public string Time { get; set; }
            public string Snack { get; set; }
            public string Email { get; set; }  // إبقاء البريد الإلكتروني فقط
        }

        // This will be used to track the last ID for the reservations
        private static int lastReservationId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get the values from the form
            string fullName = txtFullName.Text;
            string room = hiddenSelectedRoom.Value; // Room selected by the user
            string date = txtDate.Text;
            string time = txtTime.Text;
            string snack = ddlSnack.SelectedItem.Text;

            // Get current user email
            string email = GetCurrentUserEmail();

            // Check if the room is already reserved for the selected date and time
            if (IsRoomAlreadyReserved(room, date, time))
            {
                lblMessage.Visible = true;
                lblMessage.Text = "This room is already reserved for the selected time.";
                return;
            }

            // Generate a unique ID for this reservation
            lastReservationId++;

            // Create a reservation object
            Reservation reservation = new Reservation()
            {
                Id = lastReservationId,
                FullName = fullName,
                Room = room,
                Date = date,
                Time = time,
                Snack = snack,
                Email = email  // تخزين البريد الإلكتروني فقط
            };

            // Write the reservation to the file
            WriteReservationToFile(reservation);

            // Display a success message
            lblMessage.Visible = true;
            lblMessage.Text = "Reservation confirmed! Your ID is: " + reservation.Id;

            // Change the room's color to red (booked)
            ClientScript.RegisterStartupScript(this.GetType(), "markBookedRoom", "markRoomAsBooked('" + room + "');", true);
        }

        // Method to check if the room is already reserved for the selected date and time
        private bool IsRoomAlreadyReserved(string room, string date, string time)
        {
            string filePath = Server.MapPath("~/saja/PendingRequestsRoom.txt");

            // Read the existing reservations
            if (File.Exists(filePath))
            {
                string[] existingReservations = File.ReadAllLines(filePath);

                // Check each reservation to see if it overlaps
                foreach (string reservation in existingReservations)
                {
                    string[] details = reservation.Split('|');
                    if (details.Length >= 7) // Ensure the reservation data is valid
                    {
                        if (details[2] == room && details[3] == date && details[4] == time)
                        {
                            return true; // Room is already reserved for the selected time
                        }
                    }
                }
            }

            return false; // Room is available for reservation
        }

        // Method to write the reservation data to the file
        private void WriteReservationToFile(Reservation reservation)
        {
            string filePath = Server.MapPath("~/saja/PendingRequestsRoom.txt");

            // Prepare the reservation data to be written to the file
            string reservationData = $"{reservation.Id}|{reservation.FullName}|{reservation.Room}|{reservation.Date}|{reservation.Time}|{reservation.Snack}|{reservation.Email}\n";

            // Open the file and append the reservation data
            using (StreamWriter writer = new StreamWriter(filePath, true))
            {
                writer.Write(reservationData);
            }
        }

        // Method to get the current user's email from CurrentUser.txt
        private string GetCurrentUserEmail()
        {
            string filePath = Server.MapPath("~/Sofyan/loggedInUser.txt");

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                if (lines.Length > 0)
                {
                    string[] details = lines[0].Split('|'); // افتراض أن البريد الإلكتروني هو أول عنصر
                    if (details.Length >= 1) // تأكد من وجود بريد إلكتروني
                    {
                        return details[0]; // إرجاع البريد الإلكتروني
                    }
                }
            }
            return "Unknown"; // في حال عدم العثور على البريد الإلكتروني
        }



    }
}