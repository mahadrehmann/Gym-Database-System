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
    public partial class trainerWorkoutEquipmentCreate : Form
    {
        string User_ID;
        public trainerWorkoutEquipmentCreate(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new trainerHub(User_ID)));
            new_thread.Start();
            this.Close();
        }

        private void trainerWorkoutEquipmentCreate_Load(object sender, EventArgs e)
        {

        }
    }
}
