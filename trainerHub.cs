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
    public partial class trainerHub : Form
    {

        string User_ID;
        public trainerHub(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new trainerWorkoutCreate(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new trainerDietCreate(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new trainerFeedbackSend(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new trainerAppointments(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new login()));
            new_thread.Start();
            this.Close();
        }

        private void label7_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new trainerCancelation(User_ID)));
            new_thread.Start();
            this.Close();
           
        }

        private void trainerHub_Load(object sender, EventArgs e)
        {

        }
    }
}
