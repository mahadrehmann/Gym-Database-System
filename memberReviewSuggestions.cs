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
    public partial class memberReviewSuggestions : Form
    {
        string User_ID;
        public memberReviewSuggestions(string User_ID = "")
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

        private void memberReviewSuggestions_Load(object sender, EventArgs e)
        {

        }
        private void LoadData()
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            string query1 = "select f.Feedback_ID, f.Messagee, f.Rating from Feedback f inner join FeedbackxOwnerxTrainerxMember fx ON fx.Feedback_ID = f.Feedback_ID where f.Given_By = 'Trainer' AND Member_ID = \'" + User_ID + "\'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query1, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                connection.Open();
                adapter.Fill(dataTable);
                connection.Close();

                dataGridView.DataSource = dataTable;
            }
        }
        private void button2_Click(object sender, EventArgs e)
        {
            LoadData();

        }
    }
}
