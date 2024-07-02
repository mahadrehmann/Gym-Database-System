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
    public partial class gymOwnerMembers : Form
    {
        string User_ID;
        public gymOwnerMembers(string User_ID = "")
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
            string Query = "exec ShowMembersAtAGym \'"+User_ID+"\';";
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

        private void label7_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new gymOwnerMembersRemove(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void gymOwnerMembers_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }
    }
}
