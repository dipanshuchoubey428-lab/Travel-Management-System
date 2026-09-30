import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/VerifyOtpServlet")
public class VerifyOtpServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int userOtp = Integer.parseInt(request.getParameter("userOtp"));
        int sessionOtp = (int) session.getAttribute("otp");

        if(userOtp == sessionOtp){

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/travelmanagementsystem","root","Mysql@1234"
                );

                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO bookpackage VALUES(?,?,?,?,?,?,?,?)"
                );

                ps.setString(1, (String)session.getAttribute("username"));
                ps.setString(2, (String)session.getAttribute("package"));
                ps.setString(3, (String)session.getAttribute("persons"));
                ps.setString(4, (String)session.getAttribute("id"));
                ps.setString(5, (String)session.getAttribute("number"));
                ps.setString(6, (String)session.getAttribute("phone"));
                ps.setString(7, (String)session.getAttribute("price"));
                ps.setString(8, "Pending");

                ps.executeUpdate();

                // Success
                response.sendRedirect("viewBookedPackage.jsp");

            } catch(Exception e){
                response.getWriter().println(e);
            }

        } else {
            response.getWriter().println("❌ Wrong OTP");
        }
    }
}  