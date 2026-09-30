import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.Conn;

@WebServlet("/ForgetPasswordServlet")
public class ForgetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username").trim();
        String email = request.getParameter("email").trim();
        String newPassword = request.getParameter("newPassword").trim();
        String confirmPassword = request.getParameter("confirmPassword").trim();

        if (!newPassword.equals(confirmPassword)) {
            response.getWriter().println("Password and Confirm Password do not match.");
            return;
        }

        try {

            Conn c = new Conn();

            String checkQuery = "SELECT * FROM users WHERE username=? AND email=?";
            PreparedStatement ps = c.c.prepareStatement(checkQuery);

            ps.setString(1, username);
            ps.setString(2, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String updateQuery = "UPDATE users SET password=? WHERE username=? AND email=?";
                PreparedStatement ps2 = c.c.prepareStatement(updateQuery);

                ps2.setString(1, newPassword);
                ps2.setString(2, username);
                ps2.setString(3, email);

                int i = ps2.executeUpdate();

                if (i > 0) {
                   response.sendRedirect("login.html?msg=success");
                } else {
                    response.getWriter().println("Password Update Failed.");
                }

            } else {

                response.getWriter().println("Invalid Username or Email.");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}