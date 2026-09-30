import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ApproveHotelServlet")
public class ApproveHotelServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id").trim();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/travelmanagementsystem",
                    "root",
                    "Mysql@1234"
            );

            PreparedStatement ps = con.prepareStatement(
                    "UPDATE bookhotel SET status='Approved' WHERE id=?"
            );

            ps.setString(1, id);

            int rows = ps.executeUpdate();

            System.out.println("ID = " + id);
            System.out.println("Updated Rows = " + rows);

            ps.close();
            con.close();

            response.sendRedirect("pendingHotels.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}