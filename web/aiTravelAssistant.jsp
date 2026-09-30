<%@ page contentType="text/html; charset=UTF-8" %>

<%
String username = (String) session.getAttribute("username");

if(username == null)
{
    response.sendRedirect("login.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<title>AI Travel Assistant</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f4f7fb;
    min-height:100vh;
}

/* HEADER */

.header{
    background:linear-gradient(135deg,#0d47a1,#1976d2);
    color:white;
    padding:40px 70px;
}

.header h1{
    font-size:36px;
    margin-bottom:8px;
}

.header p{
    opacity:0.9;
    font-size:16px;
}


/* MAIN CONTAINER */

.container{
    width:90%;
    max-width:900px;
    margin:40px auto;
}


/* CARD */

.card{
    background:white;
    padding:35px;
    border-radius:18px;

    box-shadow:
        0 10px 30px rgba(0,0,0,0.10);
}

.card h2{
    text-align:center;
    color:#0d47a1;
    margin-bottom:25px;
}


/* INFO BOX */

.info{
    margin-bottom:25px;

    padding:16px;

    background:#eef4ff;

    border-left:5px solid #1976d2;

    border-radius:8px;

    color:#333;

    line-height:1.6;
}


/* FORM */

.form-group{
    margin-bottom:20px;
}

label{
    display:block;

    margin-bottom:8px;

    font-weight:600;

    color:#333;
}


/* INPUT */

input,
select{

    width:100%;

    padding:14px;

    border:1px solid #d6dce5;

    border-radius:10px;

    font-size:15px;

    background:#f9fbff;

    transition:0.3s;
}

input:focus,
select:focus{

    outline:none;

    border-color:#1976d2;

    background:white;

    box-shadow:
        0 0 8px rgba(25,118,210,0.25);
}


/* TWO COLUMN */

.row{

    display:grid;

    grid-template-columns:
        1fr 1fr;

    gap:20px;
}


/* BUTTON */

.btn{

    width:100%;

    padding:15px;

    border:none;

    border-radius:10px;

    background:
        linear-gradient(
            135deg,
            #1976d2,
            #0d47a1
        );

    color:white;

    font-size:16px;

    font-weight:bold;

    cursor:pointer;

    margin-top:10px;

    transition:0.3s;
}

.btn:hover{

    transform:translateY(-2px);

    box-shadow:
        0 8px 20px rgba(0,0,0,0.18);
}


/* FEATURES */

.features{

    display:grid;

    grid-template-columns:
        repeat(3,1fr);

    gap:15px;

    margin-top:25px;
}

.feature{

    background:#f8faff;

    padding:18px;

    border-radius:12px;

    text-align:center;

    border:1px solid #e1e7f0;
}

.feature .icon{

    font-size:28px;

    margin-bottom:8px;
}

.feature h3{

    color:#0d47a1;

    font-size:15px;

    margin-bottom:5px;
}

.feature p{

    color:#666;

    font-size:13px;

    line-height:1.4;
}


/* RESPONSIVE */

@media(max-width:700px){

    .header{

        padding:30px 25px;
    }

    .header h1{

        font-size:28px;
    }

    .container{

        width:95%;
    }

    .card{

        padding:25px;
    }

    .row{

        grid-template-columns:1fr;
    }

    .features{

        grid-template-columns:1fr;
    }
}

</style>

</head>


<body>


<%@ include file="backButton.jsp" %>


<!-- ================= HEADER ================= -->

<div class="header">

    <h1>🤖 AI Travel Assistant</h1>

    <p>

        Welcome <strong><%= username %></strong> —

        plan your perfect trip with our smart travel assistant.

    </p>

</div>


<!-- ================= MAIN ================= -->

<div class="container">

    <div class="card">


        <h2>
            ✈️ Plan Your Perfect Trip
        </h2>


        <!-- ================= INFORMATION ================= -->

        <div class="info">

            💡 <strong>Smart Travel Planning</strong><br>

            Enter your destination, budget, duration and
            travel preferences.

            Our AI Travel Assistant will analyze your
            requirements and generate a personalized
            travel recommendation.

        </div>


        <!-- ================= FORM ================= -->

        <form
            action="AITravelAssistantServlet"
            method="post">


            <!-- ================= DESTINATION ================= -->

            <div class="form-group">

                <label>
                    📍 Where do you want to travel?
                </label>

                <input
                    type="text"
                    name="destination"
                    placeholder="Example: Delhi, Mumbai, Udaipur"
                    required>

            </div>


            <!-- ================= BUDGET + DAYS ================= -->

            <div class="row">


                <!-- BUDGET -->

                <div class="form-group">

                    <label>
                        💰 Your Budget (₹)
                    </label>

                    <input
                        type="number"
                        name="budget"
                        placeholder="Example: 20000"
                        min="1"
                        required>

                </div>


                <!-- DAYS -->

                <div class="form-group">

                    <label>
                        📅 Number of Days
                    </label>

                    <input
                        type="number"
                        name="days"
                        placeholder="Example: 4"
                        min="1"
                        max="30"
                        required>

                </div>


            </div>


            <!-- ================= PERSONS + REQUIREMENT ================= -->

            <div class="row">


                <!-- PERSONS -->

                <div class="form-group">

                    <label>
                        👥 Number of Persons
                    </label>

                    <input
                        type="number"
                        name="persons"
                        placeholder="Example: 2"
                        min="1"
                        max="50"
                        required>

                </div>


                <!-- REQUIREMENT TYPE -->

                <div class="form-group">

                    <label>
                        🔎 What are you looking for?
                    </label>

                    <select
                        name="requirementType"
                        required>

                        <option value="">
                            Select Requirement
                        </option>

                        <option value="hotel">
                            🏨 Hotel Recommendation
                        </option>

                        <option value="package">
                            📦 Travel Package Recommendation
                        </option>

                        <option value="both">
                            🤖 Best Recommendation
                        </option>

                    </select>

                </div>


            </div>


            <!-- ================= TRAVEL TYPE ================= -->

            <div class="form-group">

                <label>
                    🧳 Travel Type
                </label>

                <select
                    name="travelType"
                    required>

                    <option value="">
                        Select Travel Type
                    </option>

                    <option value="Family">
                        👨‍👩‍👧 Family
                    </option>

                    <option value="Couple">
                        ❤️ Couple
                    </option>

                    <option value="Friends">
                        👥 Friends
                    </option>

                    <option value="Solo">
                        🧳 Solo
                    </option>

                </select>

            </div>


            <!-- ================= BUTTON ================= -->

            <button
                type="submit"
                class="btn">

                🤖 Generate My Travel Plan

            </button>


        </form>


        <!-- ================= FEATURES ================= -->

        <div class="features">


            <!-- FEATURE 1 -->

            <div class="feature">

                <div class="icon">
                    💰
                </div>

                <h3>
                    Budget Analysis
                </h3>

                <p>
                    Get a travel plan according
                    to your budget.
                </p>

            </div>


            <!-- FEATURE 2 -->

            <div class="feature">

                <div class="icon">
                    🗓️
                </div>

                <h3>
                    Smart Itinerary
                </h3>

                <p>
                    Get a day-wise travel
                    recommendation.
                </p>

            </div>


            <!-- FEATURE 3 -->

            <div class="feature">

                <div class="icon">
                    🎯
                </div>

                <h3>
                    Personalized Plan
                </h3>

                <p>
                    Recommendations based
                    on your travel type.
                </p>

            </div>


        </div>


    </div>

</div>


</body>

</html>