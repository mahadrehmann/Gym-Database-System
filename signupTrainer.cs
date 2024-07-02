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
    public partial class signupTrainer : Form
    {
        public signupTrainer()
        {
            InitializeComponent();
            PopulateComboBox();
        }
   
        private void PopulateComboBox()
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            string query = "SELECT Locationn FROM Gym"; // Replace with your SQL query

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                // Fill the DataTable with data from the database
                adapter.Fill(dataTable);

                // Set the DataSource and DisplayMember properties of the ComboBox
                comboBox4.DataSource = dataTable;
                comboBox4.DisplayMember = "Locationn"; // Display locations in the ComboBox
            }
        }


        private void label2_Click(object sender, EventArgs e)
        {
            this.Close();
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

            string GymLoc = comboBox4.Text;
            string Experience = textBox5.Text;

            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            string query = "EXEC InsertPersonAndTrainer \'" + FName + "\',\'" + LName + "\',\'" + Phone + "\',\'" + DoB + "\'," + Age + ",\'" + Address + "\',\'" + Username + "\',\'" + Password + "\',\'" + GymLoc + "\'," + Experience ;
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

        private void signupTrainer_Load(object sender, EventArgs e)
        {

        }
    }
}
