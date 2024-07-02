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
    public partial class memberWorkoutHub : Form
    {
        string User_ID;
        public memberWorkoutHub(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberWorkoutCreate(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberWorkoutExixtingPlan(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberTrainingSessionSelection(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberTrainingFeedback(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberReviewSuggestions(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void memberWorkoutHub_Load(object sender, EventArgs e)
        {

        }
    }
}
