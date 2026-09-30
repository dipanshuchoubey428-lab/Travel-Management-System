<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Customer</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4b6cb7, #182848);
        }

        .container {
            width: 400px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin: 8px 0 12px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .gender {
            margin-bottom: 15px;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #4b6cb7;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #3a539b;
        }

    </style>
</head>

<body>
    
    <%@ include file="backButton.jsp" %>

<div class="container">

<h2>Update Customer</h2>

<%
String id = request.getParameter("id");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/travelmanagementsystem","root","Mysql@1234");

PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE id=?");
ps.setString(1, id);

ResultSet rs = ps.executeQuery();

if(rs.next()){
%>

<form action="UpdateCustomerServlet" method="post">

<label>ID</label>
<input type="text" name="id" value="<%= rs.getString("id") %>" readonly>

<label>Username</label>
<input type="text" name="username" value="<%= rs.getString("username") %>">

<label>Number</label>
<input type="text" name="number" value="<%= rs.getString("number") %>">

<label>Name</label>
<input type="text" name="name" value="<%= rs.getString("name") %>">

<label>Gender</label>
<div class="gender">
    <input type="radio" name="gender" value="Male"
    <%= rs.getString("gender").equals("Male") ? "checked" : "" %>> Male

    <input type="radio" name="gender" value="Female"
    <%= rs.getString("gender").equals("Female") ? "checked" : "" %>> Female
</div>

<label>Country</label>
<input type="text" name="country" value="<%= rs.getString("country") %>">

<label>Address</label>
<input type="text" name="address" value="<%= rs.getString("address") %>">

<label>Phone</label>
<input type="text" name="phone" value="<%= rs.getString("phone") %>">

<label>Email</label>
<input type="text" name="email" value="<%= rs.getString("email") %>">

<button type="submit">Update Customer</button>

</form>

<%
}
con.close();
%>

</div>

</body>
</html>