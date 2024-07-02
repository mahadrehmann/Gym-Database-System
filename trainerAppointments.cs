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

namespace Final_DB
{
    public partial class trainerAppointments : Form
    {
        string User_ID;
        public trainerAppointments(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new trainerHub(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void trainerAppointments_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string Query = "EXEC TrainerScheduleApproved \'" + User_ID + "\'";
                SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                dataGridView.DataSource = dtbl;
            }
        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string Query = "EXEC TrainerSchedulePending \'" + User_ID + "\'";
                SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                dataGridView1.DataSource = dtbl;
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            string mem_ID = textBox1.Text;
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";

            SqlConnection connection = new SqlConnection(connectionString);
            string Query = "EXEC ApproveAppointment \'" + mem_ID + "\', \'" + User_ID + "\'";

            connection.Open();
            SqlCommand command = new SqlCommand(Query, connection);
            command.ExecuteNonQuery();
            command.Dispose();
            connection.Close();

            MessageBox.Show("Appointment Approved!");
            
            //using (SqlConnection con = new SqlConnection(connectionString))
            //{
            //    con.Open();
            //    Query = "EXEC TrainerScheduleApproved \'" + User_ID + "\'";
            //    SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
            //    DataTable dtbl = new DataTable();
            //    sqlDa.Fill(dtbl);
            //    dataGridView.DataSource = dtbl;
            //}
            
            //using (SqlConnection con = new SqlConnection(connectionString))
            //{
            //    con.Open();
            //    Query = "EXEC TrainerSchedulePending \'" + User_ID + "\'";
            //    SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
            //    DataTable dtbl = new DataTable();
            //    sqlDa.Fill(dtbl);
            //    dataGridView1.DataSource = dtbl;
            //}
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string mem_ID=textBox1.Text;
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";

            SqlConnection connection = new SqlConnection(connectionString);
            string Query = "EXEC DisapprovAppointment \'" + mem_ID + "\', \'" + User_ID + "\'";

            connection.Open();
            SqlCommand command = new SqlCommand(Query, connection);
            command.ExecuteNonQuery();
            command.Dispose();
            connection.Close();

            MessageBox.Show("Appointment Cancelled!");

            //using (SqlConnection con = new SqlConnection(connectionString))
            //{
            //    con.Open();
            //    Query = "EXEC TrainerScheduleApproved \'" + User_ID + "\'";
            //    SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
            //    DataTable dtbl = new DataTable();
            //    sqlDa.Fill(dtbl);
            //    dataGridView.DataSource = dtbl;
            //}

            //using (SqlConnection con = new SqlConnection(connectionString))
            //{
            //    con.Open();
            //    Query = "EXEC TrainerSchedulePending \'" + User_ID + "\'";
            //    SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
            //    DataTable dtbl = new DataTable();
            //    sqlDa.Fill(dtbl);
            //    dataGridView1.DataSource = dtbl;
            //}
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
