namespace SmartLock
{
    partial class Form1
    {
        /// <summary>
        /// 필수 디자이너 변수입니다.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 사용 중인 모든 리소스를 정리합니다.
        /// </summary>
        /// <param name="disposing">관리되는 리소스를 삭제해야 하면 true이고, 그렇지 않으면 false입니다.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form 디자이너에서 생성한 코드

        /// <summary>
        /// 디자이너 지원에 필요한 메서드입니다. 
        /// 이 메서드의 내용을 코드 편집기로 수정하지 마세요.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.pw_tb = new Bunifu.Framework.UI.BunifuMetroTextbox();
            this.id_tb = new Bunifu.Framework.UI.BunifuMetroTextbox();
            this.btn_login = new Bunifu.Framework.UI.BunifuFlatButton();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.label4 = new System.Windows.Forms.Label();
            this.forgot_pw = new Bunifu.Framework.UI.BunifuFlatButton();
            this.sign_up = new Bunifu.Framework.UI.BunifuFlatButton();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.rememCk = new Bunifu.Framework.UI.BunifuCheckbox();
            this.label1 = new Bunifu.Framework.UI.BunifuCustomLabel();
            this.label5 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // pw_tb
            // 
            this.pw_tb.BorderColorFocused = System.Drawing.Color.Blue;
            this.pw_tb.BorderColorIdle = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.pw_tb.BorderColorMouseHover = System.Drawing.Color.Blue;
            this.pw_tb.BorderThickness = 3;
            this.pw_tb.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.pw_tb.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.pw_tb.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.pw_tb.isPassword = true;
            this.pw_tb.Location = new System.Drawing.Point(92, 235);
            this.pw_tb.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.pw_tb.Name = "pw_tb";
            this.pw_tb.Size = new System.Drawing.Size(265, 38);
            this.pw_tb.TabIndex = 2;
            this.pw_tb.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            // 
            // id_tb
            // 
            this.id_tb.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("id_tb.BackgroundImage")));
            this.id_tb.BorderColorFocused = System.Drawing.Color.Blue;
            this.id_tb.BorderColorIdle = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.id_tb.BorderColorMouseHover = System.Drawing.Color.Blue;
            this.id_tb.BorderThickness = 3;
            this.id_tb.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.id_tb.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.id_tb.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.id_tb.isPassword = false;
            this.id_tb.Location = new System.Drawing.Point(92, 176);
            this.id_tb.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.id_tb.Name = "id_tb";
            this.id_tb.Size = new System.Drawing.Size(265, 38);
            this.id_tb.TabIndex = 3;
            this.id_tb.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            // 
            // btn_login
            // 
            this.btn_login.Activecolor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(205)))), ((int)(((byte)(82)))));
            this.btn_login.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(205)))), ((int)(((byte)(82)))));
            this.btn_login.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btn_login.BorderRadius = 7;
            this.btn_login.ButtonText = "Login";
            this.btn_login.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn_login.DisabledColor = System.Drawing.Color.Gray;
            this.btn_login.Font = new System.Drawing.Font("굴림", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_login.Iconcolor = System.Drawing.Color.Transparent;
            this.btn_login.Iconimage = null;
            this.btn_login.Iconimage_right = null;
            this.btn_login.Iconimage_right_Selected = null;
            this.btn_login.Iconimage_Selected = null;
            this.btn_login.IconMarginLeft = 0;
            this.btn_login.IconMarginRight = 0;
            this.btn_login.IconRightVisible = true;
            this.btn_login.IconRightZoom = 0D;
            this.btn_login.IconVisible = true;
            this.btn_login.IconZoom = 90D;
            this.btn_login.IsTab = false;
            this.btn_login.Location = new System.Drawing.Point(282, 314);
            this.btn_login.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.btn_login.Name = "btn_login";
            this.btn_login.Normalcolor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(205)))), ((int)(((byte)(82)))));
            this.btn_login.OnHovercolor = System.Drawing.Color.FromArgb(((int)(((byte)(16)))), ((int)(((byte)(205)))), ((int)(((byte)(82)))));
            this.btn_login.OnHoverTextColor = System.Drawing.Color.White;
            this.btn_login.selected = false;
            this.btn_login.Size = new System.Drawing.Size(80, 34);
            this.btn_login.TabIndex = 4;
            this.btn_login.Text = "Login";
            this.btn_login.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.btn_login.Textcolor = System.Drawing.Color.White;
            this.btn_login.TextFont = new System.Drawing.Font("Consolas", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_login.Click += new System.EventHandler(this.button1_Click);
            // 
            // splitContainer1
            // 
            this.splitContainer1.Location = new System.Drawing.Point(-1, 0);
            this.splitContainer1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(43)))), ((int)(((byte)(50)))), ((int)(((byte)(56)))));
            this.splitContainer1.Panel1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("splitContainer1.Panel1.BackgroundImage")));
            this.splitContainer1.Panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.splitContainer1.Panel1.Controls.Add(this.label4);
            this.splitContainer1.Panel1.Controls.Add(this.forgot_pw);
            this.splitContainer1.Panel1.Controls.Add(this.sign_up);
            this.splitContainer1.Panel1.Controls.Add(this.pictureBox1);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.BackColor = System.Drawing.Color.White;
            this.splitContainer1.Panel2.Controls.Add(this.label7);
            this.splitContainer1.Panel2.Controls.Add(this.label5);
            this.splitContainer1.Panel2.Controls.Add(this.label3);
            this.splitContainer1.Panel2.Controls.Add(this.label2);
            this.splitContainer1.Panel2.Controls.Add(this.rememCk);
            this.splitContainer1.Panel2.Controls.Add(this.label1);
            this.splitContainer1.Panel2.Controls.Add(this.pw_tb);
            this.splitContainer1.Panel2.Controls.Add(this.id_tb);
            this.splitContainer1.Panel2.Controls.Add(this.btn_login);
            this.splitContainer1.Size = new System.Drawing.Size(774, 398);
            this.splitContainer1.SplitterDistance = 350;
            this.splitContainer1.TabIndex = 8;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold);
            this.label4.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(63)))), ((int)(((byte)(63)))), ((int)(((byte)(63)))));
            this.label4.Location = new System.Drawing.Point(11, 18);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(136, 29);
            this.label4.TabIndex = 4;
            this.label4.Text = "SmartLock";
            // 
            // forgot_pw
            // 
            this.forgot_pw.Activecolor = System.Drawing.Color.FromArgb(((int)(((byte)(46)))), ((int)(((byte)(139)))), ((int)(((byte)(87)))));
            this.forgot_pw.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(55)))), ((int)(((byte)(81)))), ((int)(((byte)(103)))));
            this.forgot_pw.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.forgot_pw.BorderRadius = 7;
            this.forgot_pw.ButtonText = "Forgot password";
            this.forgot_pw.Cursor = System.Windows.Forms.Cursors.Hand;
            this.forgot_pw.DisabledColor = System.Drawing.Color.Gray;
            this.forgot_pw.Iconcolor = System.Drawing.Color.Transparent;
            this.forgot_pw.Iconimage = null;
            this.forgot_pw.Iconimage_right = null;
            this.forgot_pw.Iconimage_right_Selected = null;
            this.forgot_pw.Iconimage_Selected = null;
            this.forgot_pw.IconMarginLeft = 0;
            this.forgot_pw.IconMarginRight = 0;
            this.forgot_pw.IconRightVisible = true;
            this.forgot_pw.IconRightZoom = 0D;
            this.forgot_pw.IconVisible = true;
            this.forgot_pw.IconZoom = 90D;
            this.forgot_pw.IsTab = false;
            this.forgot_pw.Location = new System.Drawing.Point(46, 299);
            this.forgot_pw.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.forgot_pw.Name = "forgot_pw";
            this.forgot_pw.Normalcolor = System.Drawing.Color.FromArgb(((int)(((byte)(55)))), ((int)(((byte)(81)))), ((int)(((byte)(103)))));
            this.forgot_pw.OnHovercolor = System.Drawing.Color.FromArgb(((int)(((byte)(36)))), ((int)(((byte)(129)))), ((int)(((byte)(77)))));
            this.forgot_pw.OnHoverTextColor = System.Drawing.Color.White;
            this.forgot_pw.selected = false;
            this.forgot_pw.Size = new System.Drawing.Size(248, 49);
            this.forgot_pw.TabIndex = 2;
            this.forgot_pw.Text = "Forgot password";
            this.forgot_pw.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.forgot_pw.Textcolor = System.Drawing.Color.White;
            this.forgot_pw.TextFont = new System.Drawing.Font("Consolas", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.forgot_pw.Click += new System.EventHandler(this.forgot_pw_Click);
            // 
            // sign_up
            // 
            this.sign_up.AccessibleRole = System.Windows.Forms.AccessibleRole.Window;
            this.sign_up.Activecolor = System.Drawing.Color.FromArgb(((int)(((byte)(46)))), ((int)(((byte)(139)))), ((int)(((byte)(87)))));
            this.sign_up.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(55)))), ((int)(((byte)(81)))), ((int)(((byte)(103)))));
            this.sign_up.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.sign_up.BorderRadius = 7;
            this.sign_up.ButtonText = "Sign Up";
            this.sign_up.Cursor = System.Windows.Forms.Cursors.Hand;
            this.sign_up.DisabledColor = System.Drawing.Color.Gray;
            this.sign_up.ForeColor = System.Drawing.SystemColors.ControlText;
            this.sign_up.Iconcolor = System.Drawing.Color.Transparent;
            this.sign_up.Iconimage = null;
            this.sign_up.Iconimage_right = null;
            this.sign_up.Iconimage_right_Selected = null;
            this.sign_up.Iconimage_Selected = null;
            this.sign_up.IconMarginLeft = 0;
            this.sign_up.IconMarginRight = 0;
            this.sign_up.IconRightVisible = true;
            this.sign_up.IconRightZoom = 0D;
            this.sign_up.IconVisible = true;
            this.sign_up.IconZoom = 90D;
            this.sign_up.IsTab = false;
            this.sign_up.Location = new System.Drawing.Point(46, 234);
            this.sign_up.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.sign_up.Name = "sign_up";
            this.sign_up.Normalcolor = System.Drawing.Color.FromArgb(((int)(((byte)(55)))), ((int)(((byte)(81)))), ((int)(((byte)(103)))));
            this.sign_up.OnHovercolor = System.Drawing.Color.FromArgb(((int)(((byte)(36)))), ((int)(((byte)(129)))), ((int)(((byte)(77)))));
            this.sign_up.OnHoverTextColor = System.Drawing.Color.White;
            this.sign_up.selected = false;
            this.sign_up.Size = new System.Drawing.Size(248, 49);
            this.sign_up.TabIndex = 1;
            this.sign_up.Text = "Sign Up";
            this.sign_up.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.sign_up.Textcolor = System.Drawing.Color.White;
            this.sign_up.TextFont = new System.Drawing.Font("Consolas", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sign_up.Click += new System.EventHandler(this.sign_up_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(0, 17);
            this.pictureBox1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(358, 266);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox1.TabIndex = 3;
            this.pictureBox1.TabStop = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.label3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(63)))), ((int)(((byte)(63)))), ((int)(((byte)(63)))));
            this.label3.Location = new System.Drawing.Point(47, 64);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(246, 16);
            this.label3.TabIndex = 8;
            this.label3.Text = "Application Locking System, SmartLock.";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Consolas", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(47, 286);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(104, 17);
            this.label2.TabIndex = 7;
            this.label2.Text = "Remember me?";
            // 
            // rememCk
            // 
            this.rememCk.AutoSize = true;
            this.rememCk.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(205)))), ((int)(((byte)(117)))));
            this.rememCk.ChechedOffColor = System.Drawing.Color.FromArgb(((int)(((byte)(132)))), ((int)(((byte)(135)))), ((int)(((byte)(140)))));
            this.rememCk.Checked = true;
            this.rememCk.CheckedOnColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(205)))), ((int)(((byte)(117)))));
            this.rememCk.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.rememCk.ForeColor = System.Drawing.Color.White;
            this.rememCk.Location = new System.Drawing.Point(24, 287);
            this.rememCk.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.rememCk.Name = "rememCk";
            this.rememCk.Size = new System.Drawing.Size(20, 20);
            this.rememCk.TabIndex = 6;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(63)))), ((int)(((byte)(63)))), ((int)(((byte)(63)))));
            this.label1.Location = new System.Drawing.Point(20, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(78, 29);
            this.label1.TabIndex = 5;
            this.label1.Text = "Login";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("굴림", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.label5.Location = new System.Drawing.Point(15, 186);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(59, 16);
            this.label5.TabIndex = 9;
            this.label5.Text = "아이디";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("굴림", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.label7.Location = new System.Drawing.Point(9, 246);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(76, 16);
            this.label7.TabIndex = 11;
            this.label7.Text = "비밀번호";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(774, 434);
            this.Controls.Add(this.splitContainer1);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "Form1";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "SmartLock Agent";
            this.TopMost = true;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel1.PerformLayout();
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private Bunifu.Framework.UI.BunifuMetroTextbox pw_tb;
        private Bunifu.Framework.UI.BunifuMetroTextbox id_tb;
        private Bunifu.Framework.UI.BunifuFlatButton btn_login;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private Bunifu.Framework.UI.BunifuCustomLabel label1;
        private Bunifu.Framework.UI.BunifuCheckbox rememCk;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private Bunifu.Framework.UI.BunifuFlatButton sign_up;
        private Bunifu.Framework.UI.BunifuFlatButton forgot_pw;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label5;
    }
}

