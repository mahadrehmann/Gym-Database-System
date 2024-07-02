using System;
using System.Collections;
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

namespace Final_DB
{
    public partial class memberTrainingSessionSelection : Form
    {
        string User_ID;
        public memberTrainingSessionSelection(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string Query = "EXEC MemberAvailableTrainers \'" + User_ID + "\'";
                SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                dataGridView.DataSource = dtbl;
            }
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberHub(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void memberTrainingSessionSelection_Load(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            string trainer_ID = textBox1.Text;
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            
            SqlConnection connection = new SqlConnection(connectionString);
            string Query = "EXEC SetMemberAppointment \'" + User_ID + "\', \'" + trainer_ID +"\'";

            connection.Open();
            SqlCommand command = new SqlCommand(Query, connection);
            command.ExecuteNonQuery();
            command.Dispose();
            connection.Close();

            MessageBox.Show("Appointment Booked!");
        }
    }
}
