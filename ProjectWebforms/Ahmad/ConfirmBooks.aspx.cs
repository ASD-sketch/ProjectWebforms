using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWebforms.Ahmad
{
    public partial class ConfirmBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPendingRequests();
            }
        }

        private void LoadPendingRequests()
        {
            string filePath = Server.MapPath("PendingRequests.txt");
            List<RoomReservationRequest> requests = new List<RoomReservationRequest>();

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                foreach (string line in lines)
                {
                    string[] parts = line.Split('|');
                    if (parts.Length == 6)
                    {
                        requests.Add(new RoomReservationRequest
                        {
                            Room = parts[0],
                            FullName = parts[1],
                            Email = parts[2],
                            Date = parts[3],
                            Time = parts[4]
                        });
                    }
                }
            }

            gvPendingRequests.DataSource = requests;
            gvPendingRequests.DataBind();
        }

        protected void gvPendingRequests_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string approvedFilePath = Server.MapPath("ApprovedRequests.txt");

                string[] requests = File.ReadAllLines(Server.MapPath("PendingRequests.txt"));

                File.AppendAllText(approvedFilePath, requests[index] + Environment.NewLine);

                lblAdminMessage.Text = "Request approved successfully!";
                LoadPendingRequests();
            }
        }
    }

    public class RoomReservationRequest
    {
        public string Room { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Date { get; set; }
        public string Time { get; set; }
    }

}
