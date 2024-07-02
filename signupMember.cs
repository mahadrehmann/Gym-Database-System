using System;
using System.Collections.Generic;
using System.Collections.Specialized;
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
    

    public partial class signupMember : Form
    {
        public signupMember()
        {
            InitializeComponent();
            
        }
        private void signupMember_Load(object sender, EventArgs e)
        {
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



        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            

            string FName = textBox1.Text;
            string LName = textBox2.Text;
            string Phone = textBox9.Text;
            DateTime DoB = dateTimePicker1.Value;
            string Age = textBox8.Text;
            string Address = textBox9.Text;
            string Username = textBox10.Text;
            string Password = textBox7.Text;
            string GymLoc = comboBox4.Text;
            string Goal = comboBox1.SelectedItem.ToString();
            string Weight = textBox4.Text;
            string Height = textBox3.Text;
            string Subscription = comboBox3.SelectedItem.ToString();
            string Allergens = comboBox5.SelectedItem.ToString();

            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            string query = "EXEC InsertPersonAndMember \'" + FName + "\',\'" + LName + "\',\'" + Phone + "\',\'" + DoB + "\',"+Age+ ",\'" + Address + "\',\'" + Username + "\',\'" + Password + "\',\'" + GymLoc + "\',\'" +Goal+ "\',\'" + Weight + "\',\'" + Height + "\',\'" + Subscription + "\',\'" + Allergens+"\'";
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

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}




