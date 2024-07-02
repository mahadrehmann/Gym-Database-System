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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Final_DB
{
    public partial class signupGymOwner : Form
    {
        public signupGymOwner()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label13_Click(object sender, EventArgs e)
        {

        }

        private void label15_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

            string FName = textBox1.Text;
            string LName = textBox2.Text;
            string Phone = textBox9.Text;
            DateTime DoB = dateTimePicker1.Value;
            string Age = textBox8.Text;
            string Address = textBox6.Text;

            string Username = textBox10.Text;
            string Password = textBox7.Text;

            string GymLoc = textBox3.Text;
            string GymName = textBox5.Text;

            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            string query = "EXEC InsertPersonGymAndOwner \'" + FName + "\',\'" + LName + "\',\'" + Phone + "\',\'" + DoB + "\'," + Age + ",\'" + Address + "\',\'" + Username + "\',\'" + Password + "\',\'" + GymName + "\',\'" + GymLoc + "\';";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();
            command.Dispose();
            connection.Close();
 

            var new_thread = new Thread(() => Application.Run(new login()));
            new_thread.Start();
            this.Close();
        }
    }
}
