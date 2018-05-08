using System;
using System.Diagnostics;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;
using System.Net.NetworkInformation; //맥주소
using System.Management;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;
using System.Security;
using System.Security.Cryptography;
using System.Collections;

namespace SmartLock
{
    public partial class Form2 : Form
    {
        public static String User_id; //로그인한 사용자ID
        public static String Mac;
        public static ManualResetEvent _pauseEvent = new ManualResetEvent(false);
        public static Boolean pFlag = true;
        public static DialogResult Answer = DialogResult.No;
        public static string[] P_list;
        
        public Form2(String id, String mac_address)
        {
            User_id = id;
            Mac = mac_address;

            ProcessStartInfo cmd = new ProcessStartInfo();
            Process process = new Process();
            cmd.FileName = @"c:\windows\system32\cmd.exe";
            cmd.WindowStyle = ProcessWindowStyle.Hidden;             // cmd창이 숨겨지도록 하기
            cmd.CreateNoWindow = true;                               // cmd창을 띄우지 안도록 하기

            cmd.UseShellExecute = false;
            cmd.RedirectStandardOutput = true;        // cmd창에서 데이터를 가져오기
            cmd.RedirectStandardInput = true;          // cmd창으로 데이터 보내기
            cmd.RedirectStandardError = true;          // cmd창에서 오류 내용 가져오기

            process.EnableRaisingEvents = false;
            process.StartInfo = cmd;
            process.Start();
            process.StandardInput.Write("%systemroot%\\sysnative\\cmd.exe /c start /B explorer.exe" + Environment.NewLine);
            process.StandardInput.Close();

            InitializeComponent();
        }

        //폼 종료방지
        private void Form_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true;
            return;
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            this.ShowInTaskbar = false;
            this.Visible = false;
            this.notifyIcon1.Visible = true;
            notifyIcon1.Icon = new Icon(@"C:\Program Files (x86)\SmartLock\image.ico");
            notifyIcon1.ContextMenuStrip = contextMenuStrip1;
            _pauseEvent = new ManualResetEvent(true);

            ThreadStart th = new ThreadStart(Check_process);
            Thread t = new Thread(th);
            t.Start();
        }

        //프로세스 감지해서 라이센스 인증확인하고 처리
        public static void Check_process()
        {
            //웹서버에 요청하여 DB 에 있는 통제할 프로그램리스트를 받아옴
            String result_json = null;
            string url = "http://smartlock.cadserv.co.kr/check/all/";
            var httpWebRequest = (HttpWebRequest)WebRequest.Create(url);

            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = "POST";
                request.ContentType = "Application/json";

                //전달 파라메터
                //string postData = "param1=1&param2=2";
                String sendData = "{\"user_id\":\"" + User_id + "\"}";
                //String sendData = "{\"user_id\":\"" + User_id + "\", \"mac\":\"" + Mac + "\"}";

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
                result_json = readerPost.ReadToEnd();
                //복호화 루틴
              //  MessageBox.Show(result_json);

                String cut1 = result_json.Remove(result_json.Length - 2);
               // MessageBox.Show(cut1);
                String cut2 = cut1.ToString().Substring(2);
              //  MessageBox.Show(cut2);

                P_list = cut2.Split(new string[] { "\",\"" }, StringSplitOptions.RemoveEmptyEntries);
               // MessageBox.Show(P_list[0] + "\n" + P_list[1] + "\n" + P_list[2] + "\n" + P_list[3]);
            }

            catch (Exception e2)
            {
                Console.WriteLine(e2.Message);
            }

            while (_pauseEvent.WaitOne())
            {
                String result_json2 = null;
                string url2 = "http://smartlock.cadserv.co.kr/check/"; //가능한 목록만
                var httpWebRequest2 = (HttpWebRequest)WebRequest.Create(url2);

                for (int i = 0; i < P_list.Length; i++)
                {
                    //웹서버에서 통제할 프로그램리스트를 받아옴       
                    Process[] processList = Process.GetProcessesByName(P_list[i]); //해당프로세스가 구동되는지 체크

                    //라이센스 유효한지 확인 (=> 웹에 사용자ID, 프로세스이름, 맥주소 넘기기 => 웹은 DB 에서 해당정보의 라이센스가 발급되어있는지 true/false 리턴)
                    //                                user_id     P_list[i]  ,  mac)
                    if (processList.Length > 0)
                    {
                        try
                        {
                            HttpWebRequest request2 = (HttpWebRequest)WebRequest.Create(url2);
                            request2.Method = "POST";
                            request2.ContentType = "Application/json";

                            //전달 파라메터                     
                            String sendData2 = "{\"user_id\":\"" + User_id + "\", \"mac\":\"" + Mac + "\", \"name\":\"" + P_list[i] + "\"}";


                            byte[] buffer2;
                            buffer2 = Encoding.Default.GetBytes(sendData2);
                            request2.ContentLength = buffer2.Length;

                            Stream sendStream2 = request2.GetRequestStream();
                            sendStream2.Write(buffer2, 0, buffer2.Length);
                            sendStream2.Close();

                            HttpWebResponse response2 = (HttpWebResponse)request2.GetResponse();
                            Stream respPostStream2 = response2.GetResponseStream();
                            StreamReader readerPost2 = new StreamReader(respPostStream2, Encoding.UTF8);

                            //result 는 암호화 데이터
                            result_json2 = readerPost2.ReadToEnd();
                            //복호화 루틴
                           // MessageBox.Show(result_json2);
                        }
                        catch (Exception e2)
                        {
                            Console.WriteLine(e2.Message);
                        }
                        if (result_json2 == "true") // 유효한 라이센스면.
                        {
                            Array.Clear(P_list, i, 1); // 한번 인증된 프로그램은 통제할 리스트에서 제거
                        }
                        else //라이센스가 유효하지 않으면.
                        {
                            processList[0].Kill(); //프로그램 강제종료
                            String P_name = processList[0].ToString();
                            P_name = P_name.Substring(28);
                            P_name = P_name.Trim(new char[] { ')' });
                            //각각의 스레드로 컨트롤 하여 프로그램 각각 제어가능. 
                            new Thread(() =>
                            {
                                Answer = MessageBox.Show(new Form() { TopMost = true }, "사용중인 기기는 " + P_name + " 의 라이센스가 유효하지 않습니다\n\n라이센스 요청을 진행하시겠습니까?", "라이센스 인증 실패",
                 MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                                if (Answer == DialogResult.Yes)
                                {
                                    Process.Start("http://smartlock.cadserv.co.kr/");
                                    Answer = DialogResult.No;
                                }
                            }).Start();
                        }
                    } // if (processList.Length > 0)
                }//for
                Thread.Sleep(500);
            }//while
        }//chProcess()

        //종료버튼
        private void 종료ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.ExitThread();
            Environment.Exit(0);
        }

        //도움말
        private void 도움말ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Process.Start("http://smartlock.cadserv.co.kr/qna");
        }

        private void 연결제어ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //pause
            if (pFlag == true)
            {
                disconnect disc = new disconnect();

                if (disc.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                {
                    _pauseEvent.Reset();
                    pFlag = false;
                    MessageBox.Show("Agent 연결 해제");
                }
            }
            //resume
            /*
            else
            {
                Application.Restart();
            }
           */
            else if (pFlag == false)
            {
                _pauseEvent.Set();
                pFlag = true;
                MessageBox.Show("Agent 연결 성공");
            }
           
        }

        private void 로그아웃ToolStripMenuItem_Click(object sender, EventArgs e)
        {

            this.Visible = false;
            Form1 agent = new Form1(2);
            agent.Owner = this;
            agent.Show();
        }

        private void 정보ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("테스트 버전입니다. \n ver 0.0.0.1");
        }
    }//form
}//namespace