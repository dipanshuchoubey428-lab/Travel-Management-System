import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/RatingServlet")
public class RatingServlet extends HttpServlet {

    // GET request handle
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<h2>RatingServlet is Working...</h2>");
    }

    // POST request handle
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("username");
        String pack = request.getParameter("package");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/travelmanagementsystem",
                    "root",
                    "Mysql@1234"
            );

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO rating(username, package, rating, comment) VALUES(?,?,?,?)"
            );

            ps.setString(1, user);
            ps.setString(2, pack);
            ps.setString(3, rating);
            ps.setString(4, comment);

            ps.executeUpdate();

            response.sendRedirect("dashboard.jsp");

            con.close();

        } catch(Exception e){

            e.printStackTrace();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            out.println("<h2>Error Occurred!</h2>");
            out.println(e.getMessage());
        }
    }
}