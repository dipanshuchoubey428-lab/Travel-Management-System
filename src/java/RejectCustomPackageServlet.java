import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RejectCustomPackageServlet")
public class RejectCustomPackageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/travelmanagementsystem",
                "root",
                "Mysql@1234"
            );

            PreparedStatement ps = con.prepareStatement(
                "UPDATE bookcustompackage SET status='Rejected' WHERE id=?"
            );

            ps.setString(1, id);

            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect("customPackageBookings.jsp");

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Error: " + e.getMessage()
            );
        }
    }
}