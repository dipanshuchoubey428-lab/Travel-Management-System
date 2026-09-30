<%@ page import="java.sql.*" %>

<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelmanagementsystem","root","Mysql@1234");

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM rating");
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Ratings</title>

    <style>
        body{
            margin:0;
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }

        .container{
            width: 90%;
            margin: 50px auto;
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        h2{
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        table{
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 10px;
        }

        th{
            background: #3498db;
            color: white;
            padding: 12px;
            text-align: center;
        }

        td{
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even){
            background: #f9f9f9;
        }

        tr:hover{
            background: #eaf4ff;
            transition: 0.3s;
        }

        .star{
            color: #f1c40f;
            font-weight: bold;
        }
    </style>
</head>

<body>

     <%@ include file="backButton.jsp" %>
<div class="container">

<h2>All Ratings ?</h2>

<table>
<tr>
    <th>User</th>
    <th>Package</th>
    <th>Rating</th>
    <th>Comment</th>
</tr>

<%
while(rs.next()){
%>

<tr>
    <td><%=rs.getString("username")%></td>
    <td><%=rs.getString("package")%></td>
    <td class="star"><%=rs.getString("rating")%> ?</td>
    <td><%=rs.getString("comment")%></td>
</tr>

<%
}
%>

</table>

</div>

</body>
</html>