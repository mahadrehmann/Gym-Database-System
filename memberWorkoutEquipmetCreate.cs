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
    public partial class memberWorkoutEquipmetCreate : Form
    {
        string User_ID;
        public memberWorkoutEquipmetCreate(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }

        private void memberWorkoutEquipmetCreate_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new memberHub(User_ID)));
            new_thread.Start();
            this.Close();
        }
    }
}
