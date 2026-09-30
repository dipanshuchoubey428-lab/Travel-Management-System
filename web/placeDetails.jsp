<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Place Details</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #222;
        }

        .hero {
            background: linear-gradient(135deg, #0d47a1, #1976d2);
            color: white;
            padding: 40px 70px;
        }

        .hero h1 {
            font-size: 36px;
            margin-bottom: 8px;
        }

        .hero p {
            opacity: 0.9;
            font-size: 16px;
        }

        .container {
            width: 90%;
            max-width: 1150px;
            margin: 35px auto;
        }

        .details-card {
            background: white;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.10);
        }

        .place-img {
            width: 100%;
            height: 420px;
            object-fit: cover;
        }

        .content {
            padding: 30px;
        }

        .place-title {
            color: #0d47a1;
            font-size: 32px;
            margin-bottom: 18px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
            margin-bottom: 25px;
        }

        .info-box {
            background: #f8faff;
            padding: 20px;
            border-radius: 14px;
            border-left: 5px solid #1976d2;
        }

        .info-box h3 {
            font-size: 16px;
            color: #0d47a1;
            margin-bottom: 8px;
        }

        .info-box p {
            color: #555;
            line-height: 1.6;
            font-size: 15px;
        }

        .history-box {
            background: #fff;
            border: 1px solid #e1e7f0;
            padding: 22px;
            border-radius: 14px;
            margin-bottom: 25px;
        }

        .history-box h3 {
            color: #0d47a1;
            margin-bottom: 10px;
        }

        .history-box p {
            color: #555;
            line-height: 1.8;
            font-size: 15px;
        }

        .button-area {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            margin-top: 25px;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            padding: 13px 22px;
            border-radius: 10px;
            font-weight: bold;
            transition: 0.3s;
        }

        .map-btn {
            background: linear-gradient(135deg, #1976d2, #0d47a1);
            color: white;
        }

        .book-btn {
            background: linear-gradient(135deg, #2e7d32, #1b5e20);
            color: white;
        }

        .back-btn {
            background: #eef3fb;
            color: #0d47a1;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.18);
        }

        .error-box {
            background: white;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            border-left: 5px solid #d32f2f;
        }

        .error-box h3 {
            color: #d32f2f;
            margin-bottom: 10px;
        }

        @media(max-width: 700px) {
            .hero {
                padding: 30px 25px;
            }

            .hero h1 {
                font-size: 28px;
            }

            .place-img {
                height: 260px;
            }

            .content {
                padding: 22px;
            }

            .place-title {
                font-size: 26px;
            }
        }
    </style>
</head>

<body>

     <%@ include file="backButton.jsp" %>
<div class="hero">
    <h1>Place Details</h1>
    <p>Explore complete information about your selected destination.</p>
</div>

<div class="container">

<%
String id = request.getParameter("id");

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelmanagementsystem",
          "root",
          "Mysql@1234"
    );

    PreparedStatement ps = con.prepareStatement("SELECT * FROM places WHERE id=?");

    ps.setString(1, id);

    ResultSet rs = ps.executeQuery();

    if(rs.next()) {
%>

    <div class="details-card">

        <img class="place-img"
             src="images/<%= rs.getString("image") %>"
             alt="<%= rs.getString("place_name") %>">

        <div class="content">

            <h2 class="place-title">
                <%= rs.getString("place_name") %>
            </h2>

            <div class="info-grid">

                <div class="info-box">
                    <h3>Famous For</h3>
                    <p><%= rs.getString("famous_for") %></p>
                </div>

                <div class="info-box">
                    <h3>Location</h3>
                    <p><%= rs.getString("location") %></p>
                </div>

                <div class="info-box">
                    <h3>Ticket Price</h3>
                    <p><%= rs.getString("ticket_price") %></p>
                </div>

                <div class="info-box">
                    <h3>Best Time</h3>
                    <p><%= rs.getString("best_time") %></p>
                </div>

            </div>

            <div class="history-box">
                <h3>History</h3>
                <p><%= rs.getString("history") %></p>
            </div>

            <div class="button-area">

                <a class="btn map-btn"
                   href="https://www.google.com/maps/search/<%= rs.getString("location") %>"
                   target="_blank">
                   Open in Google Maps
                  
                </a>

                <a class="btn book-btn"
                   href="customPackage.jsp?place=<%= rs.getString("place_name") %>">
                   Book Custom Package
                </a>

                <a class="btn back-btn" href="placeList.jsp">
                   Back
                </a>

            </div>

        </div>

    </div>

<%
    }
    else {
%>

    <div class="error-box">
        <h3>Place Not Found</h3>
        <p>No details available for this place.</p>
    </div>

<%
    }

    con.close();

}
catch(Exception e) {
%>

    <div class="error-box">
        <h3>Something went wrong!</h3>
        <p><%= e.getMessage() %></p>
    </div>

<%
}
%>

</div>

</body>
</html>