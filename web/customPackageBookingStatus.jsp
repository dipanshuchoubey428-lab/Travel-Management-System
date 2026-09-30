<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>

    <title>Custom Package Booking Status</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            width: 90%;
            max-width: 600px;
            background: white;
            padding: 45px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 10px 35px rgba(0,0,0,0.12);
        }

        .icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 20px;
            border-radius: 50%;
            background: #e8f5e9;
            color: #2e7d32;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 42px;
        }

        h1 {
            color: #0d47a1;
            margin-bottom: 12px;
        }

        .message {
            color: #555;
            font-size: 17px;
            margin-bottom: 25px;
            line-height: 1.6;
        }

        .info {
            background: #f5f9ff;
            padding: 18px;
            border-radius: 12px;
            margin-bottom: 25px;
            text-align: left;
        }

        .info p {
            margin: 8px 0;
            color: #333;
        }

        .info strong {
            color: #0d47a1;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            padding: 13px 22px;
            border-radius: 9px;
            margin: 5px;
            font-weight: bold;
        }

        .dashboard {
            background: linear-gradient(135deg, #0d47a1, #1976d2);
            color: white;
        }

        .home {
            background: #eef3fb;
            color: #0d47a1;
        }

        .btn:hover {
            transform: translateY(-2px);
        }

    </style>

</head>

<body>


<%

    String username = (String) session.getAttribute("username");

    String place = (String) session.getAttribute("customPlace");

    String price = (String) session.getAttribute("customPackagePrice");

%>


<div class="card">

    <div class="icon">
        ?
    </div>


    <h1>Booking Successful!</h1>


    <p class="message">

        Your custom package has been booked successfully.

        <br>

        Your booking is now waiting for admin approval.

    </p>


    <div class="info">

        <p>
            <strong>Username:</strong>
            <%= username != null ? username : "User" %>
        </p>

        <p>
            <strong>Destination:</strong>
            <%= place != null ? place : "Custom Package" %>
        </p>

        <p>
            <strong>Total Price:</strong>
            ?<%= price != null ? price : "0" %>
        </p>

        <p>
            <strong>Status:</strong>
            Pending
        </p>

    </div>


    <a href="dashboard.jsp" class="btn dashboard">
        Go to Dashboard
    </a>


    <a href="index.jsp" class="btn home">
        Home
    </a>


</div>


</body>
</html>