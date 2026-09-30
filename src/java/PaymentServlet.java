import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        HttpSession session = request.getSession();

        String username = (String) session.getAttribute("username");
        String mode = request.getParameter("mode");
        String amount = request.getParameter("amount");

        if(username == null){
            response.sendRedirect("login.html");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/travelmanagementsystem",
                "root",
                "Mysql@1234"
            );

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO payment(username, mode, amount) VALUES(?,?,?)"
            );

            ps.setString(1, username);
            ps.setString(2, mode);
            ps.setString(3, amount);

           ps.executeUpdate();


// Payment complete hone ke baad old booking data clear karo

session.removeAttribute("packageBooked");
session.removeAttribute("packagePrice");
session.removeAttribute("price");

session.removeAttribute("hotelBooked");
session.removeAttribute("hotelPrice");

session.removeAttribute("customPackageBooked");
session.removeAttribute("customPackagePrice");
session.removeAttribute("customPlace");


con.close();

response.sendRedirect("paymentSuccess.jsp");

        } catch(Exception e){
            e.printStackTrace();
            response.getWriter().println("Payment Error: " + e.getMessage());
        }
    }
}