<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
    String email = request.getParameter("email");
    String userpass = request.getParameter("userpass");
    String encryptedpass = "!@#$%"+userpass;
    String dbURL = "jdbc:derby://localhost:1527/password_manager";
    String user = "root";
    String dbpass = "root";
    int a=0;
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Statement statement = null;
    ResultSet resultSet = null;
%>
<html>
    <head>
        <title>VIEW PASSWORD</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            crossorigin="anonymous"
            />
        <link rel="icon" href="./icon.png" type="image/x-icon">
        <style>
            #savedpassword {
                border-collapse: collapse;
                width: 100%;
                text-align: center;
            }

            #savedpassword td, #savedpassword th {
                border: 1px solid #000;
                padding: 8px;
            }

            #savedpassword th {
                border: 1px solid #fff;
                padding-top: 12px;
                padding-bottom: 12px;
                background-color: #000;
                color: white;
            }
             a{
                text-decoration:none;
                color: black;
                font-weight: bold;
                font-size:20px;
                float: right;
                margin-right: 5%;
                border:2px solid white;
                border-radius:50%;
                padding: 10px;
                color: white;
                background-color: black;
            }
            a:hover{
                color: red;
                border:2px solid red;
            }
            h1{
                font-weight: bold;
                font-size: 50px;
                margin-top:3px;
            }
        </style>
    </head>
    <body style="background-color: aqua">
        <a href="login.jsp">BACK</a>
        <h1 class="text-center font-weight-bold pb-3 mt-4" style="text-align: center;margin-left: 10%;"><span style="color:red;">SAVED</span> PASSWORDS</h1>
        <table id="savedpassword">
            <tr>
                <th>USERNAME</th>
                <th>PASSWORD</th>
            </tr>
            <%
                try {
                    Connection conn = DriverManager.getConnection(dbURL, user, dbpass);
                    statement = conn.createStatement();
                    String sql = "SELECT * FROM ROOT.SAVEDPASSWORD WHERE NAME = '" + email + "' and USERPASSWORD = '" + encryptedpass + "'";
                    resultSet = statement.executeQuery(sql);
                    if (resultSet.next()) {
            %>
            <tr>
                <td><%=resultSet.getString("username")%></td>
                <td><%=resultSet.getString("password").substring(5)%></td> 
            </tr>

            <%
                   }
                    else {
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("sendmail.jsp");

                        requestDispatcher.forward(request, response);
                    } 
                } catch (Exception e) {
                    e.printStackTrace();
                }

            %>
        </table>
    </body>
</html>
