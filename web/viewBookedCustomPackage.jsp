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

<title>My Custom Package Bookings</title>

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
    width:98%;
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

.pending{
    color:orange;
    font-weight:bold;
}

.approved{
    color:green;
    font-weight:bold;
}

.rejected{
    color:red;
    font-weight:bold;
}

</style>

</head>

<body>

<%@ include file="backButton.jsp" %>

<h2>My Custom Package Bookings</h2>

<a href="dashboard.jsp" class="dashboard">
    Back to Dashboard
</a>

<table>

<tr>
    <th>ID</th>
    <th>Username</th>
    <th>Place</th>
    <th>Hotel</th>
    <th>Cab</th>
    <th>Guide</th>
    <th>Food</th>
    <th>Ticket</th>
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
        "SELECT * FROM bookcustompackage WHERE username=?"
    );

    ps.setString(1, username);

    ResultSet rs = ps.executeQuery();

    while(rs.next()){

        found = true;

        String status = rs.getString("status");

        if(status == null){
            status = "Pending";
        }

%>

<tr>

    <td>
        <%=rs.getString("id")%>
    </td>

    <td>
        <%=rs.getString("username")%>
    </td>

    <td>
        <%=rs.getString("place")%>
    </td>

    <td>
        ?<%=rs.getString("hotel")%>
    </td>

    <td>
        ?<%=rs.getString("cab")%>
    </td>

    <td>
        ?<%=rs.getString("guide")%>
    </td>

    <td>
        ?<%=rs.getString("food")%>
    </td>

    <td>
        ?<%=rs.getString("ticket")%>
    </td>

    <td>
        ?<%=rs.getString("price")%>
    </td>

    <td>

<%

if(status.equalsIgnoreCase("Pending")){

%>

<span class="pending">
    Pending
</span>

<%

}
else if(status.equalsIgnoreCase("Approved")){

%>

<span class="approved">
    Approved
</span>

<%

}
else{

%>

<span class="rejected">
    Rejected
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
   href="rating.jsp?package=<%=rs.getString("place")%>">

    Rate

</a>

<%

}
else{

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

<td colspan="11" class="no-data">

    No Custom Package Booking Found.

</td>

</tr>

<%

    }

    rs.close();
    ps.close();
    con.close();

}
catch(Exception e){

%>

<tr>

<td colspan="11" class="no-data">

    Error: <%=e.getMessage()%>

</td>

</tr>

<%

}

%>

</table>

</body>
</html>