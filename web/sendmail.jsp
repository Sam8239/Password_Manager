
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
    String result;

    final String to = request.getParameter("email");

    final String subject = "INTRUDER";

    final String messg = "SOMEONE TRIED TO ENTER A WRONG PASSWORD";

    final String from = "coolshubham1999@gmail.com";

    final String pass = "eiiiyjsrlqamokdt";

    String host = "smtp.gmail.com";

    Properties props = new Properties();

    props.put("mail.smtp.host", host);

    props.put("mail.transport.protocol", "smtp");

    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.user", from);

    props.put("mail.password", pass);

    props.put("mail.port", "443");

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });

    try {

        MimeMessage message = new MimeMessage(mailSession);

        message.setFrom(new InternetAddress(from));

        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));

        message.setSubject(subject);

        message.setText(messg);

        Transport.send(message);

        result = "Your mail sent successfully....";

    } catch (MessagingException mex) {

        mex.printStackTrace();

        result = "Error: unable to send mail....";

    }

%>

<html>
    <head>
        <title>Password Manager</title>
    </head>
    <body style="background-color: aqua">
        <h1 style="display:flex;align-items: center;justify-content: center; color: red">Wrong Password, Try Again!</h1>
        <jsp:include page="login.jsp" />  

    </body>
</html>
