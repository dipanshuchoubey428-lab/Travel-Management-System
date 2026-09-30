<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Pending Package Requests</title>

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
    margin:30px auto;
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
<h2>Pending Package Requests</h2>

<table>

<tr>

<th>Username</th>
<th>Package</th>
<th>Persons</th>
<th>ID</th>
<th>Phone</th>
<th>Price</th>
<th>Status</th>
<th>Action</th>

</tr>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/travelmanagementsystem",
"root",
"Mysql@1234"
);

Statement st=con.createStatement();

ResultSet rs=
st.executeQuery(
"SELECT * FROM bookpackage WHERE status='Pending'"
);

while(rs.next()){

%>

<tr>

<td><%=rs.getString("username")%></td>

<td><%=rs.getString("package")%></td>

<td><%=rs.getString("persons")%></td>

<td><%=rs.getString("id")%></td>

<td><%=rs.getString("phone")%></td>

<td><%=rs.getString("price")%></td>

<td><%=rs.getString("status")%></td>

<td>

<a class="approve"
href="ApprovePackageServlet?id=<%=rs.getString("id")%>&number=<%=rs.getString("number")%>">

Approve

</a>

&nbsp;

<a class="reject"
href="RejectPackageServlet?id=<%=rs.getString("id")%>&number=<%=rs.getString("number")%>">

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