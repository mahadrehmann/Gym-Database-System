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
    public partial class trainerWorkoutExerciseCreate : Form
    {
        string User_ID;
        public trainerWorkoutExerciseCreate(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new trainerWorkoutEquipmentCreate(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void trainerWorkoutExerciseCreate_Load(object sender, EventArgs e)
        {

        }
    }
}
