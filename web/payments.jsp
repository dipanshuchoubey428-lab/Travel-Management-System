<%@ page contentType="text/html; charset=UTF-8" %>

<%
String username = (String) session.getAttribute("username");

if(username == null){
    response.sendRedirect("login.html");
    return;
}


/* =====================================================
   GET BOOKING PRICES FROM SESSION
   ===================================================== */

String packagePrice =
        (String) session.getAttribute("packagePrice");

String hotelPrice =
        (String) session.getAttribute("hotelPrice");

String customPackagePrice =
        (String) session.getAttribute("customPackagePrice");


/* =====================================================
   GET BOOKING STATUS FLAGS
   ===================================================== */

String packageBooked =
        (String) session.getAttribute("packageBooked");

String hotelBooked =
        (String) session.getAttribute("hotelBooked");

String customPackageBooked =
        (String) session.getAttribute("customPackageBooked");


/* =====================================================
   TOTAL CALCULATION
   ===================================================== */

int total = 0;


/* ---------------- PACKAGE ---------------- */

if("true".equals(packageBooked)
        && packagePrice != null
        && !packagePrice.trim().equals("")){

    String cleanPrice =
            packagePrice.replaceAll("[^0-9]", "");

    if(!cleanPrice.equals("")){

        total += Integer.parseInt(cleanPrice);

    }
}


/* ---------------- HOTEL ---------------- */

if("true".equals(hotelBooked)
        && hotelPrice != null
        && !hotelPrice.trim().equals("")){

    String cleanPrice =
            hotelPrice.replaceAll("[^0-9]", "");

    if(!cleanPrice.equals("")){

        total += Integer.parseInt(cleanPrice);

    }
}


/* ---------------- CUSTOM PACKAGE ---------------- */

if("true".equals(customPackageBooked)
        && customPackagePrice != null
        && !customPackagePrice.trim().equals("")){

    String cleanPrice =
            customPackagePrice.replaceAll("[^0-9]", "");

    if(!cleanPrice.equals("")){

        total += Integer.parseInt(cleanPrice);

    }
}

%>


<!DOCTYPE html>

<html>

<head>

<title>Secure Payment</title>


<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


<style>

*{
    box-sizing:border-box;
}


body{

    margin:0;

    font-family:'Segoe UI',sans-serif;

    background:
    linear-gradient(
        rgba(0,0,0,0.65),
        rgba(0,0,0,0.65)
    ),
    url("https://images.unsplash.com/photo-1501785888041-af3ef285b470");

    background-size:cover;

    background-position:center;

    background-repeat:no-repeat;

    min-height:100vh;

}


/* ================= HEADER ================= */

.header{

    height:60px;

    background:rgba(0,0,0,0.90);

    color:white;

    display:flex;

    align-items:center;

    justify-content:space-between;

    padding:0 20px;

}


.logo{

    font-size:20px;

    font-weight:bold;

}


.search{

    width:40%;

    padding:8px;

    border-radius:20px;

    border:none;

    outline:none;

}


.right-section{

    display:flex;

    align-items:center;

    gap:15px;

}


.right-section a{

    color:red;

    text-decoration:none;

    font-weight:bold;

}


/* ================= MAIN ================= */

.main{

    min-height:calc(100vh - 110px);

    display:flex;

    justify-content:center;

    align-items:center;

    padding:30px;

}


/* ================= PAYMENT BOX ================= */

.container{

    width:420px;

    padding:30px;

    border-radius:18px;

    background:
    rgba(255,255,255,0.13);

    backdrop-filter:blur(15px);

    -webkit-backdrop-filter:blur(15px);

    color:white;

    box-shadow:
    0 10px 35px rgba(0,0,0,0.45);

}


.container h2{

    text-align:center;

    margin-bottom:25px;

}


/* ================= LABEL ================= */

label{

    display:block;

    margin-top:15px;

    margin-bottom:6px;

}


/* ================= INPUT ================= */

input,
select{

    width:100%;

    padding:12px;

    border-radius:8px;

    border:none;

    outline:none;

    font-size:15px;

}


input[readonly]{

    background:#f1f1f1;

    color:#222;

}


/* ================= AMOUNT ================= */

.amount-box{

    font-size:20px;

    font-weight:bold;

    color:#0b7a3b;

}


/* ================= BUTTON ================= */

button{

    width:100%;

    padding:13px;

    margin-top:25px;

    background:#3498db;

    border:none;

    color:white;

    border-radius:8px;

    font-size:16px;

    font-weight:bold;

    cursor:pointer;

}


button:hover{

    background:#217dbb;

    transform:translateY(-2px);

}


/* ================= BOOKING SUMMARY ================= */

.summary{

    background:
    rgba(255,255,255,0.10);

    padding:15px;

    border-radius:10px;

    margin-bottom:20px;

}


.summary h3{

    margin-top:0;

}


.summary p{

    margin:8px 0;

}


/* ================= FOOTER ================= */

.footer{

    height:50px;

    background:rgba(0,0,0,0.90);

    color:white;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:0 20px;

}


.social{

    display:flex;

    gap:10px;

}


.fa-instagram{

    color:#E1306C;

}


.fa-facebook{

    color:#1877F2;

}


.fa-linkedin{

    color:#0A66C2;

}


/* ================= MOBILE ================= */

@media(max-width:800px){

    .header{

        flex-direction:column;

        height:auto;

        padding:15px;

        gap:10px;

    }


    .search{

        width:90%;

    }


    .right-section{

        flex-wrap:wrap;

        justify-content:center;

    }


    .container{

        width:100%;

        max-width:420px;

    }


    .footer{

        height:auto;

        padding:15px;

        flex-direction:column;

        gap:10px;

    }

}

</style>

</head>


<body>


<%@ include file="backButton.jsp" %>


<!-- ================= HEADER ================= -->

<div class="header">


    <div class="logo">

        ✈ Travel Management System

    </div>


    <input
        type="text"
        class="search"
        placeholder="Search here..."
    >


    <div class="right-section">

        <i class="fa fa-bell"></i>

        <span>Customer</span>

        <span><%= username %></span>

        <span id="datetime"></span>

        <a href="logout.jsp">

            Logout

        </a>

    </div>


</div>


<!-- ================= MAIN ================= -->

<div class="main">


<div class="container">


<h2>

    🔐 Secure Payment

</h2>


<!-- ================= SUMMARY ================= -->

<div class="summary">

<h3>Booking Summary</h3>


<%

boolean hasBooking = false;


/* PACKAGE */

if("true".equals(packageBooked)
        && packagePrice != null){

    hasBooking = true;

%>

<p>

    📦 <strong>Package:</strong>

    ₹<%= packagePrice.replaceAll("[^0-9]", "") %>

</p>

<%

}


/* HOTEL */

if("true".equals(hotelBooked)
        && hotelPrice != null){

    hasBooking = true;

%>

<p>

    🏨 <strong>Hotel:</strong>

    ₹<%= hotelPrice.replaceAll("[^0-9]", "") %>

</p>

<%

}


/* CUSTOM PACKAGE */

if("true".equals(customPackageBooked)
        && customPackagePrice != null){

    hasBooking = true;

%>

<p>

    ✈ <strong>Custom Package:</strong>

    ₹<%= customPackagePrice.replaceAll("[^0-9]", "") %>

</p>

<%

}


/* NO BOOKING */

if(!hasBooking){

%>

<p style="color:#ffcccb;">

    No booking found for payment.

</p>

<%

}

%>


<hr>


<p style="font-size:20px;">

    <strong>Total Amount:</strong>

    ₹<%= total %>

</p>


</div>


<!-- ================= PAYMENT FORM ================= -->

<form action="PaymentServlet" method="post">


<label>

    Username

</label>


<input
    type="text"
    name="username"
    value="<%= username %>"
    readonly
>


<label>

    Payment Mode

</label>


<select name="mode" required>

    <option value="UPI">

        UPI

    </option>

    <option value="Card">

        Card

    </option>

    <option value="Net Banking">

        Net Banking

    </option>

</select>


<label>

    Amount

</label>


<input
    type="text"
    name="amount"
    value="<%= total %>"
    readonly
    class="amount-box"
>


<button type="submit">

    💳 Pay Now

</button>


</form>


</div>

</div>


<!-- ================= FOOTER ================= -->

<div class="footer">


    <div>

        © 2026 Travel Management System

    </div>


    <div>

        Home | About | Contact

    </div>


    <div class="social">

        <i class="fab fa-instagram"></i>

        <i class="fab fa-facebook"></i>

        <i class="fab fa-linkedin"></i>

    </div>


</div>


<!-- ================= DATE TIME ================= -->

<script>

function updateDateTime(){

    const now = new Date();

    const date =
        now.toLocaleDateString();

    const time =
        now.toLocaleTimeString();

    document.getElementById("datetime")
        .innerHTML =
        date + " | " + time;

}


setInterval(
    updateDateTime,
    1000
);

updateDateTime();

</script>


</body>

</html>