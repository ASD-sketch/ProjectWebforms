using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWebforms.Ahmad
{
    public partial class loginadmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("admins.txt");

            if (!File.Exists(filePath))
            {
                lblMessage.Text = "Error: Admin data file is missing!";
                return;
            }

            string[] lines = File.ReadAllLines(filePath);
            bool isAuthenticated = false;

            foreach (string line in lines)
            {
                string[] parts = line.Split(',');
                if (parts.Length == 2)
                {
                    string storedEmail = parts[0].Trim();
                    string storedPassword = parts[1].Trim();

                    if (txtEmail.Text.Trim() == storedEmail && txtPassword.Text.Trim() == storedPassword)
                    {
                        isAuthenticated = true;
                        break;
                    }
                }
            }

            if (isAuthenticated)
            {
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid login credentials!";
            }
        }



    }
}