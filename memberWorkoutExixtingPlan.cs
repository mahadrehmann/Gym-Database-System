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
    public partial class memberWorkoutExixtingPlan : Form
    {
        string User_ID;
        public memberWorkoutExixtingPlan(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
            LoadData();

        }
        private void LoadData()
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            string query1 = "select w.Workout_ID, w.Workout_Name, w.Days, w.Goal, w.Difficulty, w.Exercise_Name, w.Targeted_muscle from Workout w inner join WorkxTrainxMem ON WorkxTrainxMem.Workout_ID= w.Workout_ID where Member_ID= \'" + User_ID + "\'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query1, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                connection.Open();
                adapter.Fill(dataTable);
                connection.Close();

                dataGridView1.DataSource = dataTable;
            }
        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberHub(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void memberWorkoutExixtingPlan_Load(object sender, EventArgs e)
        {

        }
    }
}
