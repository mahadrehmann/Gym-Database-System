using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Final_DB
{
    public partial class gymOwnerRequestApporvals : Form
    {

        string User_ID;
        public gymOwnerRequestApporvals(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }

        private void PopulateComboBox()
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string Query = "exec ShowPendingTrainerMember;";
            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);

            dataGridView1.DataSource = dtbl;
            con.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new gymOwnerHub(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void gymOwnerRequestApporvals_Load(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            string approve=textBox1.Text;
            if (!string.IsNullOrEmpty(approve))
            {
                string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
                string query = "Exec ApproveStatusByID \'" + approve +"\'";

                SqlConnection connection = new SqlConnection(connectionString);

                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                command.Dispose();
                connection.Close();
            }
            PopulateComboBox();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            PopulateComboBox();
        }
    }
}
