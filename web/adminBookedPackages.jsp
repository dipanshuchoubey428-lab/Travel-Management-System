<%@ page import="java.sql.*" %>

<%
String username = (String)session.getAttribute("username");

if(username==null){
    response.sendRedirect("login.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Approved Package Bookings</title>

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

.delete-btn{
    background:red;
    color:white;
    padding:7px 12px;
    text-decoration:none;
    border-radius:5px;
}

.delete-btn:hover{
    background:darkred;
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

.no-data{
    color:red;
    text-align:center;
    font-weight:bold;
}

</style>

</head>

<body>

<%@ include file="backButton.jsp" %>

<h2>Approved Package Bookings (Admin)</h2>

<a href="adminDashboard.jsp" class="dashboard">
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

boolean found=false;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/travelmanagementsystem",
"root",
"Mysql@1234"
);

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM bookpackage WHERE status='Approved'"
);

ResultSet rs=ps.executeQuery();

while(rs.next()){

found=true;

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
<span style="color:green;font-weight:bold;">
Approved
</span>
</td>

<td>

<a class="delete-btn"
href="DeletePackageServlet?id=<%=rs.getString("id")%>&number=<%=rs.getString("number")%>&username=<%=rs.getString("username")%>&package=<%=rs.getString("package")%>"
onclick="return confirm('Delete this booking?')">

Delete

</a>

</td>

</tr>

<%

}

if(!found){
%>

<tr>

<td colspan="9" class="no-data">

No Approved Package Found.

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