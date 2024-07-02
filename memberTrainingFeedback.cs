using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Xml.Linq;

namespace Final_DB
{
    public partial class memberTrainingFeedback : Form
    {
        string User_ID;
        public memberTrainingFeedback(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberHub(User_ID)));
            new_thread.Start();
            this.Close();
        }
        private void button3_Click(object sender, EventArgs e)
        {
            string description = textBox1.Text;
            string rating = textBox2.Text;

            if (!string.IsNullOrEmpty(description) && !string.IsNullOrEmpty(rating))
            {
                string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
                string query = "EXEC InsertFeedBackMember \'" + User_ID + "\', \'" + description + "\' , \'" + rating + "\'";

                SqlConnection connection = new SqlConnection(connectionString);

                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                command.Dispose();
                connection.Close();

                MessageBox.Show("Feedback Given, Thank you!");
            }

        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {
        }
        private void label3_Click(object sender, EventArgs e)
        {
        }
        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
        }
        private void button2_Click(object sender, EventArgs e)
        {

            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string Query = "EXEC DisplayTrainerofMembers \'" + User_ID + "\' ";
                SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                dataGridView.DataSource = dtbl;
            }
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void memberTrainingFeedback_Load(object sender, EventArgs e)
        {

        }
    }
}
