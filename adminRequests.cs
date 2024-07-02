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
    public partial class adminRequests : Form
    {
        public adminRequests()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new adminHub()));
            new_thread.Start();
            this.Close();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            string mem_ID = textBox1.Text;
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";

            SqlConnection connection = new SqlConnection(connectionString);
            string Query = "EXEC DisApproveGym \'" + mem_ID + "\'";

            connection.Open();
            SqlCommand command = new SqlCommand(Query, connection);
            command.ExecuteNonQuery();
            command.Dispose();
            connection.Close();

            MessageBox.Show("Gym Removed!");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string Query = "select P.Person_ID,F_name,L_Name,G.Gym_Name,G.Locationn,P.Age,P.Phone from Owner O join Person P on P.Person_ID=O.Person_ID join Gym G on G.Gym_ID=O.Gym_ID AND P.Statuss=\'Approved\'";
                SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                dataGridView1.DataSource = dtbl;
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void adminRequests_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string Query = "select P.Person_ID,F_name,L_Name,G.Gym_Name,G.Locationn,P.Age,P.Phone from Owner O join Person P on P.Person_ID=O.Person_ID join Gym G on G.Gym_ID=O.Gym_ID AND P.Statuss=\'Pending\'";
                SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                dataGridView2.DataSource = dtbl;
            }
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            string mem_ID = textBox2.Text;
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";

            SqlConnection connection = new SqlConnection(connectionString);
            string Query = "EXEC ApproveGym \'" + mem_ID + "\'";

            connection.Open();
            SqlCommand command = new SqlCommand(Query, connection);
            command.ExecuteNonQuery();
            command.Dispose();
            connection.Close();

            MessageBox.Show("Gym Added!");
        }
    }
}
