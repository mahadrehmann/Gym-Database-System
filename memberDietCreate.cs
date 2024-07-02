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
    public partial class memberDietCreate : Form
    {
     

        string User_ID;
        public memberDietCreate(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
            PopulateComboBox();
        }

        private void PopulateComboBox()
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            string query = "Select Diet_Type from Diet group by Diet_Type"; // Replace with your SQL query

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                // Fill the DataTable with data from the database
                adapter.Fill(dataTable);

                // Set the DataSource and DisplayMember properties of the ComboBox
                comboBox1.DataSource = dataTable;
                comboBox1.DisplayMember = "Diet_Type"; // Display locations in the ComboBox
            }
        }
        private void button2_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string Query = "select * from Meal";
            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
            DataTable dtbl=new DataTable();
            sqlDa.Fill(dtbl);
            
            dataGridView.DataSource = dtbl;
            con.Close();
            
            //this.Close();
            MessageBox.Show("Success Operation");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string DietType = comboBox1.Text;
            string BreakFast = textBox1.Text;
            string Lunch = textBox2.Text;
            string Dinner = textBox3.Text;
            MessageBox.Show(User_ID);

            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            string query = "Exec CreateDietPlanMember \'" + BreakFast+"\',\'"+Lunch+"\',\'"+Dinner+"\',\'"+User_ID+"\',\'"+DietType+"\'"; // Replace with your SQL query

            SqlConnection connection = new SqlConnection(connectionString);
            
            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();
            command.Dispose();
            connection.Close();


            var new_thread = new Thread(() => Application.Run(new memberHub(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void checkBox4_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void memberDietCreate_Load(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
