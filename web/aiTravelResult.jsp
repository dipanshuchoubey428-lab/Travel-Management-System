```jsp
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>

<%
/* =========
   SESSION DATA
================*/

String destination =String) session.getAttribute("aiDestination");

Double budget =(Double) session.getAttribute("aiBudget");

Integer days =(Integer) session.getAttribute("aiDays");

Integer persons =(Integer) session.getAttribute("aiPersons");

String travelType =String) session.getAttribute("aiTravelType");

String requirementType =(String) session.getAttribute("aiRequirementType");


/* -----------------
   SESSION CHECK
---------------------*/

if(destination == null ||
   budget == null ||
   days == null ||
   persons == null ||
   travelType == null){

    response.sendRedirect("aiTravelAssistant.jsp");
    return;
}


/* =====================
   BASIC AI RECOMMENDATION
============================= */

String recommendation;

if(budget < 10000){

    recommendation =
        "Budget-friendly trip recommended. " +
        "Choose affordable hotels, local transport and nearby attractions.";

}
else if(budget < 25000){

    recommendation =
        "A comfortable trip is possible with a good balance " +
        "between hotel, food, transport and sightseeing.";

}
else{

    recommendation =
        "You have a good travel budget. " +
        "You can consider premium hotels, better transport and multiple attractions.";
}


/* =========
   HOTEL CLASS
================= */

class Hotel {

    String name;
    int price;
    int ac;
    int food;
    int rooms;

    Hotel(
        String name,
        int price,
        int ac,
        int food,
        int rooms
    ){

        this.name = name;
        this.price = price;
        this.ac = ac;
        this.food = food;
        this.rooms = rooms;
    }
}


/* ============
   HOTEL LIST
================= */

List<Hotel> hotels =
    new ArrayList<Hotel>();


/* =============
   HOTEL RECOMMENDATION
   IMPORTANT:
   TOTAL BUDGET WILL BE USED.
   PERSONS WILL NOT DIVIDE THE BUDGET.
===================================================== */

if(
    "hotel".equalsIgnoreCase(requirementType)
    ||
    "both".equalsIgnoreCase(requirementType)
){

    try{

        Class.forName("com.mysql.cj.jdbc.Driver");


        Connection con =DriverManager.getConnection( "jdbc:mysql://localhost:3306/travelmanagementsystem","root","Mysql@1234");


        String hotelSql =

            "SELECT name, costperperson, acroom, " +"foodinclude, available_rooms " +
            "FROM hotel " +"WHERE available_rooms > 0 " +
            "AND costperperson <= ? " +
            "ORDER BY costperperson ASC";


        PreparedStatement ps =
            con.prepareStatement(hotelSql);


        /*
         * IMPORTANT
         *
         * Budget is NOT divided by persons.
         *
         * Example:
         *
         * Budget = 10000
         *
         * Hotels <= 10000 will be shown.
         */

        ps.setDouble(
            1,
            budget
        );


        ResultSet rs =ps.executeQuery();


        while(rs.next()){

            Hotel h = new Hotel
            (

                    rs.getString("name"),

                    rs.getInt("costperperson"),

                    rs.getInt("acroom"),

                    rs.getInt("foodinclude"),

                    rs.getInt("available_rooms")
              );


            hotels.add(h);
        }


        rs.close();

        ps.close();

        con.close();

    }
    catch(Exception e){

        out.println(

            "<p style='color:red;'>" +

            "Hotel recommendation error: " +

            e.getMessage() +

            "</p>"
        );
    }
}


/* ===========
   PACKAGE DATA
==================== */

String[] packageName = {

    "Udaipur Palace Package",

    "Kolkata Heritage Package",

    "Agra Taj View Package",

    "Delhi Royal Package",

    "Chennai Luxury Package",

    "Hyderabad Palace Package",

    "Jaipur Heritage Package",

    "Mumbai Luxury Package",

    "Kochi Backwater Package",

    "Bengaluru Business Package"
};


String[] packageHotel = {

    "The Oberoi Udaivilas Hotel Udaipur",

    "The Oberoi Grand Hotel Kolkata",

    "The Oberoi Amarvilas Hotel Agra",

    "Taj Palace Hotel Delhi",

    "ITC Grand Chola Hotel Chennai",

    "Taj Falaknuma Palace Hotel Hyderabad",

    "Rambagh Palace Hotel Jaipur",

    "Taj Hotel Mumbai",

    "Brunton Boatyard Hotel Kochi",

    "The Oberoi Hotel Bengaluru"
};


String[] packageCity = {

    "Udaipur",

    "Kolkata",

    "Agra",

    "Delhi",

    "Chennai",

    "Hyderabad",

    "Jaipur",

    "Mumbai",

    "Kochi",

    "Bengaluru"
};


int[] packagePrice = {

    5000,

    8500,

    9000,

    10500,

    11000,

    11800,

    12090,

    12600,

    13000,

    17000
};


String[] packageDays = {

    "6 Days / 5 Nights",

    "3 Days / 2 Nights",

    "8 Days / 7 Nights",

    "6 Days / 5 Nights",

    "12 Days / 11 Nights",

    "3 Days / 2 Nights",

    "5 Days / 4 Nights",

    "4 Days / 3 Nights",

    "7 Days / 6 Nights",

    "9 Days / 8 Nights"
};


/*
 * Package filtering uses TOTAL BUDGET.
 *
 * NO:
 * budget / persons
 *
 * YES:
 * packagePrice <= budget
 */

double packageBudget = budget;


/* =====================================================
   DAILY BUDGET
===================================================== */

double dailyBudget =
    budget / days;


/* =====================================================
   BUDGET PER PERSON
   DISPLAY ONLY
===================================================== */

double budgetPerPerson =
    budget / persons;


/* =====================================================
   TRAVEL TYPE SUGGESTION
===================================================== */

String travelSuggestion;


if(
    travelType.equalsIgnoreCase("Family")
){

    travelSuggestion =
        "Family-friendly hotels, safe attractions and relaxed sightseeing are recommended.";

}
else if(
    travelType.equalsIgnoreCase("Couple")
){

    travelSuggestion =
        "Romantic locations, scenic places and comfortable stays are recommended.";

}
else if(
    travelType.equalsIgnoreCase("Friends")
){

    travelSuggestion =
        "Adventure activities, group-friendly hotels and local experiences are recommended.";

}
else{

    travelSuggestion =
        "Budget-friendly accommodation, local transport and flexible sightseeing are recommended.";
}

%>


<!DOCTYPE html>

<html>

<head>

<title>AI Travel Recommendation</title>


<style>

/* =====================================================
   GLOBAL
===================================================== */

*{

    margin:0;

    padding:0;

    box-sizing:border-box;

    font-family:'Segoe UI',sans-serif;
}


body{

    background:#f4f7fb;

    color:#222;
}


/* =====================================================
   HEADER
===================================================== */

.header{

    background:
        linear-gradient(
            135deg,
            #0d47a1,
            #1976d2
        );

    color:white;

    padding:35px 60px;
}


.header h1{

    font-size:34px;
}


.header p{

    margin-top:8px;

    opacity:0.9;
}


/* =====================================================
   CONTAINER
===================================================== */

.container{

    width:90%;

    max-width:1000px;

    margin:35px auto;
}


/* =====================================================
   CARD
===================================================== */

.card{

    background:white;

    border-radius:18px;

    padding:30px;

    margin-bottom:25px;

    box-shadow:
        0 10px 30px
        rgba(0,0,0,0.10);
}


/* =====================================================
   TITLE
===================================================== */

.card h2{

    color:#0d47a1;

    margin-bottom:20px;
}


/* =====================================================
   DETAILS
===================================================== */

.details{

    display:grid;

    grid-template-columns:
        repeat(
            auto-fit,
            minmax(180px,1fr)
        );

    gap:15px;
}


.detail-box{

    background:#f4f8ff;

    padding:18px;

    border-radius:12px;

    text-align:center;
}


.detail-box span{

    display:block;

    color:#666;

    font-size:14px;

    margin-bottom:7px;
}


.detail-box strong{

    color:#0d47a1;

    font-size:18px;
}


/* =====================================================
   AI BOX
===================================================== */

.ai-box{

    background:#eef4ff;

    border-left:5px solid #1976d2;

    padding:20px;

    border-radius:10px;

    line-height:1.6;
}


/* =====================================================
   HOTEL GRID
===================================================== */

.hotel-grid{

    display:grid;

    grid-template-columns:
        repeat(
            auto-fit,
            minmax(280px,1fr)
        );

    gap:20px;
}


.hotel-card{

    border-left:5px solid #1976d2;

    transition:0.3s;
}


.hotel-card:hover{

    transform:translateY(-5px);

    box-shadow:
        0 10px 25px
        rgba(0,0,0,0.15);
}


.hotel-card h3{

    color:#0d47a1;

    font-size:20px;

    margin-bottom:12px;
}


.hotel-card p{

    margin:8px 0;
}


/* =====================================================
   PACKAGE CARD
===================================================== */

.package-card{

    background:#f8fbff;

    border:1px solid #dce8f8;

    border-radius:14px;

    padding:22px;

    margin-bottom:18px;

    transition:0.3s;
}


.package-card:hover{

    transform:translateY(-4px);

    box-shadow:
        0 8px 20px
        rgba(0,0,0,0.10);
}


.package-card h3{

    color:#0d47a1;

    margin-bottom:15px;
}


.package-card p{

    margin:8px 0;
}


/* =====================================================
   NO RESULT
===================================================== */

.no-result{

    background:#fff4f4;

    border-left:5px solid #d32f2f;

    padding:20px;

    border-radius:10px;
}


/* =====================================================
   BUDGET
===================================================== */

.budget-box{

    display:flex;

    justify-content:space-between;

    align-items:center;

    background:#f8fbff;

    padding:20px;

    border-radius:12px;

    margin-bottom:15px;
}


.budget-box strong{

    color:#0d47a1;
}


/* =====================================================
   ITINERARY
===================================================== */

.day{

    border-left:5px solid #1976d2;

    background:#f8faff;

    padding:18px;

    margin-bottom:12px;

    border-radius:10px;
}


.day h3{

    color:#0d47a1;

    margin-bottom:8px;
}


/* =====================================================
   BUTTON
===================================================== */

.btn{

    display:inline-block;

    padding:13px 22px;

    background:
        linear-gradient(
            135deg,
            #1976d2,
            #0d47a1
        );

    color:white;

    text-decoration:none;

    border-radius:10px;

    font-weight:bold;

    margin-top:10px;

    transition:0.3s;
}


.btn:hover{

    transform:translateY(-2px);

    box-shadow:
        0 8px 20px
        rgba(0,0,0,0.18);
}

</style>

</head>


<body>


<%@ include file="backButton.jsp" %>


<!-- =====================================================
     HEADER
===================================================== -->

<div class="header">

    <h1>
        🤖 AI Travel Recommendation
    </h1>

    <p>
        Your personalized travel plan is ready.
    </p>

</div>


<div class="container">


<!-- =====================================================
     TRIP DETAILS
===================================================== -->

<div class="card">

    <h2>
        ✈️ Your Trip Details
    </h2>


    <div class="details">


        <div class="detail-box">

            <span>
                Destination
            </span>

            <strong>
                <%= destination %>
            </strong>

        </div>


        <div class="detail-box">

            <span>
                Total Budget
            </span>

            <strong>
                ₹<%= String.format("%.0f",budget) %>
            </strong>

        </div>


        <div class="detail-box">

            <span>
                Duration
            </span>

            <strong>
                <%= days %> Days
            </strong>

        </div>


        <div class="detail-box">

            <span>
                Persons
            </span>

            <strong>
                <%= persons %>
            </strong>

        </div>


        <div class="detail-box">

            <span>
                Travel Type
            </span>

            <strong>
                <%= travelType %>
            </strong>

        </div>


    </div>

</div>


<!-- =====================================================
     AI RECOMMENDATION
===================================================== -->

<div class="card">

    <h2>
        🤖 AI Recommendation
    </h2>


    <div class="ai-box">

        <%= recommendation %>

        <br><br>

        <strong>
            Travel Style:
        </strong>

        <%= travelSuggestion %>

    </div>

</div>


<!-- =====================================================
     HOTEL SECTION
===================================================== -->

<%
if(
    "hotel".equalsIgnoreCase(requirementType)
    ||
    "both".equalsIgnoreCase(requirementType)
){
%>


<div class="card">

    <h2>
        🏨 Recommended Hotels
    </h2>


    <p style="margin-bottom:20px;color:#555;">

        Hotels within your
        <strong>
            total budget
        </strong>
        of

        <strong>
            ₹<%= String.format("%.0f",budget) %>
        </strong>

        are shown below.

    </p>


    <%
    if(hotels.size() > 0){
    %>


        <div class="hotel-grid">


            <%
            for(Hotel h : hotels){
            %>


                <div class="ai-box hotel-card">


                    <h3>

                        🏨
                        <%= h.name %>

                    </h3>


                    <p>

                        💰
                        <strong>
                            Cost Per Person:
                        </strong>

                        ₹<%= h.price %>

                    </p>


                    <p>

                        ❄️
                        <strong>
                            AC Room:
                        </strong>

                        ₹<%= h.ac %>

                    </p>


                    <p>

                        🍽
                        <strong>
                            Food:
                        </strong>

                        ₹<%= h.food %>

                    </p>


                    <p>

                        🛏
                        <strong>
                            Available Rooms:
                        </strong>

                        <%= h.rooms %>

                    </p>


                </div>


            <%
            }
            %>


        </div>


    <%
    }
    else{
    %>


        <div class="no-result">

            😔 Sorry, no hotel is available
            within your total budget of

            <strong>
                ₹<%= String.format("%.0f",budget) %>
            </strong>.

        </div>


    <%
    }
    %>


</div>


<%
}
%>


<!-- =====================================================
     PACKAGE SECTION
===================================================== -->

<%
if(
    "package".equalsIgnoreCase(requirementType)
    ||
    "both".equalsIgnoreCase(requirementType)
){
%>


<div class="card">


    <h2>
        📦 Recommended Travel Packages
    </h2>


    <p style="margin-bottom:20px;color:#555;">

        Packages within your
        <strong>
            total budget
        </strong>
        of

        <strong>
            ₹<%= String.format("%.0f",packageBudget) %>
        </strong>

        are shown below.

    </p>


    <%
    boolean packageFound = false;


    for(int i = 0;
        i < packageName.length;
        i++){

        /*
         * IMPORTANT:
         *
         * PACKAGE PRICE <= TOTAL BUDGET
         *
         * Persons are NOT used here.
         */

        if(
            packagePrice[i] <= packageBudget
        ){

            packageFound = true;
    %>


            <div class="package-card">


                <h3>

                    📦
                    <%= packageName[i] %>

                </h3>


                <p>

                    🏨
                    <strong>
                        Hotel:
                    </strong>

                    <%= packageHotel[i] %>

                </p>


                <p>

                    📍
                    <strong>
                        City:
                    </strong>

                    <%= packageCity[i] %>

                </p>


                <p>

                    💰
                    <strong>
                        Package Price:
                    </strong>

                    ₹<%= packagePrice[i] %>

                </p>


                <p>

                    📅
                    <strong>
                        Duration:
                    </strong>

                    <%= packageDays[i] %>

                </p>


                <a

                    href=
                    "bookPackage.jsp?package=<%= URLEncoder.encode(packageName[i], "UTF-8") %>&price=<%= packagePrice[i] %>"

                    class="btn"

                >

                    📦 BOOK THIS PACKAGE

                </a>


            </div>


    <%
        }
    }


    if(!packageFound){
    %>


        <div class="no-result">

            😔 Sorry, no suitable package is available
            within your total budget.

            <br><br>

            Minimum package price is
            <strong>
                ₹5,000
            </strong>.

        </div>


    <%
    }
    %>


</div>


<%
}
%>


<!-- =====================================================
     BUDGET ANALYSIS
===================================================== -->

<div class="card">

    <h2>
        💰 Budget Analysis
    </h2>


    <div class="budget-box">

        <span>
            Total Budget
        </span>

        <strong>

            ₹<%= String.format("%.0f",budget) %>

        </strong>

    </div>


    <div class="budget-box">

        <span>
            Budget Per Person
        </span>

        <strong>

            ₹<%= String.format("%.0f",budgetPerPerson) %>

        </strong>

    </div>


    <div class="budget-box">

        <span>
            Approx. Daily Budget
        </span>

        <strong>

            ₹<%= String.format("%.0f",dailyBudget) %>

        </strong>

    </div>


    <div class="budget-box">

        <span>
            Duration
        </span>

        <strong>

            <%= days %> Days

        </strong>

    </div>

</div>


<!-- =====================================================
     ITINERARY
===================================================== -->

<div class="card">

    <h2>
        🗓️ Suggested Itinerary
    </h2>


    <%

    for(int i = 1;
        i <= days;
        i++){

    %>


        <div class="day">


            <h3>

                Day <%= i %>

            </h3>


            <p>

                Explore popular attractions in

                <strong>
                    <%= destination %>
                </strong>.

                Enjoy local food,
                sightseeing and

                <%= travelType.toLowerCase() %>

                -friendly activities.

            </p>


        </div>


    <%

    }

    %>


</div>


<!-- =====================================================
     BUTTONS
===================================================== -->

<div class="card">


    <a

        href="aiTravelAssistant.jsp"

        class="btn"

    >

        🔄 Plan Another Trip

    </a>


    <a

        href="dashboard.jsp"

        class="btn"

    >

        🏠 Dashboard

    </a>


</div>


</div>


</body>

</html>
