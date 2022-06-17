package email;

import java.util.Random;

import java.util.Properties;

import java.io.IOException;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mail")
public class MailServlet extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String memberId = req.getParameter("memberId");

      // 먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
      /*
       * Member m = new MemberService().memberLogin(memberId); if(m==null ||
       * !m.getEmail().equals(email)) { req.setAttribute("msg",
       * "아이디나 이메일 정보가 맞지 않습니다"); req.setAttribute("loc", "/member/searchPw");
       * req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp); return;
       * }
       */
      // mail server 설정
      String host = "localhost";
      String user = "ikwmjj@naver.com"; // 자신의 네이버 계정
      String password = "skj020306#-#";// 자신의 네이버 패스워드

      // 메일 받을 주소
      String to_email = "s2003@e-mirim.hs.kr";

      // SMTP 서버 정보를 설정한다.
      Properties props = new Properties();
      props.put("mail.smtp.host", "localhost");
      props.put("mail.smtp.port", 25);
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.ssl.enable", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.debug", "true");

      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(user, password);
         }
      });

      // email 전송
      try {
         MimeMessage msg = new MimeMessage(session);
         msg.setFrom(new InternetAddress(user, "KH"));
         msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

         // 메일 제목
         msg.setSubject("안녕하세요, 테스트 내용입니다.");
         // 메일 내용
         msg.setText("테스트 입니다");

         Transport.send(msg);
         System.out.println("이메일 전송");

      } catch (Exception e) {
         e.printStackTrace();
      }
   }

}