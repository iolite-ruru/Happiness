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

      // ���� ���̵�� ȸ�������� �޾ƿ��� ������ �����Ϳ��� email���� ���Ͽ� �������� ������ �������� ������ ����
      /*
       * Member m = new MemberService().memberLogin(memberId); if(m==null ||
       * !m.getEmail().equals(email)) { req.setAttribute("msg",
       * "���̵� �̸��� ������ ���� �ʽ��ϴ�"); req.setAttribute("loc", "/member/searchPw");
       * req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp); return;
       * }
       */
      // mail server ����
      String host = "localhost";
      String user = "ikwmjj@naver.com"; // �ڽ��� ���̹� ����
      String password = "skj020306#-#";// �ڽ��� ���̹� �н�����

      // ���� ���� �ּ�
      String to_email = "s2003@e-mirim.hs.kr";

      // SMTP ���� ������ �����Ѵ�.
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

      // email ����
      try {
         MimeMessage msg = new MimeMessage(session);
         msg.setFrom(new InternetAddress(user, "KH"));
         msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

         // ���� ����
         msg.setSubject("�ȳ��ϼ���, �׽�Ʈ �����Դϴ�.");
         // ���� ����
         msg.setText("�׽�Ʈ �Դϴ�");

         Transport.send(msg);
         System.out.println("�̸��� ����");

      } catch (Exception e) {
         e.printStackTrace();
      }
   }

}