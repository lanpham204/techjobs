package com.techjobs.utils;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class SendEmailUtil {
    private final JavaMailSender mailSender;
    List<MimeMessage> queue = new ArrayList<>();
    public void sendEmail(String to, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);

        mailSender.send(message);
    }
    public void sendHtmlEmail(String to, String subject, String body) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        message.setFrom(new InternetAddress("phamngoclansr123@gmail.com"));
        message.setRecipients(MimeMessage.RecipientType.TO, to);
        message.setSubject(subject);
        message.setContent(body, "text/html; charset=utf-8");
        queue.add(message);
    }
    @Scheduled(fixedDelay = 5000)
    public void run() {
        int success = 0,error = 0;
        while (!queue.isEmpty()) {
            MimeMessage message = queue.remove(0);
            try {
                mailSender.send(message);
                success++;
            } catch (Exception e) {
                error++;
            }
        }
        System.out.println("Sent "+success+", Erorr: "+error);
    }
}
