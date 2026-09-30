




<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String username = (String) session.getAttribute("username");

    // Login check
    if (username == null) {
        response.sendRedirect("login.html");
        return;
    }

    // Page visit tracking
    try {

        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/travelmanagementsystem",
            "root",
            "Mysql@1234"
        );

        String sql = "INSERT INTO page_visits(username, page_name) VALUES (?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, username);
        ps.setString(2, "Foreign Tourist Support");

        ps.executeUpdate();

        ps.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Foreign Tourist Support</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f5f6f8;
            color: #333;
        }

        /* Header */

        .header {
            background: #2575fc;
            color: white;
            text-align: center;
            padding: 30px 20px;
        }

        .header h1 {
            font-size: 32px;
            margin-bottom: 8px;
        }

        .header p {
            font-size: 15px;
        }

        /* Main Container */

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 30px auto;
        }

        /* Grid */

        .grid {
            display: grid;
            grid-template-columns: repeat(
                auto-fit,
                minmax(300px, 1fr)
            );

            gap: 20px;
        }

        /* Cards */

        .card {
            background: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 22px;
        }

        .card h2 {
            color: #2575fc;
            font-size: 20px;
            margin-bottom: 15px;
        }

        .info {
            margin-bottom: 10px;
            font-size: 15px;
            line-height: 1.6;
        }

        /* Lists */

        ul {
            padding-left: 20px;
        }

        li {
            margin-bottom: 9px;
            line-height: 1.5;
        }

        /* Back Button */

        .footer {
            text-align: center;
            margin: 30px 0;
        }

        .back-btn {
            display: inline-block;
            padding: 12px 22px;
            background: #2575fc;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }

        .back-btn:hover {
            background: #1258d3;
        }

        /* Mobile */

        @media (max-width: 600px) {

            .header h1 {
                font-size: 26px;
            }

            .container {
                width: 94%;
            }

            .card {
                padding: 18px;
            }

        }

    </style>

</head>

<body>

    <!-- Back Button -->

    <%@ include file="backButton.jsp" %>


    <!-- Header -->

    <div class="header">

        <h1>🌍 Foreign Tourist Support</h1>

        <p>
            Important travel information for international visitors
        </p>

    </div>


    <!-- Main Content -->

    <div class="container">

        <div class="grid">


            <!-- Emergency Contacts -->

            <div class="card">

                <h2>🚨 Emergency Contacts</h2>

                <p class="info">
                    <b>Police:</b> 100
                </p>

                <p class="info">
                    <b>Ambulance:</b> 108
                </p>

                <p class="info">
                    <b>National Emergency:</b> 112
                </p>

                <p class="info">
                    <b>Tourist Helpline:</b> 1363
                </p>

            </div>


            <!-- Currency Information -->

            <div class="card">

                <h2>💰 Currency Information</h2>

                <p class="info">
                    Foreign currency can be exchanged into
                    Indian Rupees (INR).
                </p>

                <p class="info">
                    <b>1 USD:</b> ₹83
                </p>

                <p class="info">
                    <b>1 GBP:</b> ₹105
                </p>

                <p class="info">
                    <b>1 EUR:</b> ₹90
                </p>

                <p class="info">
                    <b>1 AUD:</b> ₹55
                </p>

            </div>


            <!-- Language Support -->

            <div class="card">

                <h2>🗣 Language Support</h2>

                <p class="info">
                    <b>Hello:</b> Namaste
                </p>

                <p class="info">
                    <b>Thank You:</b> Dhanyavaad
                </p>

                <p class="info">
                    <b>Help:</b> Madad
                </p>

                <p class="info">
                    <b>Water:</b> Paani
                </p>

                <p class="info">
                    <b>Food:</b> Bhojan
                </p>

            </div>


            <!-- Local Rules -->

            <div class="card">

                <h2>📜 Local Rules</h2>

                <ul>

                    <li>
                        Carry a copy of your passport.
                    </li>

                    <li>
                        Respect religious places.
                    </li>

                    <li>
                        Do not litter public places.
                    </li>

                    <li>
                        Follow traffic rules.
                    </li>

                    <li>
                        Keep emergency contacts saved.
                    </li>

                </ul>

            </div>


            <!-- Culture Tips -->

            <div class="card">

                <h2>🙏 Culture Tips</h2>

                <ul>

                    <li>
                        Remove shoes before entering temples.
                    </li>

                    <li>
                        Wear decent clothes at religious places.
                    </li>

                    <li>
                        Ask permission before photography.
                    </li>

                    <li>
                        Use polite language.
                    </li>

                    <li>
                        Be careful with spicy food.
                    </li>

                </ul>

            </div>


            <!-- Useful Services -->

            <div class="card">

                <h2>📞 Useful Services</h2>

                <p class="info">
                    <b>Indian Railways:</b> 139
                </p>

                <p class="info">
                    <b>Airport:</b> Help Desk
                </p>

                <p class="info">
                    <b>Tourist:</b> Government Tourist Office
                </p>

                <p class="info">
                    <b>Medical:</b> Nearest Hospital
                </p>

                <p class="info">
                    <b>Transport:</b> Taxi & Cab Support
                </p>

            </div>
            
            <!-- Visa Information -->

<div class="card">

```
<h2>🛂 Visa Information</h2>

<p class="info">
    <b>Tourist Visa:</b> For tourism and sightseeing.
</p>

<p class="info">
    <b>e-Visa:</b> Available for eligible foreign tourists.
</p>

<p class="info">
    <b>Passport:</b> Valid passport is required.
</p>

<p class="info">
    <b>Visa Duration:</b> Depends on the type of visa.
</p>

<p class="info">
    <b>Application:</b> Apply through the official Indian visa portal.
</p>
```

</div>



        </div>


        <!-- Dashboard Button -->

        <div class="footer">

            <a href="dashboard.jsp" class="back-btn">
                🏠 Back to Dashboard
            </a>

        </div>

    </div>

</body>

</html>