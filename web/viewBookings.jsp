<%@ page import="java.sql.*" %>

<%
String user = (String)session.getAttribute("username");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/travelmanagementsystem",
"root","Mysql@1234");

/* PACKAGE */
PreparedStatement ps1 = con.prepareStatement(
"SELECT * FROM bookpackage WHERE username=?");

ps1.setString(1, user);

ResultSet rs1 = ps1.executeQuery();

/* HOTEL */
PreparedStatement ps2 = con.prepareStatement(
"SELECT * FROM bookhotel WHERE username=?");

ps2.setString(1, user);

ResultSet rs2 = ps2.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>

<title>My Bookings</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    font-family:'Poppins',sans-serif;

    /* FULL BACKGROUND IMAGE */
    background:
    linear-gradient(
        rgba(0,0,0,0.65),
        rgba(0,0,0,0.65)
    ),
    url('images/bookingg.jpg');

    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
    background-attachment:fixed;

    min-height:100vh;

    padding:40px 20px;
}

/* MAIN CONTAINER */
.container{

    width:90%;

    max-width:1200px;

    margin:auto;

    padding:35px;

    border-radius:28px;

    background:
    rgba(255,255,255,0.10);

    backdrop-filter:blur(14px);
    -webkit-backdrop-filter:blur(14px);

    border:
    1px solid rgba(255,255,255,0.15);

    box-shadow:
    0 15px 40px rgba(0,0,0,0.45);
}

/* MAIN HEADING */
h2{

    text-align:center;

    color:white;

    font-size:40px;
    font-weight:700;

    margin-bottom:35px;

    letter-spacing:1px;
}

/* SECTION HEADING */
h3{

    margin-top:35px;

    margin-bottom:18px;

    color:#ecfeff;

    font-size:24px;
    font-weight:600;
}

/* TABLE */
table{

    width:100%;

    border-collapse:collapse;

    overflow:hidden;

    border-radius:18px;

    background:
    rgba(255,255,255,0.08);

    backdrop-filter:blur(10px);

    box-shadow:
    0 10px 25px rgba(0,0,0,0.25);
}

/* TABLE HEADER */
th{

    background:
    linear-gradient(
        135deg,
        #0891b2,
        #0f766e
    );

    color:white;

    padding:16px;

    font-size:15px;
    font-weight:600;

    letter-spacing:0.5px;
}

/* TABLE DATA */
td{

    padding:16px;

    text-align:center;

    color:white;

    border-bottom:
    1px solid rgba(255,255,255,0.08);

    font-size:14px;
}

/* ROW HOVER */
tr:hover{

    background:
    rgba(255,255,255,0.06);
}

/* CANCEL BUTTON */
.cancel-btn{

    display:inline-block;

    padding:10px 18px;

    border-radius:10px;

    text-decoration:none;

    color:white;

    font-size:14px;
    font-weight:500;

    background:
    linear-gradient(
        135deg,
        #ef4444,
        #dc2626
    );

    transition:0.3s;
}

/* BUTTON HOVER */
.cancel-btn:hover{

    transform:translateY(-2px);

    box-shadow:
    0 8px 18px rgba(0,0,0,0.35);
}

/* NO DATA */
.no-data{

    text-align:center;

    color:#d1d5db;

    padding:18px;

    font-size:15px;

    background:
    rgba(255,255,255,0.06);

    border-radius:12px;

    margin-top:10px;
}

/* RESPONSIVE */
@media(max-width:768px){

    .container{
        width:100%;
        padding:20px;
    }

    h2{
        font-size:30px;
    }

    table{
        display:block;
        overflow-x:auto;
    }

    th,td{
        padding:12px;
        font-size:13px;
    }

}

</style>

</head>

<body>
    
    <%@ include file="backButton.jsp" %>

<div class="container">

    <!-- PAGE TITLE -->
    <h2>My Bookings</h2>

    <!-- PACKAGE BOOKINGS -->
    <h3>Package Bookings</h3>

    <table>

        <tr>

            <th>Package</th>

            <th>Price</th>

            <th>Action</th>

        </tr>

<%
boolean hasPackage = false;

while(rs1.next()){

    hasPackage = true;
%>

<tr>

    <td>
        <%=rs1.getString("package")%>
    </td>

    <td>
        ? <%=rs1.getString("price")%>
    </td>

    <td>

        <a class="cancel-btn"
           href="CancelBookingServlet?id=<%=rs1.getString("id")%>&type=package">

           Cancel

        </a>

    </td>

</tr>

<%
}
%>

    </table>

<%
if(!hasPackage){
%>

<p class="no-data">

    No package bookings found

</p>

<%
}
%>

    <!-- HOTEL BOOKINGS -->
    <h3>Hotel Bookings</h3>

    <table>

        <tr>

            <th>Hotel Name</th>

            <th>Price</th>

            <th>Action</th>

        </tr>

<%
boolean hasHotel = false;

while(rs2.next()){

    hasHotel = true;
%>

<tr>

    <td>
        <%=rs2.getString("name")%>
    </td>

    <td>
        ? <%=rs2.getString("price")%>
    </td>

    <td>

        <a class="cancel-btn"
           href="CancelBookingServlet?id=<%=rs2.getString("id")%>&type=hotel">

           Cancel

        </a>

    </td>

</tr>

<%
}
%>

    </table>

<%
if(!hasHotel){
%>

<p class="no-data">

    No hotel bookings found

</p>

<%
}
%>

</div>

</body>
</html>