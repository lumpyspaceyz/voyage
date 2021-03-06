package com.gdu.voyage.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("mss")
@Transactional
public class MailSendService {
    @Autowired
    private JavaMailSenderImpl mailSender;
    
    int size = 0;

    //인증키 생성
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();

        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }
        
        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String memberEmail,String memberId) {
        //6자리 난수 인증번호 생성
        String authKey = getKey(6);
        
        //인증메일 보내기
        MimeMessage mail = mailSender.createMimeMessage();
        String mailContent = "<h1>[이메일 인증]</h1><br><p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"
                            + "<a href='http://3.38.104.8/voyage/signUpConfirm?email=" 
                            + memberEmail + "&memberId=" + memberId
                            + "&authKey=" + authKey + "' target='_blenk'>이메일 인증 확인</a>";

        try {
            mail.setSubject("회원가입 이메일 인증 ", "utf-8");
            mail.setText(mailContent, "utf-8", "html");
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(memberEmail));
            mailSender.send(mail);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
          return authKey;
    }
}