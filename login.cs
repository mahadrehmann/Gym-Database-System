using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Final_DB
{
    public partial class login : Form
    {
        public login()
        {
            InitializeComponent();
        }

        private void label3_Click(object sender, EventArgs e)
        {
            string enteredID = textBox1.Text;
            string enteredPassword = textBox2.Text;
            
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";

            string query1 = "EXEC GetRoleByUsernameAndPassword \'" + enteredID + "\',\'" + enteredPassword + "\'";
            string query2 = " GetUserIDByUsernameAndPassword\'" + enteredID + "\',\'" + enteredPassword + "\'";
            string role = "";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query1, connection);

                connection.Open();
                role = command.ExecuteScalar()?.ToString();
                connection.Close();
            }


            if (role=="Admin")
            {
                MessageBox.Show("Admin Logged in");
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query2, connection);

                    connection.Open();
                    enteredID = command.ExecuteScalar()?.ToString();
                    connection.Close();
                }
                var new_thread = new Thread(() => Application.Run(new adminHub(enteredID)));
                new_thread.Start();
                this.Close();
            }
            else if (role == "Trainer")
            {
                MessageBox.Show("Trainer Logged in");
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query2, connection);

                    connection.Open();
                    enteredID = command.ExecuteScalar()?.ToString();
                    connection.Close();
                }
                var new_thread = new Thread(() => Application.Run(new trainerHub(enteredID)));
                new_thread.Start();
                this.Close();
            }
            else if (role == "Owner")
            {
                MessageBox.Show("Owner Logged in");
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query2, connection);

                    connection.Open();
                    enteredID = command.ExecuteScalar()?.ToString();
                    connection.Close();
                }
                var new_thread = new Thread(() => Application.Run(new gymOwnerHub(enteredID)));
                new_thread.Start();
                this.Close();
            }
            else if (role == "Member")
            {
                MessageBox.Show("Member Logged in");
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query2, connection);

                    connection.Open();
                    enteredID = command.ExecuteScalar()?.ToString();
                    connection.Close();
                }
                var new_thread = new Thread(() => Application.Run(new memberHub(enteredID)));
                new_thread.Start();
                this.Close();
            }
            else
            {
                MessageBox.Show("Invalid ID or password.");
            }
        }
        

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new signupSelector()));
            new_thread.Start();
            this.Close();
        }

        private void login_Load(object sender, EventArgs e)
        {

        }
    }
}
