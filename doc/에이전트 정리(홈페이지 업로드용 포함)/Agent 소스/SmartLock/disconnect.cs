using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SmartLock
{
    public partial class disconnect : Bunifu.Framework.UI.BunifuForm
    {
        public disconnect()
        {
            InitializeComponent();
        }

        private void btn_disc_Click(object sender, EventArgs e)
        {
            if (tb_disc.Text == "0000")
            {
                DialogResult = System.Windows.Forms.DialogResult.OK;
            } else
            {
                MessageBox.Show("관리코드가 올바르지 않습니다.");
            }
            
        }
        private void bunifuFlatButton1_Click(object sender, EventArgs e)
        {
            this.Visible = false;
        }

        public string Post_value
        {
            get { return this.tb_disc.Text; }
        }

        private void tb_disc_TextChanged(object sender, EventArgs e)
        {
            tb_disc.MaxLength = 4;
        }

        private void disconnect_Load(object sender, EventArgs e)
        {

        }

 
    }
}
