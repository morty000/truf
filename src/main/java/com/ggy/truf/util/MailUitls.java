package com.ggy.truf.util;

import com.ggy.truf.common.ServerResponse;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 邮件发送工具类
 */
public class MailUitls {
    /**
     * 发送邮件的方法
     *
     * @param to   :收件人
     * @param code :激活码
     */
    public static ServerResponse<String> sendMail(String to, String code) {
        /**
         * 1.获得一个Session对象.
         * 2.创建一个代表邮件的对象Message.
         * 3.发送邮件Transport
         */
        // 1.获得连接对象
        Properties props = new Properties();
        props.setProperty("mail.host", "localhost");
        Session session = Session.getInstance(props, new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("service@shop.com", "service");
            }

        });
        // 2.创建邮件对象:
        Message message = new MimeMessage(session);
        // 设置发件人:
        try {
            message.setFrom(new InternetAddress("service@shop.com"));
            // 设置收件人:
            message.addRecipient(RecipientType.TO, new InternetAddress(to));
            // 抄送 CC   密送BCC
            // 设置标题
            message.setSubject("来自TRUF网上商城的官方激活邮件");
            // 设置邮件正文:
            message.setContent("<h1>TRUF网上商城官方激活邮件!点下面链接完成激活操作!</h1><h3><a href='http://192.168.159.1:219/user/user_code.do?code=" + code + "'>http://192.168.159.1:219/user/user_code.do?code=" + code + "</a></h3><h1>请在30分钟内进行激活，否则激活链接将失效</h1>", "text/html;charset=UTF-8");
            // 3.发送邮件:
            Transport.send(message);
        } catch (AddressException e) {
            e.printStackTrace();
            return ServerResponse.createByErrorMessage("邮件发送异常");
        } catch (MessagingException e) {
            e.printStackTrace();
            return ServerResponse.createByErrorMessage("邮件发送异常");
        }
        return ServerResponse.createBySuccessMessage("邮件发送成功,请前往邮箱激活");
    }

    /*public static void main(String[] args) {
        sendMail("root@shop.com", "11111111111111");
    }*/
}
