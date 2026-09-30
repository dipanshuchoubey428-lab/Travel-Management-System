<%@ page import="java.sql.*" %>

<%
String username = request.getParameter("username");
String hotel = request.getParameter("hotel");
String persons = request.getParameter("persons");
String days = request.getParameter("days");
String ac = request.getParameter("ac");
String food = request.getParameter("food");
String id = request.getParameter("id");
String number = request.getParameter("number");
String phone = request.getParameter("phone");
String price = request.getParameter("price");

String message = "";

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/travelmanagementsystem", 
        "root", 
        "Mysql@1234"
    );

    PreparedStatement checkRoom = con.prepareStatement(
        "SELECT available_rooms FROM hotel WHERE name=?"
    );

    checkRoom.setString(1, hotel);

    ResultSet rs = checkRoom.executeQuery();

    if(rs.next() && rs.getInt("available_rooms") > 0){

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO bookhotel(username, name, persons, days, ac, food, id, number, phone, price) VALUES (?,?,?,?,?,?,?,?,?,?)"
        );

        ps.setString(1, username);
        ps.setString(2, hotel);
        ps.setString(3, persons);
        ps.setString(4, days);
        ps.setString(5, ac);
        ps.setString(6, food);
        ps.setString(7, id);
        ps.setString(8, number);
        ps.setString(9, phone);
        ps.setString(10, price);

        int i = ps.executeUpdate();

        if(i > 0){

        session.setAttribute("hotelBooked", "true");
        session.setAttribute("hotelPrice", price);
        
            PreparedStatement ps2 = con.prepareStatement(
                "UPDATE hotel SET available_rooms = available_rooms - 1 WHERE name=? AND available_rooms > 0"
            );

            ps2.setString(1, hotel);
            ps2.executeUpdate();

           message = "? Hotel Booking Submitted. Waiting for Admin Approval.";

        } else {
            message = "? Booking Failed!";
        }

    } else {
        message = "? Room Not Available!";
    }

    con.close();

}catch(Exception e){
    message = "Error: " + e.getMessage();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Booking Status</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right, #36d1dc, #5b86e5);
}

.box {
    width: 400px;
    margin: 100px auto;
    background: white;
    padding: 30px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0px 0px 10px gray;
}

h2 {
    color: #333;
}

a {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    background: #5b86e5;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

a:hover {
    background: #3a6edc;
}
</style>

</head>

<body>
    
     <%@ include file="backButton.jsp" %>

<div class="box">
    <h2><%= message %></h2>

    <a href="bookHotel.jsp">Book Again</a>
    <br><br>

    <a href="viewBookedHotel.jsp">View Booked Hotel</a>
    <br><br>

    <a href="viewHotel.jsp">View Hotel Availability</a>
    <br><br>

    <a href="dashboard.jsp">Go to Dashboard</a>
</div>

</body>
</html>