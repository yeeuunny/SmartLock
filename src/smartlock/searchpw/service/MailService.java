package smartlock.searchpw.service;

import java.io.File;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import smartlock.common.CommonDAO;
import smartlock.common.Util;
import smartlock.searchpw.vo.EmailVO;
import smartlock.searchpw.vo.SearchpwVO;

@Service
public class MailService{
	
	@Resource(name="commonDAO")
	private CommonDAO commonDAO;
	
    // org.springframework.mail.javamail.JavaMailSender
	@Resource(name="javaMailSender")
    private JavaMailSender javaMailSender;
 
    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }
    
    // 비밀번호찾기 > 아이디, 이메일 체크
    public boolean checkEmail(EmailVO emailVO) throws Exception {
    	String email = (String) commonDAO.selectOne("user.checkEmail", emailVO );
    	
    	if(email == null){
    		return false;
    	}
    	else{
    		return true;
    	}
    }
    
    //임시 비밀번호로 update
    public void updateRanPassword(String id, String password) throws Exception{    	 
    	 SearchpwVO searchpwVO = new SearchpwVO(id, password);
    	 
    	 commonDAO.update("user.changeRanPassword", searchpwVO);
    }
 
    public boolean send(String subject, String text, String from, String to, String filePath) {
        // javax.mail.internet.MimeMessage
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);
 
            // 첨부 파일 처리
            if (filePath != null) {
                File file = new File(filePath);
                if (file.exists()) {
                    helper.addAttachment(file.getName(), new File(filePath));
                }
            }
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
}
