<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
String username = (String)session.getAttribute("username");

if(username==null){
    response.sendRedirect("login.html");
    return;
}

int totalUsers=0;
int totalPackageBookings=0;
int totalHotelBookings=0;

int pendingPackages=0;
int approvedPackages=0;

int pendingHotels=0;
int approvedHotels=0;

int totalRevenue=0;

int totalRatings=0;
double avgRating=0;

int touristGuideVisits=0;
int foreignVisits=0;
int currencyVisits=0;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/travelmanagementsystem",
"root",
"Mysql@1234"
);

Statement st=con.createStatement();

/* Total Users */
ResultSet rs=st.executeQuery("SELECT COUNT(*) FROM users");
if(rs.next())
totalUsers=rs.getInt(1);

/* Package Bookings */
rs=st.executeQuery("SELECT COUNT(*) FROM bookpackage");
if(rs.next())
totalPackageBookings=rs.getInt(1);

/* Hotel Bookings */
rs=st.executeQuery("SELECT COUNT(*) FROM bookhotel");
if(rs.next())
totalHotelBookings=rs.getInt(1);

/* Pending Packages */
rs=st.executeQuery("SELECT COUNT(*) FROM bookpackage WHERE status='Pending'");
if(rs.next())
pendingPackages=rs.getInt(1);

/* Approved Packages */
rs=st.executeQuery("SELECT COUNT(*) FROM bookpackage WHERE status='Approved'");
if(rs.next())
approvedPackages=rs.getInt(1);

/* Pending Hotels */
rs=st.executeQuery("SELECT COUNT(*) FROM bookhotel WHERE status='Pending'");
if(rs.next())
pendingHotels=rs.getInt(1);

/* Approved Hotels */
rs=st.executeQuery("SELECT COUNT(*) FROM bookhotel WHERE status='Approved'");
if(rs.next())
approvedHotels=rs.getInt(1);

/* Revenue Package */
rs=st.executeQuery("SELECT SUM(CAST(REPLACE(price,'Rs ','') AS SIGNED)) FROM bookpackage");
if(rs.next())
totalRevenue+=rs.getInt(1);

/* Revenue Hotel */
rs=st.executeQuery("SELECT SUM(CAST(REPLACE(price,'Rs ','') AS SIGNED)) FROM bookhotel");
if(rs.next())
totalRevenue+=rs.getInt(1);

/* Ratings */
rs=st.executeQuery("SELECT COUNT(*) FROM rating");
if(rs.next())
totalRatings=rs.getInt(1);

/* Average Rating */
rs=st.executeQuery("SELECT AVG(CAST(LEFT(rating,1) AS DECIMAL(2,1))) FROM rating");
if(rs.next())
avgRating=rs.getDouble(1);

/* Tourist Guide Visits */
rs=st.executeQuery("SELECT COUNT(*) FROM page_visits WHERE page_name='Smart Tourist Guide'");
if(rs.next())
touristGuideVisits=rs.getInt(1);

/* Foreign Tourist Support */
rs=st.executeQuery("SELECT COUNT(*) FROM page_visits WHERE page_name='Foreign Tourist Support'");
if(rs.next())
foreignVisits=rs.getInt(1);

/* Currency Converter */
rs=st.executeQuery("SELECT COUNT(*) FROM page_visits WHERE page_name='Currency Converter'");
if(rs.next())
currencyVisits=rs.getInt(1);

con.close();

}catch(Exception e){
e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Admin Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

body{
margin:0;
font-family:Segoe UI;
background:#f4f6f9;
overflow: hidden;
height: 100vh;
}

.bg{
display:flex;
height: 100vh;
}

.left{
width:260px;
min-height:100vh;
background:#111;
color:white;

position: fixed;
left: 0;
top: 0;
overflow-y: auto;
}

.logo{
text-align:center;
padding:25px;
font-size:25px;
font-weight:bold;
background:#222;
}

.menu{
display:block;
padding:15px 20px;
color:white;
text-decoration:none;
transition:.3s;
}

.menu:hover{
background:#3498db;
}

.right{
flex:1;
padding:25px;

margin-left: 260px;
height: 100vh;
overflow-y: auto;
}

.logout{
float:right;
background:red;
color:white;
padding:10px 18px;
border-radius:20px;
text-decoration:none;
}

.cards{
display:flex;
flex-wrap:wrap;
gap:20px;
margin-top:30px;
}

.card{
background:white;
width:230px;
padding:20px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,.2);
font-size:20px;
font-weight:bold;
text-align:center;
transition:.3s;
}

.card:hover{
transform:translateY(-5px);
}

.chart-box{
margin-top:40px;
background:white;
padding:25px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,.2);
}

</style>

</head>

<body>

<div class="bg">

<div class="left">

<div class="logo">
👑 ADMIN PANEL
</div>

<a class="menu" href="viewCustomer.jsp"><i class="fa fa-users"></i> Users</a>

<a class="menu" href="pendingPackages.jsp"><i class="fa fa-clock"></i> Pending Packages</a>

<a class="menu" href="pendingHotels.jsp"><i class="fa fa-hotel"></i> Pending Hotels</a>

<a class="menu" href="adminBookedPackages.jsp"><i class="fa fa-box"></i> Approved Packages</a>

<a class="menu" href="adminBookedHotels.jsp"><i class="fa fa-hotel"></i> Approved Hotels</a>

<!--<a class="menu" href="viewPayments.jsp"><i class="fa fa-credit-card"></i> Payments</a>-->

<a class="menu" href="customPackageBookings.jsp"><i class="fa fa-suitcase"></i> Custom Package Bookings</a>

</div>

<div class="right">

<a href="logout.jsp" class="logout">Logout</a>

<h1>Welcome Admin 👑</h1>

<h3>Username : <%=username%></h3>
<div class="cards">

<!-- Total Users -->
<div class="card">
👤<br><br>
Total Users
<br><br>
<%=totalUsers%>
</div>

<!-- Package Bookings -->
<div class="card">
📦<br><br>
Package Bookings
<br><br>
<%=totalPackageBookings%>
</div>

<!-- Hotel Bookings -->
<div class="card">
🏨<br><br>
Hotel Bookings
<br><br>
<%=totalHotelBookings%>
</div>

<!-- Revenue -->
<div class="card">
💰<br><br>
Revenue
<br><br>
₹ <%=totalRevenue%>
</div>

<!-- Pending Package -->
<div class="card">
⏳<br><br>
Pending Packages
<br><br>
<%=pendingPackages%>
</div>

<!-- Approved Package -->
<div class="card">
✅<br><br>
Approved Packages
<br><br>
<%=approvedPackages%>
</div>

<!-- Pending Hotel -->
<div class="card">
🏨<br><br>
Pending Hotels
<br><br>
<%=pendingHotels%>
</div>

<!-- Approved Hotel -->
<div class="card">
✔<br><br>
Approved Hotels
<br><br>
<%=approvedHotels%>
</div>

<!-- Ratings -->
<div class="card">
⭐<br><br>
Total Ratings
<br><br>
<%=totalRatings%>
</div>

<!-- Average Rating -->
<div class="card">
🌟<br><br>
Average Rating
<br><br>
<%=String.format("%.1f",avgRating)%>
</div>

<!-- Tourist Guide -->
<div class="card">
🧭<br><br>
Tourist Guide
<br><br>
<%=touristGuideVisits%>
</div>

<!-- Foreign Support -->
<div class="card">
🌍<br><br>
Foreign Support
<br><br>
<%=foreignVisits%>
</div>

<!-- Currency -->
<div class="card">
💱<br><br>
Currency Converter
<br><br>
<%=currencyVisits%>
</div>

</div>

<!-- Charts 

<div class="chart-box">

<h2>System Analytics</h2>

<canvas id="barChart"></canvas>

<br><br>

<canvas id="pieChart"></canvas>

</div> -->

<%-- <script>
    
new Chart(document.getElementById("barChart"),{

type:'bar',

data:{

labels:[
'Users',
'Package',
'Hotel',
'Revenue'
],

datasets:[{

label:'Travel System',

data:[
<%=totalUsers%>,
<%=totalPackageBookings%>,
<%=totalHotelBookings%>,
<%=totalRevenue%>
],

backgroundColor:[
'#3498db',
'#2ecc71',
'#9b59b6',
'#f39c12'
]

}]

}

});
--%>

<%--
new Chart(document.getElementById("pieChart"),{

type:'pie',

data:{

labels:[
'Pending Package',
'Approved Package',
'Pending Hotel',
'Approved Hotel'
],

datasets:[{

data:[
<%=pendingPackages%>,
<%=approvedPackages%>,
<%=pendingHotels%>,
<%=approvedHotels%>
],

backgroundColor:[
'#e74c3c',
'#2ecc71',
'#f39c12',
'#3498db'
]

}]

}

});
--%>

</script>
<hr style="margin:40px 0;">

<h2>Latest Package Bookings</h2>

<table border="1" cellpadding="10" cellspacing="0"
style="width:100%;background:white;border-collapse:collapse;">

<tr style="background:#3498db;color:white;">
<th>Username</th>
<th>Package</th>
<th>Persons</th>
<th>Price</th>
<th>Status</th>
</tr>
<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con2=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/travelmanagementsystem",
"root",
"Mysql@1234"
);

Statement st2=con2.createStatement();

ResultSet rsTable=st2.executeQuery(
"SELECT username,package,persons,price,status FROM bookpackage LIMIT 10"
);

while(rsTable.next()){

%>

<tr>

<td><%=rsTable.getString("username")%></td>

<td><%=rsTable.getString("package")%></td>

<td><%=rsTable.getString("persons")%></td>

<td><%=rsTable.getString("price")%></td>

<td><%=rsTable.getString("status")%></td>

</tr>

<%

}

con2.close();

}catch(Exception e){

out.println(e);

}

%>
</table>

<br><br>

<a href="adminBookedPackages.jsp"
style="
background:#3498db;
color:white;
padding:12px 20px;
text-decoration:none;
border-radius:6px;
font-weight:bold;
">
View All Package Bookings
</a>
<hr style="margin:40px 0;">

<h2>Latest Hotel Bookings</h2>

<table border="1" cellpadding="10" cellspacing="0"
style="width:100%;background:white;border-collapse:collapse;">

<tr style="background:#16a085;color:white;">

<th>Username</th>
<th>Hotel</th>
<th>Persons</th>
<th>Price</th>
<th>Status</th>

</tr>
<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con3=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/travelmanagementsystem",
"root",
"Mysql@1234"
);

Statement st3=con3.createStatement();

ResultSet rsHotel=st3.executeQuery(

"SELECT username,name,persons,price,status FROM bookhotel ORDER BY id DESC LIMIT 10"

);

while(rsHotel.next()){

%>

<tr>

<td><%=rsHotel.getString("username")%></td>

<td><%=rsHotel.getString("name")%></td>

<td><%=rsHotel.getString("persons")%></td>

<td><%=rsHotel.getString("price")%></td>

<td><%=rsHotel.getString("status")%></td>

</tr>

<%

}

rsHotel.close();
st3.close();
con3.close();

}catch(Exception e){

out.println(e);

}

%>
</table>

<br><br>

<a href="adminBookedHotels.jsp"
style="
background:#16a085;
color:white;
padding:12px 20px;
text-decoration:none;
border-radius:6px;
font-weight:bold;
">
View All Hotel Bookings
</a>
<hr style="margin:40px 0;">

<h2>Latest User Ratings</h2>

<table border="1" cellpadding="10" cellspacing="0"
style="width:100%;background:white;border-collapse:collapse;">

<tr style="background:#9b59b6;color:white;">

<th>Username</th>
<th>Package</th>
<th>Rating</th>
<th>Comment</th>

</tr>
<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con4=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/travelmanagementsystem",
"root",
"Mysql@1234"
);

Statement st4=con4.createStatement();

ResultSet rsRating=st4.executeQuery(

"SELECT username,package,rating,comment FROM rating ORDER BY id DESC LIMIT 10"

);

while(rsRating.next()){

%>

<tr>

<td><%=rsRating.getString("username")%></td>

<td><%=rsRating.getString("package")%></td>

<td><%=rsRating.getString("rating")%></td>

<td><%=rsRating.getString("comment")%></td>

</tr>

<%

}

rsRating.close();
st4.close();
con4.close();

}catch(Exception e){

out.println(e);

}

%>

</table>

<br><br>

<a href="viewRatings.jsp"
style="
background:#9b59b6;
color:white;
padding:12px 20px;
text-decoration:none;
border-radius:6px;
font-weight:bold;
">
View All Ratings
</a>
<hr style="margin:40px 0;">

<h2>Latest Registered Users</h2>

<table border="1" cellpadding="10" cellspacing="0"
style="width:100%;background:white;border-collapse:collapse;">

<tr style="background:#2ecc71;color:white;">
    <th>Username</th>
    <th>Email</th>
    <th>Role</th>
</tr>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con5=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/travelmanagementsystem",
"root",
"Mysql@1234"
);

Statement st5=con5.createStatement();

ResultSet rsUser=st5.executeQuery(

"SELECT username,email,role FROM users ORDER BY username LIMIT 10"

);

while(rsUser.next()){

%>

<tr>

<td><%=rsUser.getString("username")%></td>

<td><%=rsUser.getString("email")%></td>

<td><%=rsUser.getString("role")%></td>

</tr>

<%

}

con5.close();

}catch(Exception e){

out.println(e);

}

%>

</table>

<br>

<a href="viewCustomer.jsp"
style="
background:#2ecc71;
color:white;
padding:12px 20px;
text-decoration:none;
border-radius:6px;
font-weight:bold;
">
View All Users
</a>

</div>

</div>

</body>
</html>