<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
String username = (String)session.getAttribute("username");

if(username == null){
    response.sendRedirect("login.html");
    return;
}

// DB Data
String name = "";
String email = "";
String phone = "";

try {
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/travelmanagementsystem","root","Mysql@1234");

    PreparedStatement ps = con.prepareStatement(
        "SELECT name, email, phone FROM customer WHERE username=?");

    ps.setString(1, username);
    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        name = rs.getString("name");
        email = rs.getString("email");
        phone = rs.getString("phone");
    }

} catch(Exception e){
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Profile</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
}

/* HEADER */
.header {
    height: 60px;
    background: rgba(0,0,0,0.9);
    color: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 20px;
}

.logo { font-size: 20px; font-weight: bold; }

.search {
    width: 40%;
    padding: 8px;
    border-radius: 20px;
    border: none;
}

.right-section {
    display: flex;
    align-items: center;
    gap: 15px;
}

/* MAIN */
.main {
    height: calc(100vh - 110px);
    background-image: url("https://images.unsplash.com/photo-1507525428034-b723cf961d3e");
    background-size: cover;
    background-position: center;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* CARD */
.card {
    width: 420px;
    padding: 25px;
    border-radius: 15px;
    backdrop-filter: blur(15px);
    background: rgba(255,255,255,0.15);
    color: white;
    box-shadow: 0 8px 25px rgba(0,0,0,0.4);
    text-align: center;
}

.info {
    text-align: left;
    margin: 10px 0;
    font-size: 16px;
}

/* BUTTONS */
.btn {
    margin: 8px;
    padding: 10px 15px;
    border: none;
    border-radius: 20px;
    background: #3498db;
    color: white;
    cursor: pointer;
    display: inline-block;
    text-decoration: none;
}

.btn:hover {
    background: #2980b9;
}

.btn-danger {
    background: red;
}

.btn-danger:hover {
    background: darkred;
}

/* FOOTER */
.footer {
    height: 50px;
    background: rgba(0,0,0,0.9);
    color: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
}

.social {
    display: flex;
    gap: 10px;
}
</style>

</head>

<body>
    
    <%@ include file="backButton.jsp" %>

<!-- HEADER -->
<div class="header">
    <div class="logo">✈ Travel Management System</div>

    <input type="text" class="search" placeholder="Search...">

    <div class="right-section">
        <span>Admin Panel</span>
        <span><%= username %></span>
        <a href="logout.jsp" style="color:red;">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="card">
        <h2><i class="fa fa-user"></i> User Profile</h2>

        <div class="info">Username: <%= username %></div>
        <div class="info">Name: <%= name %></div>
        <div class="info">Email: <%= email %></div>
        <div class="info">Phone: <%= phone %></div>

        <hr>

        <!-- 🔥 NEW FEATURES BUTTONS -->

        <a href="viewBookings.jsp" class="btn">
            📦 My Bookings
        </a>

<!--        <a href="viewBookedPackage.jsp" class="btn">
            🎟 All Packages
        </a>-->

        <a href="viewRatings.jsp" class="btn">
            ⭐ My Ratings
        </a>

        <a href="editProfile.jsp" class="btn">
            ✏ Edit Profile
        </a>

    </div>

</div>

<!-- FOOTER -->
<div class="footer">
    <div>© 2026 Travel Management System</div>

    <div>Home | About | Contact</div>

    <div class="social">
        <i class="fab fa-instagram"></i>
        <i class="fab fa-facebook"></i>
        <i class="fab fa-linkedin"></i>
    </div>
</div>

</body>
</html>