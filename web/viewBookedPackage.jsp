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
<title>My Package Bookings</title>

<style>

body{
    font-family:Arial,sans-serif;
    background:#f4f4f4;
    margin:0;
    padding:20px;
}

h2{
    text-align:center;
    color:#2c3e50;
}

.dashboard{
    display:block;
    width:180px;
    margin:20px auto;
    text-align:center;
    padding:10px;
    background:#3498db;
    color:white;
    text-decoration:none;
    border-radius:5px;
}

.dashboard:hover{
    background:#21618c;
}

table{
    width:95%;
    margin:20px auto;
    border-collapse:collapse;
    background:white;
    box-shadow:0 5px 15px rgba(0,0,0,.15);
}

th,td{
    border:1px solid #ddd;
    padding:12px;
    text-align:center;
}

th{
    background:#3498db;
    color:white;
}

tr:nth-child(even){
    background:#f9f9f9;
}

tr:hover{
    background:#eef7ff;
}

.rate-btn{
    background:orange;
    color:white;
    padding:7px 12px;
    text-decoration:none;
    border-radius:5px;
}

.rate-btn:hover{
    background:#e67e22;
}

.no-data{
    color:red;
    font-weight:bold;
    text-align:center;
}

</style>

</head>

<body>
    
    <%@ include file="backButton.jsp" %>

<h2>My Package Bookings</h2>

<a href="dashboard.jsp" class="dashboard">
? Back to Dashboard
</a>

<table>

<tr>
<th>Username</th>
<th>Package</th>
<th>Persons</th>
<th>ID</th>
<th>Number</th>
<th>Phone</th>
<th>Price</th>
<th>Status</th>
<th>Action</th>
</tr>

<%

boolean found = false;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/travelmanagementsystem",
"root",
"Mysql@1234"
);

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM bookpackage WHERE username=?"
);

ps.setString(1, username);

ResultSet rs = ps.executeQuery();

while(rs.next()){

found = true;

String status = rs.getString("status");

%>

<tr>

<td><%=rs.getString("username")%></td>

<td><%=rs.getString("package")%></td>

<td><%=rs.getString("persons")%></td>

<td><%=rs.getString("id")%></td>

<td><%=rs.getString("number")%></td>

<td><%=rs.getString("phone")%></td>

<td><%=rs.getString("price")%></td>

<td>

<%

if(status.equalsIgnoreCase("Pending")){

%>

<span style="color:orange;font-weight:bold;">
? Pending
</span>

<%

}else if(status.equalsIgnoreCase("Approved")){

%>

<span style="color:green;font-weight:bold;">
? Approved
</span>

<%

}else{

%>

<span style="color:red;font-weight:bold;">
? Rejected
</span>

<%

}

%>

</td>

<td>

<%

if(status.equalsIgnoreCase("Approved")){

%>

<a class="rate-btn"
href="rating.jsp?package=<%=rs.getString("package")%>">
Rate ?
</a>

<%

}else{

%>

-

<%

}

%>

</td>

</tr>

<%

}

if(!found){

%>

<tr>

<td colspan="9" class="no-data">
No Package Booking Found.
</td>

</tr>

<%

}

con.close();

}catch(Exception e){

%>

<tr>

<td colspan="9" class="no-data">
<%=e.getMessage()%>
</td>

</tr>

<%

}

%>

</table>

</body>
</html>