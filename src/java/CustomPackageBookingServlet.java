import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CustomPackageBookingServlet")
public class CustomPackageBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.html");
            return;
        }

        String place = request.getParameter("place");
        String hotel = request.getParameter("hotel");
        String cab = request.getParameter("cab");
        String guide = request.getParameter("guide");
        String food = request.getParameter("food");
        String ticket = request.getParameter("ticket");
        String price = request.getParameter("price");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/travelmanagementsystem",
                "root",
                "Mysql@1234"
            );

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO bookcustompackage" +
                "(username, place, hotel, cab, guide, food, ticket, price, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'Pending')"
            );

            ps.setString(1, username);
            ps.setString(2, place);
            ps.setString(3, hotel);
            ps.setString(4, cab);
            ps.setString(5, guide);
            ps.setString(6, food);
            ps.setString(7, ticket);
            ps.setString(8, price);

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            if (result > 0) {

                session.setAttribute("customPackagePrice",price);

                session.setAttribute("customPlace",place);
                
                session.setAttribute("customPackageBooked", "true");

                response.sendRedirect("customPackageBookingStatus.jsp");

            } else {

                response.getWriter().println(
                    "Custom Package Booking Failed!"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Error: " + e.getMessage()
            );
        }
    }
}