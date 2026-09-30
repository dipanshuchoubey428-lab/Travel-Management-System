import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;


@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       String id = request.getParameter("id");
       String username = request.getParameter("username");
       String number = request.getParameter("number");
       String name = request.getParameter("name");
       String gender = request.getParameter("gender");
       String country = request.getParameter("country");
       String address = request.getParameter("address");
       String phone = request.getParameter("phone");
       String email = request.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelmanagementsystem","root","Mysql@1234");

           PreparedStatement ps = con.prepareStatement("UPDATE customer SET username=?, number=?, name=?, gender=?, country=?, address=?, phone=?, email=? WHERE id=?");

         ps.setString(1, username);
         ps.setString(2, number);
         ps.setString(3, name);
         ps.setString(4, gender);
         ps.setString(5, country);
         ps.setString(6, address);
         ps.setString(7, phone);
         ps.setString(8, email);
         ps.setString(9, id);
            ps.executeUpdate();

            response.sendRedirect("viewCustomer.jsp");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
