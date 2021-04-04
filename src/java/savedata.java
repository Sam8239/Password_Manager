
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/savedata"})
public class savedata extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        String userpassword = request.getParameter("userpass");
        String passw = "!@#$%"+password; //Encryption
        String userpassw = "!@#$%"+userpassword; //Encryption
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            String dbURL = "jdbc:derby://localhost:1527/password_manager";
            String user = "root";
            String dbpass = "root";
            Connection conn = DriverManager.getConnection(dbURL, user, dbpass);
            PreparedStatement stat = conn.prepareCall("INSERT INTO ROOT.SAVEDPASSWORD(USERNAME,PASSWORD,NAME,USERPASSWORD) VALUES(?,?,?,?)");
            stat.setString(1, username);
            stat.setString(2, passw);
            stat.setString(3, email);
            stat.setString(4, userpassw);
            int val = stat.executeUpdate();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset=\"utf-8\">");
            out.println("<style>");
            out.println("h3 {");
            out.println("display: flex;");
            out.println("align-items: center;");
            out.println("justify-content: center;");
            out.println("color: red;");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            if (val > 0) {
                out.println("<h3>PASSWORD SAVED SUCESSFULLY!</h3>");
            } else {
                out.println("<h3>TRY AGAIN, SOMETHING WENT WRONG!</h3>");
            }

            request.getRequestDispatcher("index.jsp").include(request, response);
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException | SQLException ex) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
