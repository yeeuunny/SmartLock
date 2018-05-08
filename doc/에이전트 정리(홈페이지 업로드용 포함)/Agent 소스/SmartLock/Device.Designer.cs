namespace SmartLock
{
    partial class Device
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.b1 = new Bunifu.Framework.UI.BunifuFlatButton();
            this.Nicname = new System.Windows.Forms.TextBox();
            this.la2 = new Bunifu.Framework.UI.BunifuCustomLabel();
            this.b2 = new Bunifu.Framework.UI.BunifuFlatButton();
            this.la = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // b1
            // 
            this.b1.Activecolor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(205)))), ((int)(((byte)(82)))));
            this.b1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(205)))), ((int)(((byte)(82)))));
            this.b1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.b1.BorderRadius = 7;
            this.b1.ButtonText = "등록";
            this.b1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.b1.DisabledColor = System.Drawing.Color.Gray;
            this.b1.Font = new System.Drawing.Font("굴림", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.b1.Iconcolor = System.Drawing.Color.Transparent;
            this.b1.Iconimage = null;
            this.b1.Iconimage_right = null;
            this.b1.Iconimage_right_Selected = null;
            this.b1.Iconimage_Selected = null;
            this.b1.IconMarginLeft = 0;
            this.b1.IconMarginRight = 0;
            this.b1.IconRightVisible = true;
            this.b1.IconRightZoom = 0D;
            this.b1.IconVisible = true;
            this.b1.IconZoom = 90D;
            this.b1.IsTab = false;
            this.b1.Location = new System.Drawing.Point(114, 130);
            this.b1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.b1.Name = "b1";
            this.b1.Normalcolor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(205)))), ((int)(((byte)(82)))));
            this.b1.OnHovercolor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(205)))), ((int)(((byte)(82)))));
            this.b1.OnHoverTextColor = System.Drawing.Color.White;
            this.b1.selected = false;
            this.b1.Size = new System.Drawing.Size(66, 25);
            this.b1.TabIndex = 0;
            this.b1.Text = "등록";
            this.b1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.b1.Textcolor = System.Drawing.Color.White;
            this.b1.TextFont = new System.Drawing.Font("바탕체", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.b1.Click += new System.EventHandler(this.b1_Click);
            // 
            // Nicname
            // 
            this.Nicname.BackColor = System.Drawing.Color.White;
            this.Nicname.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.Nicname.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.Nicname.Font = new System.Drawing.Font("굴림", 15F);
            this.Nicname.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.Nicname.Location = new System.Drawing.Point(13, 87);
            this.Nicname.Margin = new System.Windows.Forms.Padding(5, 3, 5, 3);
            this.Nicname.Name = "Nicname";
            this.Nicname.Size = new System.Drawing.Size(234, 30);
            this.Nicname.TabIndex = 1;
            // 
            // la2
            // 
            this.la2.AutoSize = true;
            this.la2.BackColor = System.Drawing.Color.Transparent;
            this.la2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.la2.ForeColor = System.Drawing.Color.Black;
            this.la2.Location = new System.Drawing.Point(11, 61);
            this.la2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.la2.Name = "la2";
            this.la2.Size = new System.Drawing.Size(90, 18);
            this.la2.TabIndex = 2;
            this.la2.Text = "등록할 닉네임";
            // 
            // b2
            // 
            this.b2.Activecolor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(205)))), ((int)(((byte)(82)))));
            this.b2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(205)))), ((int)(((byte)(82)))));
            this.b2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.b2.BorderRadius = 7;
            this.b2.ButtonText = "취소";
            this.b2.Cursor = System.Windows.Forms.Cursors.Hand;
            this.b2.DisabledColor = System.Drawing.Color.Gray;
            this.b2.Font = new System.Drawing.Font("굴림", 9F, System.Drawing.FontStyle.Bold);
            this.b2.Iconcolor = System.Drawing.Color.Transparent;
            this.b2.Iconimage = null;
            this.b2.Iconimage_right = null;
            this.b2.Iconimage_right_Selected = null;
            this.b2.Iconimage_Selected = null;
            this.b2.IconMarginLeft = 0;
            this.b2.IconMarginRight = 0;
            this.b2.IconRightVisible = true;
            this.b2.IconRightZoom = 0D;
            this.b2.IconVisible = true;
            this.b2.IconZoom = 90D;
            this.b2.IsTab = false;
            this.b2.Location = new System.Drawing.Point(186, 130);
            this.b2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.b2.Name = "b2";
            this.b2.Normalcolor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(205)))), ((int)(((byte)(82)))));
            this.b2.OnHovercolor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(205)))), ((int)(((byte)(82)))));
            this.b2.OnHoverTextColor = System.Drawing.Color.White;
            this.b2.selected = false;
            this.b2.Size = new System.Drawing.Size(61, 25);
            this.b2.TabIndex = 3;
            this.b2.Text = "취소";
            this.b2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.b2.Textcolor = System.Drawing.Color.White;
            this.b2.TextFont = new System.Drawing.Font("바탕체", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.b2.Click += new System.EventHandler(this.b2_Click);
            // 
            // la
            // 
            this.la.AutoSize = true;
            this.la.Location = new System.Drawing.Point(31, 9);
            this.la.Name = "la";
            this.la.Size = new System.Drawing.Size(38, 12);
            this.la.TabIndex = 4;
            this.la.Text = "label1";
            // 
            // Device
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(233)))), ((int)(((byte)(233)))), ((int)(((byte)(233)))));
            this.ClientSize = new System.Drawing.Size(273, 170);
            this.Controls.Add(this.la);
            this.Controls.Add(this.b2);
            this.Controls.Add(this.la2);
            this.Controls.Add(this.Nicname);
            this.Controls.Add(this.b1);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "Device";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "New Device ";
            this.TopMost = true;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form_FormClosing);
            this.Load += new System.EventHandler(this.Device_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Bunifu.Framework.UI.BunifuFlatButton b1;
        private Bunifu.Framework.UI.BunifuCustomLabel la2;
        private Bunifu.Framework.UI.BunifuFlatButton b2;
        private System.Windows.Forms.TextBox Nicname;
        private System.Windows.Forms.Label la;
    }
}