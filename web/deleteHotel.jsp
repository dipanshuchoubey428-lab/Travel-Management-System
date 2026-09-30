<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelmanagementsystem","root","Mysql@1234");

    PreparedStatement ps = con.prepareStatement("DELETE FROM bookhotel WHERE id=?");
    ps.setString(1, id);

    ps.executeUpdate();

    response.sendRedirect("viewBookedHotel.jsp");

}catch(Exception e){
    out.println(e);
}
%>
