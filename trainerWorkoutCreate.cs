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
    public partial class trainerWorkoutCreate : Form
    {
        string User_ID;
        public trainerWorkoutCreate(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new trainerWorkoutExerciseCreate(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void trainerWorkoutCreate_Load(object sender, EventArgs e)
        {

        }
    }
}
