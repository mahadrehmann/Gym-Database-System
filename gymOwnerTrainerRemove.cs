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
    public partial class gymOwnerTrainerRemove : Form
    {
        string User_ID;
        public gymOwnerTrainerRemove(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
            PopulateComboBox();
        }

        private void PopulateComboBox()
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            MessageBox.Show(User_ID);
            string Query = "exec ShowTrainerAtAGym \'" + User_ID + "\';";
            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);

            dataGridView.DataSource = dtbl;
            con.Close();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new gymOwnerHub(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void gymOwnerTrainerRemove_Load(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            string Remove = textBox2.Text;
            if (!string.IsNullOrEmpty(Remove))
            {
                string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
                string query = "Exec CancelStatusByID \'" + Remove + "\'";

                SqlConnection connection = new SqlConnection(connectionString);

                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                command.Dispose();
                connection.Close();
            }
            PopulateComboBox();
        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
