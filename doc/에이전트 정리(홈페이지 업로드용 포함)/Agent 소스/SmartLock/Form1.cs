using System;
using System.Diagnostics;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using System.Web;
using System.Text;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;
using System.Net.NetworkInformation;
using System.Security;
using System.Security.Cryptography;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using System.Threading;

namespace SmartLock
{
    public partial class Form1 : Bunifu.Framework.UI.BunifuForm
    {
        String Check_null = "null";
        int check;

        public Form1(int second)
        {

            check = second;

            ProcessStartInfo cmd = new ProcessStartInfo();
            Process process = new Process();
            cmd.FileName = @"cmd";
            cmd.WindowStyle = ProcessWindowStyle.Hidden;             // cmd창이 숨겨지도록 하기
            cmd.CreateNoWindow = true;                               // cmd창을 띄우지 안도록 하기
            cmd.UseShellExecute = false;
            cmd.RedirectStandardOutput = true;        // cmd창에서 데이터를 가져오기
            cmd.RedirectStandardInput = true;          // cmd창으로 데이터 보내기
            cmd.RedirectStandardError = true;          // cmd창에서 오류 내용 가져오기

            process.EnableRaisingEvents = false;
            process.StartInfo = cmd;
            process.Start();
            process.StandardInput.Write("taskkill /f /im explorer.exe" + Environment.NewLine);
            //process.StandardInput.Write("reg add HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run /v \"Test\" /t REG_SZ /d C:\\Program Files (x86)\\SmartLock\\SmartLock.exe /f" + Environment.NewLine);
            process.StandardInput.Close();

            InitializeComponent();
        }

        [Serializable]
        internal class Person { internal string id; internal string pwd; internal string mac; }

        //폼 종료방지
        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true;
            return;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            Check_Login(); //웹서버 접속 가능하면 이것부터. 
            //Check_Device();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.Visible = true;
        }

        private void Check_Login()
        {
            Person p = new Person();
            p.id = id_tb.Text.ToString();
            p.pwd = pw_tb.Text.ToString();
            p.mac = NetworkInterface.GetAllNetworkInterfaces()[0].GetPhysicalAddress().ToString();

            if(p.id =="exit"&&p.pwd =="exit") // 테스트로 종료하기 위해.
            {
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

                Thread.Sleep(500);
                Application.ExitThread();
                Environment.Exit(0);
            }
            string result = null;
            string url = "http://smartlock.cadserv.co.kr/login/";

            var httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = "POST";
                request.ContentType = "Application/json";

                //전달 파라메터
                //string postData = "param1=1&param2=2";
                String sendData = "{\"id\":\"" + p.id + "\", \"pwd\":\"" + p.pwd + "\"}";

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
              //  MessageBox.Show(result);
           /* 암복호화 구현.
                RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();
                // 개인키 생성 
                RSAParameters privateKey = RSA.Create().ExportParameters(true);
                rsa.ImportParameters(privateKey);
                string privateKeyText = rsa.ToXmlString(true);
                // 공개키 생성 
                RSAParameters publicKey = new RSAParameters();
                publicKey.Modulus = privateKey.Modulus;
                publicKey.Exponent = privateKey.Exponent;
                rsa.ImportParameters(publicKey);
                string publicKeyText = rsa.ToXmlString(false);

                MessageBox.Show(privateKeyText);
                MessageBox.Show(publicKeyText);
                // RSA 암호화 
                String en = RSAEncrypt(result, publicKeyText);
                MessageBox.Show(en);
                String de = RSADecrypt(en, privateKeyText);
                MessageBox.Show(de);
             */
            if (result.ToString().Substring(27, 4) == Check_null.ToString())
                {
                    MessageBox.Show("아이디, 비밀번호를 확인해주세요.");
                    pw_tb.ResetText();
                    pw_tb.Focus();
                }
                //한번더 결과값에서 ID 추출하여 비교하여 확인.
                JObject j = JObject.Parse(result);
                JObject user_data = (JObject)j["data"];
                String web_id = (String)user_data["id"];
                if (web_id == p.id) //맞다면 기기등록 여부 확인
                {
                    Check_Device();
                }
            }
            catch (Exception e2)
            {
                Console.WriteLine(e2.Message);
            }

        }

        private void Check_Device() {
            Person p = new Person();
            p.id = id_tb.Text.ToString();
            p.pwd = pw_tb.Text.ToString();
            p.mac = NetworkInterface.GetAllNetworkInterfaces()[0].GetPhysicalAddress().ToString();
            //MessageBox.Show(p.mac);
            string result = null;
            string url = "http://smartlock.cadserv.co.kr/check/mac/";
            var httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
            
                        try
                        {
                            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                            request.Method = "POST";
                            request.ContentType = "Application/json";

                            //전달 파라메터
                            String sendData = "{\"mac\":\"" + p.mac + "\", \"user_id\":\"" + p.id + "\"}";

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

                            //기기가 등록되지 않았을경우
                            if (result == "false") // false 로변경
                            {
                                if (MessageBox.Show("해당 기기는 등록되지 않았습니다. \n등록을 해셔야 라이센스 요청을 할 수 있습니다.\n\n기기등록 하시겠습니까?",
                                                                     "등록되지 않은 기기", MessageBoxButtons.YesNo, MessageBoxIcon.Information) == DialogResult.Yes)
                                {
                                    this.Visible = false;
                                    Device device2 = new Device(p.id, p.mac,check);
                                    device2.Owner = this;
                                    device2.Show();
                                }
                                else //등록을 거부할경우
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
                                      Form2 agent = new Form2(p.id, p.mac);
                                      agent.Owner = this;
                                      agent.Show();
                                    }
                              }
                               
                            }
                                else //기기 등록된경우
                                {          
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
                                    Form2 agent = new Form2(p.id, p.mac);
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
        /* 암복호화 구현예정예정.
        private static string RSAEncrypt(string getValue, string pubKey)
        {

            // byte[] keybuf = Convert.FromBase64String(pubKey);
            MessageBox.Show("1");
            //  pubKey = (new UTF8Encoding()).GetString(keybuf);
            MessageBox.Show("2");
            System.Security.Cryptography.RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(); //암호화        
            rsa.FromXmlString(pubKey);
            //암호화할 문자열을 UFT8인코딩 
            byte[] inbuf = (new UTF8Encoding()).GetBytes(getValue);
            //암호화 
            MessageBox.Show("3");
            byte[] encbuf = rsa.Encrypt(inbuf, false);
            //암호화된 문자열 Base64인코딩 
            MessageBox.Show("4");
            return Convert.ToBase64String(encbuf);
        }
        
        // RSA 복호화 
        private static string RSADecrypt(string getValue, string priKey)

        {
            //RSA객체생성 
            System.Security.Cryptography.RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(); //복호화 
            rsa.FromXmlString(priKey);
            //sValue문자열을 바이트배열로 변환 
            byte[] srcbuf = Convert.FromBase64String(getValue);
            //바이트배열 복호화 
            byte[] decbuf = rsa.Decrypt(srcbuf, false);
            //복호화 바이트배열을 문자열로 변환 
            string sDec = (new UTF8Encoding()).GetString(decbuf, 0, decbuf.Length);
            return sDec;
        }
        */

        private void sign_up_Click(object sender, EventArgs e)
        {
            Process.Start("http://smartlock.cadserv.co.kr/signup");
        }

        private void forgot_pw_Click(object sender, EventArgs e)
        {
            Process.Start("http://smartlock.cadserv.co.kr/search_pw");
        }
    }//Form

} //SmartLock