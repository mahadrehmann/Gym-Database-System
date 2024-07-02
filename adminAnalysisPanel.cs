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
using System.Xml.Linq;

namespace Final_DB
{
    public partial class adminAnalysisPanel : Form
    {
        int selectedOption;
        public adminAnalysisPanel()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new adminHub()));
            new_thread.Start();
            this.Close();
        }

        private void label7_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new adminManageGym()));
            new_thread.Start();
            this.Close();
        }
        private void ExecuteQueryPara(string queryName, string arg1 = "", string arg2 = "")
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string Query = "EXEC " + queryName + " \'" + arg1 + " \',\'" + arg2 + "\'";
                SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                dataGridView.DataSource = dtbl;
            }
        }
        private void ExecuteQuery(string queryName)
        {
            string connectionString = "Data Source=DESKTOP-31UM7RA\\SQLEXPRESS;Initial Catalog=GymDatabase;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open(); 
                string Query = "EXEC " + queryName;
                SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                dataGridView.DataSource = dtbl;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string arg1 = textBox1.Text;
            string arg2 = textBox2.Text;

            switch (selectedOption)
            {
                case 1:
                    ExecuteQueryPara("Query1", arg1, arg2);
                    break;
                case 2:
                    ExecuteQueryPara("Query2", arg1, arg2);
                    break;
                case 3:
                    ExecuteQueryPara("Query3", arg1, arg2);
                    break;
                case 4:
                    ExecuteQuery("Query4");
                    break;
                case 5:
                    ExecuteQuery("Query5");
                    break;
                case 6:
                    ExecuteQuery("Query6");
                    break;
                case 7:
                    ExecuteQuery("Query7");
                    break;
                case 8:
                    ExecuteQuery("Query8");
                    break;
                case 9:
                    ExecuteQuery("Query9");
                    break;
                case 10:
                    ExecuteQuery("Query10");
                    break;
                case 11:
                    ExecuteQuery("Query11");
                    break;
                case 12:
                    ExecuteQuery("Query12");
                    break;
                case 13:
                    ExecuteQuery("Query13");
                    break;
                case 14:
                    ExecuteQuery("Query14");
                    break;
                case 15:
                    ExecuteQuery("Query15");
                    break;
                case 16:
                    ExecuteQuery("Query16");
                    break;
                case 17:
                    ExecuteQuery("Query17");
                    break;
                case 18:
                    ExecuteQuery("Query18");
                    break;
                case 19:
                    ExecuteQuery("Query19");
                    break;
                case 20:
                    ExecuteQuery("Query20");
                    break;
                default:
                    MessageBox.Show("Please select a valid option.");
                    break;
            }

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedItem = comboBox2.SelectedItem.ToString();

            string numberString = selectedItem.Split('.')[0]; // Assuming the number is followed by a period

            if (int.TryParse(numberString, out int option))
            {
                selectedOption = option;
            }
            else
            {
                selectedOption = 0;
                MessageBox.Show("Invalid option selected.");
            }
        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
