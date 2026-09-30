<%@ page contentType="text/html; charset=UTF-8"%>

<%
String username = (String)session.getAttribute("username");
String id = (String)session.getAttribute("id");
String phone = (String)session.getAttribute("phone");
String number = (String)session.getAttribute("number");

if(username == null){
    response.sendRedirect("login.html");
    return;
}

String pack = request.getParameter("package");
String price = request.getParameter("price");
%>

<!DOCTYPE html>
<html>
<head>
<title>Book Package</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Poppins',sans-serif;
    overflow-x:hidden;
}

/* MAIN CONTAINER */
.main-container{
    width:100%;
    min-height:100vh;

    display:flex;
}

/* LEFT IMAGE SECTION */
.left-section{
    width:60%;

    background:
    linear-gradient(
        rgba(0,0,0,0.15),
        rgba(0,0,0,0.20)
    ),
    url('<%=request.getContextPath()%>/images/bookpackage.jpg');

    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;

    position:relative;
}

/* IMAGE OVERLAY */
.left-section::after{
    content:"";

    position:absolute;

    top:0;
    left:0;

    width:100%;
    height:100%;

    background:
    linear-gradient(
        to right,
        rgba(0,0,0,0.08),
        rgba(0,0,0,0.35)
    );
}

/* RIGHT FORM SIDE */
.right-section{
    width:40%;

    /* MATCHING IMAGE COLORS */
    background:
    linear-gradient(
        180deg,
        #06263a 0%,
        #0b3d5c 35%,
        #0f5f7f 70%,
        #1788a6 100%
    );

    display:flex;
    justify-content:center;
    align-items:center;

    padding:40px 25px;

    position:relative;
}

/* TOP GLOW */
.right-section::before{
    content:"";

    position:absolute;

    width:300px;
    height:300px;

    background:#38bdf8;

    border-radius:50%;

    top:-120px;
    right:-100px;

    opacity:0.18;

    filter:blur(90px);
}

/* BOTTOM GLOW */
.right-section::after{
    content:"";

    position:absolute;

    width:250px;
    height:250px;

    background:#67e8f9;

    border-radius:50%;

    bottom:-120px;
    left:-80px;

    opacity:0.16;

    filter:blur(90px);
}

/* FORM CONTAINER */
.container{
    width:100%;
    max-width:430px;

    padding:35px;

    position:relative;
    z-index:2;

    background:
    rgba(255,255,255,0.12);

    border:
    1px solid rgba(255,255,255,0.18);

    backdrop-filter:blur(14px);
    -webkit-backdrop-filter:blur(14px);

    border-radius:24px;

    box-shadow:
    0 12px 35px rgba(0,0,0,0.35);
}

/* HEADING */
h2{
    text-align:center;

    color:#ffffff;

    font-size:34px;
    font-weight:700;

    margin-bottom:28px;

    letter-spacing:1px;
}

/* LABELS */
label{
    display:block;

    color:#ecfeff;

    margin-bottom:8px;

    font-size:14px;
    font-weight:500;
}

/* INPUTS */
input{
    width:100%;

    padding:14px 16px;

    margin-bottom:18px;

    border:none;
    outline:none;

    border-radius:14px;

    background:
    rgba(255,255,255,0.94);

    color:#0f172a;

    font-size:14px;

    transition:0.3s;

    box-shadow:
    inset 0 2px 6px rgba(0,0,0,0.12);
}

/* READONLY */
input[readonly]{
    background:#f8fafc;
}

/* INPUT FOCUS */
input:focus{

    transform:scale(1.01);

    box-shadow:
    0 0 0 3px rgba(103,232,249,0.35);
}

/* COMMON BUTTON */
button,
input[type=submit]{

    width:100%;

    padding:15px;

    border:none;

    border-radius:14px;

    color:white;

    font-size:15px;
    font-weight:600;

    cursor:pointer;

    transition:0.3s;
}

/* CHECK PRICE BUTTON */
button{

    background:
    linear-gradient(
        135deg,
        #06b6d4,
        #0891b2
    );

    margin-bottom:15px;
}

/* BOOK BUTTON */
input[type=submit]{

    background:
    linear-gradient(
        135deg,
        #14b8a6,
        #0f766e
    );
}

/* BUTTON HOVER */
button:hover,
input[type=submit]:hover{

    transform:translateY(-3px);

    box-shadow:
    0 10px 22px rgba(0,0,0,0.35);
}

/* RESPONSIVE */
@media(max-width:950px){

    .main-container{
        flex-direction:column;
    }

    .left-section,
    .right-section{
        width:100%;
    }

    .left-section{
        height:350px;
    }

}

</style>

<script>

function calculatePrice(){

    var price = document.getElementsByName("price")[0].value;

    if(price === "" || price === "null"){
        alert("Package price not available");
        return;
    }

    // Package price fixed rahega
    document.getElementsByName("price")[0].value = price;
}

</script>

</head>

<body>
    
    <%@ include file="backButton.jsp" %>

<div class="main-container">

    <!-- LEFT IMAGE -->
    <div class="left-section"></div>

    <!-- RIGHT FORM -->
    <div class="right-section">

        <div class="container">

            <h2>Book Package</h2>

            <form action="BookPackageServlet"
                  method="post">

                <label>Username</label>

                <input type="text"
                       name="username"
                       value="<%=username%>"
                       readonly>

                <label>ID</label>

                <input type="text"
                       name="id"
                       value="<%=id%>"
                       readonly>

                <label>Number</label>

                <input type="text"
                       name="number"
                       value="<%=number%>"
                       readonly>

                <label>Phone</label>

                <input type="text"
                       name="phone"
                       value="<%=phone%>"
                       readonly>

                <label>Package</label>

                <input type="text"
                       name="package"
                       value="<%=pack%>"
                       readonly>

                <label>Persons</label>

                <input type="number"
                       name="persons"
                       value="1"
                       min="1">

                <label>Total Price</label>

                <input type="text"
                       name="price"
                       value="<%=price%>"
                       readonly>

                <button type="button"
                        onclick="calculatePrice()">

                    Check Price

                </button>

                <input type="submit"
                       value="Book Package">

            </form>

        </div>

    </div>

</div>

</body>
</html>