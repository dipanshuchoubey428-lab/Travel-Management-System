//import java.io.*;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.WebServlet;
//import java.sql.*;
//
//
//@WebServlet("/BookPackageServlet")
//public class BookPackageServlet extends HttpServlet {
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//
//        String username = request.getParameter("username");
//        String pack = request.getParameter("package");
//        String persons = request.getParameter("persons");
//        String id = request.getParameter("id");
//        String number = request.getParameter("number");
//        String phone = request.getParameter("phone");
//        String price = request.getParameter("price");
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelmanagementsystem","root","Mysql@1234");
//
//            Statement st = con.createStatement();
//
//            st.executeUpdate("INSERT INTO bookpackage VALUES('"+username+"','"+pack+"','"+persons+"','"+id+"','"+number+"','"+phone+"','"+price+"')");
//
//            response.sendRedirect("viewBookedPackage.jsp");
//
//        } catch(Exception e){
//            e.printStackTrace();
//        }
//    }
//}

//import java.io.*;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.WebServlet;
//
//@WebServlet("/BookPackageServlet")
//public class BookPackageServlet extends HttpServlet {
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        // 🔹 1. Form data lo
//        String username = request.getParameter("username");
//        String pack = request.getParameter("package");
//        String persons = request.getParameter("persons");
//        String id = request.getParameter("id");
//        String number = request.getParameter("number");
//        String phone = request.getParameter("phone");
//        String price = request.getParameter("price");
//
//        // 🔹 2. Session me store karo (temporary)
//        HttpSession session = request.getSession();
//        session.setAttribute("username", username);
//        session.setAttribute("package", pack);
//        session.setAttribute("persons", persons);
//        session.setAttribute("id", id);
//        session.setAttribute("number", number);
//        session.setAttribute("phone", phone);
//        session.setAttribute("price", price);
//        
//        session.setAttribute("packagePrice", price);
//
//        // 🔹 3. OTP generate karo (4 digit)
//        int otp = (int)(Math.random() * 9000) + 1000;
//        session.setAttribute("otp", otp);
//
//        // 🔹 4. Console me print (demo ke liye)
//        System.out.println("Generated OTP: " + otp);
//
//        // 🔹 5. OTP page pe redirect karo
//        response.sendRedirect("otp.jsp");
//    }
//}




import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/BookPackageServlet")
public class BookPackageServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔹 1. Get form data
        String username = request.getParameter("username");
        String pack = request.getParameter("package");
        String persons = request.getParameter("persons");
        String id = request.getParameter("id");
        String number = request.getParameter("number");
        String phone = request.getParameter("phone");
        String price = request.getParameter("price");

        // 🔥 DEBUG (important)
        System.out.println("BOOKING STARTED");
        System.out.println("USER: " + username);
        System.out.println("PACKAGE: " + pack);
        System.out.println("PRICE: " + price);

        // 🔹 2. Session store
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("package", pack);
        session.setAttribute("persons", persons);
        session.setAttribute("id", id);
        session.setAttribute("number", number);
        session.setAttribute("phone", phone);
        session.setAttribute("price", price);
        session.setAttribute("packagePrice", price);
        session.setAttribute("packageBooked", "true");

        // 🔹 3. OTP generate
        int otp = (int)(Math.random() * 9000) + 1000;
        session.setAttribute("otp", otp);

        System.out.println("Generated OTP: " + otp);

        // 🔹 4. Redirect
        response.sendRedirect("otp.jsp");
    }
}