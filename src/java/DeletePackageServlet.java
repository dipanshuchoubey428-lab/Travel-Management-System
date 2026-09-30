import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/DeletePackageServlet")
public class DeletePackageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String number = request.getParameter("number");
        
        String username = request.getParameter("username");
        String packageName = request.getParameter("package");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/travelmanagementsystem","root","Mysql@1234"
            );

           PreparedStatement ps = con.prepareStatement(
    "DELETE FROM bookpackage WHERE id=? AND number=? AND username=? AND package=? LIMIT 1"

            );

            ps.setString(1, id);
ps.setString(2, number);
ps.setString(3, username);
ps.setString(4, packageName);

            int i = ps.executeUpdate();

            System.out.println("Deleted: " + i);

            con.close();

            response.sendRedirect("viewBookedPackage.jsp");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}