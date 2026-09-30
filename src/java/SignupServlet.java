import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/travelmanagementsystem", "root", "Mysql@1234");

            // ✅ username already exist check
            PreparedStatement check = con.prepareStatement(
                "SELECT * FROM users WHERE username=?");
            check.setString(1, username);

            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                response.getWriter().println("<h3 style='color:red;'>Username already exists!</h3>");
                return;
            }

            // ✅ Insert with role = user
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users (username, email, password, role) VALUES (?,?,?,?)");

            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, "user"); // 🔥 important

            ps.executeUpdate();

            // ✅ Redirect to login
            response.sendRedirect("login.html");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}