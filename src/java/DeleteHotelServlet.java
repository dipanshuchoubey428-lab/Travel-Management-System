//import java.io.*;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.WebServlet;
//import java.sql.*;
//
//@WebServlet("/DeleteHotelServlet")
//public class DeleteHotelServlet extends HttpServlet {
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String id = request.getParameter("id");
//        String username = request.getParameter("username");
//        String name = request.getParameter("name");
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection con = DriverManager.getConnection(
//                "jdbc:mysql://localhost:3306/travelmanagementsystem","root","Mysql@1234"
//            );
//
//            PreparedStatement ps = con.prepareStatement(
//                "DELETE FROM bookhotel WHERE id=? AND username=? AND name=? LIMIT 1"
//            );
//
//            ps.setString(1, id);
//            ps.setString(2, username);
//            ps.setString(3, name);
//
//            int i = ps.executeUpdate();
//
//            // 🔥 DEBUG
//            if(i > 0){
//                System.out.println("Delete Success");
//            } else {
//                System.out.println("Delete Failed");
//            }
//
//            response.sendRedirect("viewBookedHotel.jsp");
//
//        } catch(Exception e){
//            e.printStackTrace();
//        }
//    }
//}

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/DeleteHotelServlet")
public class DeleteHotelServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String number = request.getParameter("number");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/travelmanagementsystem","root","Mysql@1234"
            );

            PreparedStatement ps = con.prepareStatement("DELETE FROM bookhotel WHERE id=? AND username=? AND name=? AND number=? LIMIT 1"

            );

            ps.setString(1, id);
            ps.setString(2, username);
            ps.setString(3, name);
            ps.setString(4, number);
            

            ps.executeUpdate();

            response.sendRedirect("viewBookedHotel.jsp");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}