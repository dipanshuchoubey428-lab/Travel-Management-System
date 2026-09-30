<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>

<head>

<title>Pending Custom Package Bookings</title>

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


<h2>Pending Custom Package Bookings</h2>


<table>

<tr>

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

try{

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/travelmanagementsystem",
        "root",
        "Mysql@1234"
    );


    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM bookcustompackage WHERE status='Pending'"
    );


    ResultSet rs = ps.executeQuery();


    while(rs.next()){

%>


<tr>

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
<%=rs.getString("status")%>
</td>


<td>

<a class="approve"
href="ApproveCustomPackageServlet?id=<%=rs.getInt("id")%>">

Approve

</a>


&nbsp;


<a class="reject"
href="RejectCustomPackageServlet?id=<%=rs.getInt("id")%>">

Reject

</a>

</td>

</tr>


<%

    }

    con.close();

}
catch(Exception e){

    out.println(e);

}

%>

</table>


</body>

</html>