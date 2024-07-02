﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.LinkLabel;

namespace Final_DB
{
    public partial class memberHub : Form
    {
        string User_ID;
        public memberHub(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberWorkoutHub(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberDietHub(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberTrainingFeedback(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberReviewSuggestions(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new login()));
            new_thread.Start();
            this.Close();
        }

        private void label7_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberCancelation(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void memberHub_Load(object sender, EventArgs e)
        {

        }
    }
}
