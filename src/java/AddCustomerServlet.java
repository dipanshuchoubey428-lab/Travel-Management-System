import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import dao.Conn;

@WebServlet("/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String idType = request.getParameter("idType");
        String number = request.getParameter("number");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String country = request.getParameter("country");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        try {
            Conn c = new Conn();

            String query = "insert into customer values('"+username+"','"+idType+"','"+number+"','"+name+"','"+gender+"','"+country+"','"+address+"','"+phone+"','"+email+"')";
            
            c.s.executeUpdate(query);

            // 🔥 SESSION UPDATE (AUTO-FILL FIX)
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("id", idType);
            session.setAttribute("number", number);
            session.setAttribute("phone", phone);

            response.sendRedirect("dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}