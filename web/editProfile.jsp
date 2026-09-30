<%@ page import="java.sql.*" %>

<%
String username = (String)session.getAttribute("username");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/travelmanagementsystem",
"root","Mysql@1234");

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM customer WHERE username=?");

ps.setString(1, username);
ResultSet rs = ps.executeQuery();

String name="", email="", phone="";

if(rs.next()){
    name = rs.getString("name");
    email = rs.getString("email");
    phone = rs.getString("phone");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>

    <style>
        body{
            margin:0;
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #e9f0ff, #f7f9fc);
        }

        .card{
            width: 420px;
            margin: 70px auto;
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.12);
            overflow: hidden;
        }

        .card-header{
            background: #2c3e50;
            color: white;
            padding: 18px;
            text-align: center;
            font-size: 20px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .card-body{
            padding: 25px;
        }

        label{
            font-size: 13px;
            color: #666;
            margin-bottom: 5px;
            display: block;
        }

        input{
            width: 100%;
            padding: 11px 12px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            transition: 0.3s;
            font-size: 14px;
        }

        input:focus{
            border-color: #3498db;
            box-shadow: 0 0 8px rgba(52,152,219,0.25);
        }

        .btn{
            width: 100%;
            padding: 12px;
            background: #3498db;
            border: none;
            color: white;
            font-size: 15px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn:hover{
            background: #1f6fa8;
            transform: translateY(-1px);
        }

        .note{
            text-align:center;
            font-size: 12px;
            color: #888;
            margin-top: 10px;
        }
    </style>
</head>

<body>
    
     <%@ include file="backButton.jsp" %>

<div class="card">

    <div class="card-header">
        ? Edit Profile
    </div>

    <div class="card-body">

        <form action="UpdateCustomerServlet" method="post">

            <input type="hidden" name="username" value="<%=username%>">

            <label>Name</label>
            <input type="text" name="name" value="<%=name%>" required>

            <label>Email</label>
            <input type="email" name="email" value="<%=email%>" required>

            <label>Phone</label>
            <input type="text" name="phone" value="<%=phone%>" required>

            <button class="btn" type="submit">Update Profile</button>

        </form>

        <div class="note">
            Make sure your details are up to date
        </div>

    </div>

</div>

</body>
</html>