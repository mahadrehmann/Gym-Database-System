using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Final_DB
{
    public partial class TrainerSelection : Form
    {
        string User_ID;
        public TrainerSelection(string User_ID = "")
        {
            InitializeComponent();
            this.User_ID = User_ID;
        }
        private void label2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void TrainerSelection_Load(object sender, EventArgs e)
        {

        }
    }
}
