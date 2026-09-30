<%@ page import="java.sql.*" %>

<%
String username = (String)session.getAttribute("username");

if(username == null){
    response.sendRedirect("login.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Booking History</title>

<style>
body{
    font-family: Arial, sans-serif;
    background: #f4f6f9;
    padding: 30px;
}

h2{
    text-align: center;
    color: #222;
}

h3{
    background: #111;
    color: white;
    padding: 12px;
    border-radius: 5px;
}

table{
    width: 100%;
    border-collapse: collapse;
    background: white;
    margin-bottom: 30px;
}

th{
    background: #3498db;
    color: white;
    padding: 12px;
}

td{
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
}

tr:hover{
    background: #f1f1f1;
}

.summary{
    display: flex;
    gap: 20px;
    margin-bottom: 25px;
}

.card{
    flex: 1;
    background: white;
    padding: 20px;
    text-align: center;
    border-radius: 8px;
    box-shadow: 0 0 8px rgba(0,0,0,0.1);
}

.back{
    display: inline-block;
    padding: 10px 18px;
    background: #111;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}
</style>
</head>

<body>

    <%@ include file="backButton.jsp" %>
<h2>My Booking History</h2>

<%
int packageCount = 0;
int hotelCount = 0;
int customPackageCount = 0;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/travelmanagementsystem",
        "root",
        "Mysql@1234"
    );

    PreparedStatement ps1 = con.prepareStatement(
        "SELECT COUNT(*) FROM bookpackage WHERE username=?"
    );
    ps1.setString(1, username);
    ResultSet countPackage = ps1.executeQuery();

    if(countPackage.next()){
        packageCount = countPackage.getInt(1);
    }

    PreparedStatement ps2 = con.prepareStatement(
        "SELECT COUNT(*) FROM bookhotel WHERE username=?"
    );
    ps2.setString(1, username);
    ResultSet countHotel = ps2.executeQuery();

    if(countHotel.next()){
        hotelCount = countHotel.getInt(1);
    }
    PreparedStatement psCustom = con.prepareStatement(
    "SELECT COUNT(*) FROM bookcustompackage WHERE username=?"
);

psCustom.setString(1, username);

ResultSet countCustom = psCustom.executeQuery();

if(countCustom.next()){
    customPackageCount = countCustom.getInt(1);
}
%>

<div class="summary">
    <div class="card">
        <h1><%= packageCount %></h1>
        <p>Total Package Bookings</p>
    </div>

    <div class="card">
        <h1><%= hotelCount %></h1>
        <p>Total Hotel Bookings</p>
    </div>

    <div class="card">
       <h1><%= packageCount + hotelCount + customPackageCount %></h1>
        <p>Total Bookings</p>
    </div>
</div>

<h3>Package Booking History</h3>

<table>
<tr>
    <th>Package</th>
    <th>Persons</th>
    <th>ID Type</th>
    <th>ID Number</th>
    <th>Phone</th>
    <th>Price</th>
</tr>

<%
    PreparedStatement ps3 = con.prepareStatement(
        "SELECT * FROM bookpackage WHERE username=?"
    );
    ps3.setString(1, username);
    ResultSet rs1 = ps3.executeQuery();

    boolean packageFound = false;

    while(rs1.next()){
        packageFound = true;
%>

<tr>
    <td><%= rs1.getString("package") %></td>
    <td><%= rs1.getString("persons") %></td>
    <td><%= rs1.getString("id") %></td>
    <td><%= rs1.getString("number") %></td>
    <td><%= rs1.getString("phone") %></td>
    <td>?<%= rs1.getString("price") %></td>
</tr>

<%
    }

    if(!packageFound){
%>
<tr>
    <td colspan="6">No package booking found</td>
</tr>
<%
    }
%>

</table>

<h3>Hotel Booking History</h3>

<table>
<tr>
    <th>Hotel Name</th>
    <th>Persons</th>
    <th>Days</th>
    <th>AC</th>
    <th>Food</th>
    <th>ID Type</th>
    <th>ID Number</th>
    <th>Phone</th>
    <th>Price</th>
</tr>

<%
    PreparedStatement ps4 = con.prepareStatement(
        "SELECT * FROM bookhotel WHERE username=?"
    );
    ps4.setString(1, username);
    ResultSet rs2 = ps4.executeQuery();

    boolean hotelFound = false;

    while(rs2.next()){
        hotelFound = true;
%>

<tr>
    <td><%= rs2.getString("name") %></td>
    <td><%= rs2.getString("persons") %></td>
    <td><%= rs2.getString("days") %></td>
    <td><%= rs2.getString("ac") %></td>
    <td><%= rs2.getString("food") %></td>
    <td><%= rs2.getString("id") %></td>
    <td><%= rs2.getString("number") %></td>
    <td><%= rs2.getString("phone") %></td>
    <td>?<%= rs2.getString("price") %></td>
</tr>

<%
    }

    if(!hotelFound){
%>
<tr>
    <td colspan="9">No hotel booking found</td>
</tr>
<%
    }

    con.close();

}catch(Exception e){
    out.println(e);
}
%>

</table>

<h3>Custom Package Booking History</h3>

<table>
<tr>
    <th>Place</th>
    <th>Hotel</th>
    <th>Cab</th>
    <th>Guide</th>
    <th>Food</th>
    <th>Ticket</th>
    <th>Price</th>
    <th>Status</th>
</tr>

<%
   
Connection conCustom = null;
PreparedStatement ps5 = null;
ResultSet rs3 = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    conCustom = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/travelmanagementsystem",
        "root",
        "Mysql@1234"
    );

    ps5 = conCustom.prepareStatement(
        "SELECT * FROM bookcustompackage WHERE username=?"
    );

    ps5.setString(1, username);

    rs3 = ps5.executeQuery();

    boolean customFound = false;

    while(rs3.next()){
        customFound = true;
%>

<tr>
    <td><%= rs3.getString("place") %></td>
    <td>?<%= rs3.getString("hotel") %></td>
    <td>?<%= rs3.getString("cab") %></td>
    <td>?<%= rs3.getString("guide") %></td>
    <td>?<%= rs3.getString("food") %></td>
    <td>?<%= rs3.getString("ticket") %></td>
    <td>?<%= rs3.getString("price") %></td>
    <td><%= rs3.getString("status") %></td>
</tr>

<%
    }

    if(!customFound){
%>

<tr>
    <td colspan="8">No custom package booking found</td>
</tr>

<%
    }

} catch(Exception e) {

    out.println(
        "<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>"
    );

} finally {

    try {
        if(rs3 != null) rs3.close();
        if(ps5 != null) ps5.close();
        if(conCustom != null) conCustom.close();
    } catch(Exception e) {
    }

}
%>


</table>

<a href="dashboard.jsp" class="back">Back to Dashboard</a>

</body>
</html>