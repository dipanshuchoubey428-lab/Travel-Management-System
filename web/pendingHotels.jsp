<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Pending Hotel Bookings</title>

<style>

body{
    font-family:Arial;
    background:#f4f4f4;
}

h2{
    text-align:center;
    margin-top:20px;
}

table{
    width:95%;
    margin:20px auto;
    border-collapse:collapse;
    background:white;
}

th,td{
    border:1px solid #ddd;
    padding:10px;
    text-align:center;
}

th{
    background:#007bff;
    color:white;
}

.approve{
    background:green;
    color:white;
    padding:6px 12px;
    text-decoration:none;
    border-radius:5px;
}

.reject{
    background:red;
    color:white;
    padding:6px 12px;
    text-decoration:none;
    border-radius:5px;
}

</style>

</head>

<body>

     <%@ include file="backButton.jsp" %>
<h2>Pending Hotel Bookings</h2>

<table>

<tr>
<th>Username</th>
<th>Hotel</th>
<th>Persons</th>
<th>Days</th>
<th>AC</th>
<th>Food</th>
<th>Price</th>
<th>Status</th>
<th>Action</th>
</tr>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/travelmanagementsystem",
"root",
"Mysql@1234"
);

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM bookhotel WHERE status='Pending'"
);

ResultSet rs=ps.executeQuery();

while(rs.next()){

%>

<tr>

<td><%=rs.getString("username")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("persons")%></td>
<td><%=rs.getString("days")%></td>
<td><%=rs.getString("ac")%></td>
<td><%=rs.getString("food")%></td>
<td><%=rs.getString("price")%></td>
<td><%=rs.getString("status")%></td>

<td>

<a class="approve"
href="ApproveHotelServlet?id=<%=rs.getString("id")%>&username=<%=rs.getString("username")%>">
Approve
</a>

&nbsp;

<a class="reject"
href="RejectHotelServlet?id=<%=rs.getString("id")%>&username=<%=rs.getString("username")%>">
Reject
</a>

</td>

</tr>

<%
}

con.close();

}catch(Exception e){

out.println(e);

}

%>

</table>

</body>
</html>