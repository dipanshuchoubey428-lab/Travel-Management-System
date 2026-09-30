<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
String username = (String)session.getAttribute("username");

if(username == null){
    response.sendRedirect("login.html");
    return;
}

int totalCustomers = 0;
int totalBookings = 0;
int totalRevenue = 0;

try {

    Connection con =
    DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/travelmanagementsystem",
    "root",
    "Mysql@1234");

    /* TOTAL CUSTOMERS */
    Statement st1 = con.createStatement();

    ResultSet rs1 =
    st1.executeQuery(
    "SELECT COUNT(*) FROM customer");

    if(rs1.next()){
        totalCustomers = rs1.getInt(1);
    }

    /* TOTAL BOOKINGS */
    Statement st2 = con.createStatement();

    ResultSet rs2 =
    st2.executeQuery(
    "SELECT COUNT(*) FROM bookpackage");

    if(rs2.next()){
        totalBookings = rs2.getInt(1);
    }

    /* TOTAL REVENUE */
    Statement st3 = con.createStatement();

    ResultSet rs3 =
    st3.executeQuery(
    "SELECT SUM(CAST(amount AS SIGNED)) FROM payment");

    if(rs3.next()){
        totalRevenue = rs3.getInt(1);
    }

}catch(Exception e){
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Reports Dashboard</title>

<!-- CHART JS -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
    url('images/report.jpg');

    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
    background-attachment:fixed;

    min-height:100vh;

    color:white;
}

/* HEADER */
.header{

    width:100%;

    padding:22px;

    text-align:center;

    font-size:34px;
    font-weight:700;

    letter-spacing:1px;

    background:
    rgba(255,255,255,0.08);

    backdrop-filter:blur(10px);

    border-bottom:
    1px solid rgba(255,255,255,0.12);

    box-shadow:
    0 4px 15px rgba(0,0,0,0.35);
}

/* MAIN CONTAINER */
.container{
    padding:40px;
}

/* WELCOME */
.welcome{

    font-size:28px;
    font-weight:600;

    margin-bottom:35px;

    color:#f8fafc;
}

/* CARDS */
.cards{

    display:flex;

    gap:25px;

    flex-wrap:wrap;

    margin-bottom:45px;
}

/* CARD */
.card{

    flex:1;

    min-width:260px;

    padding:30px;

    border-radius:24px;

    background:
    rgba(255,255,255,0.10);

    backdrop-filter:blur(12px);

    border:
    1px solid rgba(255,255,255,0.12);

    box-shadow:
    0 12px 30px rgba(0,0,0,0.35);

    transition:0.4s;

    position:relative;

    overflow:hidden;
}

/* CARD HOVER */
.card:hover{

    transform:
    translateY(-8px)
    scale(1.02);

    box-shadow:
    0 18px 40px rgba(0,0,0,0.45);
}

/* CARD GLOW */
.card::before{

    content:"";

    position:absolute;

    width:180px;
    height:180px;

    background:
    rgba(255,255,255,0.08);

    border-radius:50%;

    top:-80px;
    right:-80px;
}

/* CARD TITLE */
.card h3{

    font-size:22px;

    margin-bottom:18px;

    color:#ecfeff;
}

/* VALUE */
.value{

    font-size:34px;
    font-weight:700;

    color:#67e8f9;
}

/* CHART SECTION */
.chart-section{

    width:100%;

    max-width:900px;

    margin:auto;

    padding:35px;

    border-radius:28px;

    background:
    rgba(255,255,255,0.10);

    backdrop-filter:blur(12px);

    border:
    1px solid rgba(255,255,255,0.12);

    box-shadow:
    0 12px 35px rgba(0,0,0,0.35);
}

/* ANALYTICS */
.chart-section h2{

    text-align:center;

    margin-bottom:25px;

    font-size:30px;

    color:#ffffff;
}

/* CANVAS */
canvas{

    background:
    rgba(255,255,255,0.92);

    border-radius:18px;

    padding:20px;
}

/* RESPONSIVE */
@media(max-width:900px){

    .cards{
        flex-direction:column;
    }

    .container{
        padding:20px;
    }

    .header{
        font-size:28px;
    }

    .welcome{
        font-size:22px;
    }

}

</style>

</head>

<body>
    
    <%@ include file="backButton.jsp" %>

<!-- HEADER -->
<div class="header">

    Reports Dashboard

</div>

<!-- MAIN -->
<div class="container">

    <div class="welcome">

        Welcome, <%= username %>

    </div>

    <!-- CARDS -->
    <div class="cards">

        <!-- CUSTOMERS -->
        <div class="card">

            <h3>Total Customers</h3>

            <div class="value">

                <%= totalCustomers %>

            </div>

        </div>

        <!-- BOOKINGS -->
        <div class="card">

            <h3>Total Bookings</h3>

            <div class="value">

                <%= totalBookings %>

            </div>

        </div>

        <!-- REVENUE -->
        <div class="card">

            <h3>Total Revenue</h3>

            <div class="value">

                ₹ <%= totalRevenue %>

            </div>

        </div>

    </div>

    <!-- CHART -->
    <div class="chart-section">

        <h2>Travel Analytics</h2>

        <canvas id="myChart"></canvas>

    </div>

</div>

<!-- CHART SCRIPT -->
<script>

var customers =
<%= totalCustomers %>;

var bookings =
<%= totalBookings %>;

var revenue =
<%= totalRevenue %>;

const ctx =
document.getElementById('myChart');

new Chart(ctx, {

    type: 'bar',

    data: {

        labels: [
            'Customers',
            'Bookings',
            'Revenue'
        ],

        datasets: [{

            label: 'System Report',

            data: [
                customers,
                bookings,
                revenue
            ],

            backgroundColor: [

                '#06b6d4',
                '#14b8a6',
                '#38bdf8'

            ],

            borderRadius:12
        }]
    },

    options: {

        responsive:true,

        plugins:{

            legend:{
                labels:{
                    color:'black',
                    font:{
                        size:14
                    }
                }
            }
        },

        scales:{

            y:{
                beginAtZero:true,

                ticks:{
                    color:'black'
                }
            },

            x:{
                ticks:{
                    color:'black'
                }
            }
        }
    }
});

</script>

</body>
</html>