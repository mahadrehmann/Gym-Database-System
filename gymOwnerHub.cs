using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Final_DB
{
    public partial class gymOwnerHub : Form
    {
        string User_ID;
        public gymOwnerHub(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }


        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new gymOwnerMembers(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new gymOwnerTrainer(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new gymOwnerRequestApporvals(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new login()));
            new_thread.Start();
            this.Close();
        }

        private void label7_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new gymOwnerCancelation(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void gymOwnerHub_Load(object sender, EventArgs e)
        {

        }
    }
}
