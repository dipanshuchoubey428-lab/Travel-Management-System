import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        try {
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/travelmanagementsystem",
                "root",
                "Mysql@1234"
            );

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM bookpackage WHERE id=?"
            );

            ps.setString(1, id);
            ps.executeUpdate();

            response.sendRedirect("viewBookings.jsp");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}