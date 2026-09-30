import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RejectPackageServlet")
public class RejectPackageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String number = request.getParameter("number");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/travelmanagementsystem",
                    "root",
                    "Mysql@1234");

            PreparedStatement ps = con.prepareStatement(
                    "UPDATE bookpackage SET status='Rejected' WHERE id=? AND number=?");

            ps.setString(1, id);
            ps.setString(2, number);

            ps.executeUpdate();

            con.close();

            response.sendRedirect("pendingPackages.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}