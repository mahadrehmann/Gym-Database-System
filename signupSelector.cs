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
    public partial class signupSelector : Form
    {
        public signupSelector()
        {
            InitializeComponent();
        }

        private void signuptype_Load(object sender, EventArgs e)
        {
            //this.Close(); 
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new signupMember()));
            new_thread.Start();
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new signupTrainer()));
            new_thread.Start();
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var new_thread = new Thread(() => Application.Run(new signupGymOwner()));
            new_thread.Start();
            this.Close();
        }
    }
}
