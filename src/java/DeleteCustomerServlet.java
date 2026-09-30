import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;



@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/travelmanagementsystem", "root", "Mysql@1234");

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM customer WHERE id=?");

            ps.setString(1, id);
            ps.executeUpdate();

            response.sendRedirect("viewCustomer.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}