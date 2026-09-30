import java.io.*; 
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;
import dao.Conn;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        try {
            Conn c = new Conn();

            String query = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = c.c.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();

                // ✅ FIXED LINE
                session.setAttribute("username", username);

                String role = rs.getString("role");

                if (role == null || role.trim().equals("")) {
                    role = "user";
                }

                // 👑 ADMIN
                if ("admin".equals(role)) {

                    response.sendRedirect("adminDashboard.jsp");

                } else {

                    // 👤 USER

                    String q2 = "SELECT * FROM customer WHERE username=?";
                    PreparedStatement ps2 = c.c.prepareStatement(q2);
                    ps2.setString(1, username);

                    ResultSet rs2 = ps2.executeQuery();

                    if (rs2.next()) {
                        session.setAttribute("id", rs2.getString("id"));
                        session.setAttribute("number", rs2.getString("number"));
                        session.setAttribute("phone", rs2.getString("phone"));
                    } else {
                        session.setAttribute("id", "");
                        session.setAttribute("number", "");
                        session.setAttribute("phone", "");
                    }

                    response.sendRedirect("dashboard.jsp");
                }

            } else {
                response.sendRedirect("login.html");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}