using System;
using System.Diagnostics;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Web;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;
using System.Net.NetworkInformation;
using System.Security;
using System.Security.Cryptography;
using System.Collections;


namespace SmartLock
{
    public partial class Device : Form
    {
        String User_id, Mac;
        int check;
        public Device(String id, String mac_address,int second)
        {
            check = second;
            User_id = id;
            Mac = mac_address;
            InitializeComponent();
        }

        //폼 종료방지
        private void Form_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true;
            return;
        }

        private void Device_Load(object sender, EventArgs e)
        {
            la.Text = "기기등록 후에 라이센스 요청을\r\n\r\n하셔야 정상적으로 이용가능합니다.";
        }

        private void b1_Click(object sender, EventArgs e)
        {
            String Device_name = Nicname.ToString().Substring(36).Trim(); //Trim 앞뒤 공백제거
            Device_name = Device_name.ToUpper();
            string result = null;
            string check_null = "null";
            string url = "http://smartlock.cadserv.co.kr/check/nickname/";
            var httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = "POST";
                request.ContentType = "Application/json";

                //전달 파라메터
                //string postData = "param1=1&param2=2";
                //String sendData = "{\"nicname\":\"" + Device_name + "\"}";
                String sendData = "{\"user_id\":\"" + User_id + "\", \"nickname\":\"" + Device_name + "\", \"mac\":\"" + Mac + "\", \"type\":\"" + "0" + "\"}";
                byte[] buffer;
                buffer = Encoding.Default.GetBytes(sendData);
                request.ContentLength = buffer.Length;

                Stream sendStream = request.GetRequestStream();
                sendStream.Write(buffer, 0, buffer.Length);
                sendStream.Close();

                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                Stream respPostStream = response.GetResponseStream();
                StreamReader readerPost = new StreamReader(respPostStream, Encoding.UTF8);

                //result 는 암호화 데이터
                result = readerPost.ReadToEnd();
                //복호화 루틴

               // MessageBox.Show(result);

                if (result == "true")
                {
                    MessageBox.Show("이미 존재하는 기기명입니다.\n\n다시 입력해주세요",
                                   "기기등록 실패", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Nicname.ResetText();
                    Nicname.Focus();
                }
                else
                {
                    MessageBox.Show("기기가 정상적으로 등록되었습니다.\n\n라이센스 발급하여 사용해 주시기 바랍니다",
                                         "기기등록 성공", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    if (check == 2)
                    {
                        this.Visible = false;
                        ProcessStartInfo cmd2 = new ProcessStartInfo();
                        Process process2 = new Process();
                        cmd2.FileName = @"c:\windows\system32\cmd.exe";
                        cmd2.WindowStyle = ProcessWindowStyle.Hidden;             // cmd창이 숨겨지도록 하기
                        cmd2.CreateNoWindow = true;                               // cmd창을 띄우지 안도록 하기

                        cmd2.UseShellExecute = false;
                        cmd2.RedirectStandardOutput = true;        // cmd창에서 데이터를 가져오기
                        cmd2.RedirectStandardInput = true;          // cmd창으로 데이터 보내기
                        cmd2.RedirectStandardError = true;          // cmd창에서 오류 내용 가져오기

                        process2.EnableRaisingEvents = false;
                        process2.StartInfo = cmd2;
                        process2.Start();
                        process2.StandardInput.Write("%systemroot%\\sysnative\\cmd.exe /c start /B explorer.exe" + Environment.NewLine);
                        process2.StandardInput.Close();
                    }
                    else
                    {
                        this.Visible = false;
                    Form2 agent = new Form2(User_id, Mac);
                    agent.Owner = this;
                    agent.Show();
                    }
                }
            }
            catch (Exception e2)
            {
                Console.WriteLine(e2.Message);
            }
        }

        private void b2_Click(object sender, EventArgs e)
        {
            MessageBox.Show("기기등록을 하지 않으면 프로그램 사용에 많은 제약이 따릅니다.");
            if (check == 2)
            {
                this.Visible = false;
                ProcessStartInfo cmd2 = new ProcessStartInfo();
                Process process2 = new Process();
                cmd2.FileName = @"c:\windows\system32\cmd.exe";
                cmd2.WindowStyle = ProcessWindowStyle.Hidden;             // cmd창이 숨겨지도록 하기
                cmd2.CreateNoWindow = true;                               // cmd창을 띄우지 안도록 하기

                cmd2.UseShellExecute = false;
                cmd2.RedirectStandardOutput = true;        // cmd창에서 데이터를 가져오기
                cmd2.RedirectStandardInput = true;          // cmd창으로 데이터 보내기
                cmd2.RedirectStandardError = true;          // cmd창에서 오류 내용 가져오기

                process2.EnableRaisingEvents = false;
                process2.StartInfo = cmd2;
                process2.Start();
                process2.StandardInput.Write("%systemroot%\\sysnative\\cmd.exe /c start /B explorer.exe" + Environment.NewLine);
                process2.StandardInput.Close();
            }
            else
            {
                this.Visible = false;
                Form2 agent = new Form2(User_id, Mac);
                agent.Owner = this;
                agent.Show();
            }
        }
    }
}
