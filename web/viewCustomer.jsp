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
    <title>Customer Details</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/viewcus.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.65);
            z-index: -1;
        }

        .container {
            width: 92%;
            margin: 30px auto;
            padding: 20px;
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            border-radius: 12px;
            box-shadow: 0px 0px 20px rgba(0,0,0,0.6);
            color: white;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: white;
            text-shadow: 2px 2px 6px black;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            color: white;
        }

        th {
            background: rgba(24, 90, 157, 0.9);
            padding: 10px;
        }

        td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        tr:hover {
            background-color: rgba(255,255,255,0.15);
        }

    </style>

</head>

<body>

    <%@ include file="backButton.jsp" %>
<div class="container">

<h2>My Profile</h2>

<table>

<tr>
    <th>ID</th>
    <th>Username</th>
    <th>Number</th>
    <th>Name</th>
    <th>Gender</th>
    <th>Country</th>
    <th>Address</th>
    <th>Phone</th>
    <th>Email</th>
</tr>

<%
try{

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/travelmanagementsystem",
        "root",
        "Mysql@1234"
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM customer WHERE username=?"
    );

    ps.setString(1, username);

    ResultSet rs = ps.executeQuery();

    while(rs.next()){
%>

<tr>

<td><%= rs.getString("id") %></td>

<td><%= rs.getString("username") %></td>

<td><%= rs.getString("number") %></td>

<td><%= rs.getString("name") %></td>

<td><%= rs.getString("gender") %></td>

<td><%= rs.getString("country") %></td>

<td><%= rs.getString("address") %></td>

<td><%= rs.getString("phone") %></td>

<td><%= rs.getString("email") %></td>

</tr>

<%
    }

    rs.close();
    ps.close();
    con.close();

}catch(Exception e){
%>

<tr>
<td colspan="9" style="color:red;">
<%= e.getMessage() %>
</td>
</tr>

<%
}
%>

</table>

</div>

</body>
</html>