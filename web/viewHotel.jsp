<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<title>Luxury Hotels</title>

<meta charset="UTF-8">
<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<link rel="preconnect"
href="https://fonts.googleapis.com">


<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

*{

margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;

}

body{

background:
linear-gradient(
135deg,
#0f172a,
#111827,
#1e293b);

min-height:100vh;

}

/*================ HEADER ================*/

.header{

width:100%;

padding:60px 20px;

text-align:center;

background:
linear-gradient(
135deg,
#0ea5e9,
#2563eb);

box-shadow:
0 10px 35px rgba(0,0,0,.35);

}

.header h1{

font-size:48px;

color:white;

font-weight:700;

letter-spacing:1px;

margin-bottom:12px;

}

.header p{

font-size:18px;

color:#eaf4ff;

}

/*================ GRID ================*/

.gallery{

width:94%;

max-width:1500px;

margin:45px auto;

display:grid;

grid-template-columns:
repeat(auto-fit,minmax(360px,1fr));

gap:35px;

}

/*================ CARD ================*/

.card{

background:
rgba(255,255,255,.08);

backdrop-filter:blur(18px);

border-radius:24px;

overflow:hidden;

transition:.40s;

border:
1px solid rgba(255,255,255,.10);

box-shadow:
0 15px 40px rgba(0,0,0,.35);

}

.card:hover{

transform:
translateY(-10px);

box-shadow:
0 20px 45px rgba(0,0,0,.45);

}

/*================ IMAGE ================*/

.hotel-image{

height:220px;

background:
linear-gradient(
135deg,
#0ea5e9,
#2563eb);

display:flex;

justify-content:center;

align-items:center;

font-size:80px;

color:white;

}

/*================ CONTENT ================*/

.card-content{

padding:25px;

}

.card h3{

font-size:27px;

color:white;

text-align:center;

margin-bottom:20px;

}

.info{

background:
rgba(255,255,255,.06);

padding:13px 16px;

border-radius:12px;

margin-bottom:14px;

font-size:15px;

color:#dbeafe;

display:flex;

align-items:center;

gap:12px;

}

.info i{

color:#38bdf8;

font-size:18px;

min-width:22px;

}

/*================ STATUS ================*/

.available{

margin-top:20px;

background:
linear-gradient(
135deg,
#22c55e,
#16a34a);

padding:14px;

border-radius:12px;

text-align:center;

color:white;

font-weight:600;

}

.full{

margin-top:20px;

background:
linear-gradient(
135deg,
#ef4444,
#b91c1c);

padding:14px;

border-radius:12px;

text-align:center;

color:white;

font-weight:600;

}

/*================ BUTTON ================*/

.back{

margin:50px;

text-align:center;

}

.back button{

padding:15px 35px;

border:none;

border-radius:12px;

cursor:pointer;

font-size:17px;

font-weight:600;

color:white;

background:
linear-gradient(
135deg,
#0ea5e9,
#2563eb);

transition:.35s;

}

.back button:hover{

transform:translateY(-3px);

box-shadow:
0 10px 25px rgba(37,99,235,.45);

}

/*================ MOBILE ================*/

@media(max-width:768px){

.header{

padding:40px 20px;

}

.header h1{

font-size:34px;

}

.gallery{

grid-template-columns:1fr;

width:92%;

}

.hotel-image{

height:180px;

font-size:60px;

}

}

</style>

</head>
<body>

<%@ include file="backButton.jsp" %>

<!-- ================= HEADER ================= -->

<div class="header">

    <h1>
        <i class="fa-solid fa-hotel"></i>
        Luxury Hotel Collection
    </h1>

    <p>
        Discover India's Finest Hotels with Premium Comfort & Hospitality
    </p>

</div>


<!-- ================= HOTEL GALLERY ================= -->

<div class="gallery">

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(

"jdbc:mysql://localhost:3306/travelmanagementsystem",

"root",

"Mysql@1234"

);

PreparedStatement ps=

con.prepareStatement(

"SELECT * FROM hotel"

);

ResultSet rs=

ps.executeQuery();

while(rs.next()){

int rooms=

rs.getInt("available_rooms");

%>


<!-- ================= HOTEL CARD ================= -->

<div class="card">


<div class="hotel-image">

<i class="fa-solid fa-hotel"></i>

</div>


<div class="card-content">


<h3>

<%=rs.getString("name")%>

</h3>


<div class="info">

<i class="fa-solid fa-indian-rupee-sign"></i>

<b>Cost Per Person :</b>

₹ <%=rs.getInt("costperperson")%>

</div>


<div class="info">

<i class="fa-solid fa-snowflake"></i>

<b>AC Room Charge :</b>

₹ <%=rs.getInt("acroom")%>

</div>


<div class="info">

<i class="fa-solid fa-utensils"></i>

<b>Food Charge :</b>

₹ <%=rs.getInt("foodinclude")%>

</div>


<div class="info">

<i class="fa-solid fa-bed"></i>

<b>Available Rooms :</b>

<%=rooms%>

</div>
<!-- ================= HOTEL FEATURES ================= -->

<div class="info">

<i class="fa-solid fa-star"></i>

<b>Hotel Rating :</b>

⭐ 4.8 / 5

</div>

<div class="info">

<i class="fa-solid fa-wifi"></i>

<b>Free WiFi</b>

</div>

<div class="info">

<i class="fa-solid fa-car"></i>

<b>Airport Pickup Available</b>

</div>

<div class="info">

<i class="fa-solid fa-mug-hot"></i>

<b>Complimentary Breakfast</b>

</div>

<div class="info">

<i class="fa-solid fa-dumbbell"></i>

<b>Gym & Fitness Center</b>

</div>

<div class="info">

<i class="fa-solid fa-person-swimming"></i>

<b>Swimming Pool Access</b>

</div>

<div class="info">

<i class="fa-solid fa-spa"></i>

<b>Spa & Wellness</b>

</div>

<%

if(rooms>0){

%>

<div class="available">

<i class="fa-solid fa-circle-check"></i>

Rooms Available

</div>

<%

}else{

%>

<div class="full">

<i class="fa-solid fa-circle-xmark"></i>

No Rooms Available

</div>

<%

}

%>

</div>

</div>

<%

}

rs.close();

ps.close();

con.close();

}catch(Exception e){

out.println(

"<h2 style='color:red;text-align:center;'>"

+e+

"</h2>"

);

}

%>