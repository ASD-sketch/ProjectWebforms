using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ProjectWebforms.saja.ReserveRoom;

namespace ProjectWebforms.Ahmad
{
    public partial class PesndingRequestsRooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPendingRequests();
                LoadApprovedRequests();
            }

        
        }
        private void LoadPendingRequests()
        {
            string filePath = Server.MapPath("~/saja/PendingRequestsRoom.txt");
            List<RoomReservationRequest> requests = new List<RoomReservationRequest>();

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                foreach (string line in lines)
                {
                    string[] parts = line.Split('|');
                    if (parts.Length == 7) // تأكد من وجود جميع البيانات
                    {
                        requests.Add(new RoomReservationRequest
                        {
                            Id = parts[0],
                            FullName = parts[1],
                            Room = parts[2],
                            ReservationDate = parts[3],
                            ReservationTime = parts[4],
                            SnackAndPrice = parts[5],
                            Email = parts[6],
                          


                        });
                    }
                }
            }

            gvPendingRequests.DataSource = requests;
            gvPendingRequests.DataBind();
        }

        // تحميل الطلبات المعتمدة من ApprovedRequestsRoom.txt
        private void LoadApprovedRequests()
        {
            string filePath = Server.MapPath("~/saja/ApprovedRequestsRoom.txt");
            List<RoomReservationRequest> approvedRequests = new List<RoomReservationRequest>();

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                foreach (string line in lines)
                {
                    string[] parts = line.Split('|');
                    if (parts.Length == 7) // تأكد من وجود جميع البيانات
                    {
                        approvedRequests.Add(new RoomReservationRequest
                        {
                            Id = parts[0],
                            FullName = parts[1],
                            Room = parts[2],
                            ReservationDate = parts[3],
                            ReservationTime = parts[4],
                            SnackAndPrice = parts[5],
                            Email = parts[6],
                          
                        });
                    }
                }
            }

            gvApprovedRequests.DataSource = approvedRequests;
            gvApprovedRequests.DataBind();
        }

        // عند الضغط على زر "Approve"
        protected void gvPendingRequests_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string filePath = Server.MapPath("~/saja/PendingRequestsRoom.txt");
                string approvedFilePath = Server.MapPath("~/saja/ApprovedRequestsRoom.txt");

                string[] requests = File.ReadAllLines(filePath);

                if (index >= 0 && index < requests.Length)
                {
                    File.AppendAllText(approvedFilePath, requests[index] + Environment.NewLine);

                    var updatedRequests = requests.ToList();
                    updatedRequests.RemoveAt(index);
                    File.WriteAllLines(filePath, updatedRequests);

                    lblAdminMessage.Text = "Request approved successfully!";
                    LoadPendingRequests();
                    LoadApprovedRequests();
                }
            }
        }

        public class RoomReservationRequest
        {
            public string Id { get; set; }
            public string FullName { get; set; }
            public string Room { get; set; }
            public string ReservationDate { get; set; }
            public string ReservationTime { get; set; }
            public string SnackAndPrice { get; set; }
            public string Email { get; set; }
            
        }

    }
}