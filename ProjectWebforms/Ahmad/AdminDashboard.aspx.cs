using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWebforms.Ahmad
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }


        private void LoadDashboardData()
        {
            int totalBooks = GetTotalBooks();
            int availableRooms = GetAvailableRooms();
            int pendingReservations = GetPendingReservations();

            lblTotalBooks.Text = totalBooks.ToString();
            lblAvailableRooms.Text = availableRooms.ToString();
            lblPendingReservations.Text = pendingReservations.ToString();

            
            int totalBooksPercentage = totalBooks > 0 ? 100 : 0;
            int availableRoomsPercentage = totalBooks > 0 ? (availableRooms * 100) / totalBooks : 0;
            int pendingReservationsPercentage = totalBooks > 0 ? (pendingReservations * 100) / totalBooks : 0;

            
            lblTotalBooks.Attributes["style"] = $"--percentage: {totalBooksPercentage}%";
            lblAvailableRooms.Attributes["style"] = $"--percentage: {availableRoomsPercentage}%";
            lblPendingReservations.Attributes["style"] = $"--percentage: {pendingReservationsPercentage}%";
        }

        private int GetTotalBooks()
        {
            string filePath = Server.MapPath("books.txt");
            if (!File.Exists(filePath)) return 0;

            string[] lines = File.ReadAllLines(filePath);
            return lines.Length; 
        }

        private int GetAvailableRooms()
        {
            string filePath = Server.MapPath("rooms.txt");
            if (!File.Exists(filePath)) return 0;

            string[] lines = File.ReadAllLines(filePath);
            return lines.Count(line => line.Contains("available")); 
        }

        private int GetPendingReservations()
        {
            string filePath = Server.MapPath("reservations.txt");
            if (!File.Exists(filePath)) return 0;

            string[] lines = File.ReadAllLines(filePath);
            return lines.Count(line => line.Contains("Pending"));
        }




    }
}