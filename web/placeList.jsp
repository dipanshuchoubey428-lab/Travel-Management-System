<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Place List</title>

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

        .top-section {
            background: linear-gradient(135deg, #0d47a1, #1976d2);
            color: white;
            padding: 45px 70px;
        }

        .top-section h2 {
            font-size: 36px;
            margin-bottom: 8px;
        }

        .top-section p {
            font-size: 16px;
            opacity: 0.9;
        }

        .container {
            width: 90%;
            margin: 35px auto;
        }

        .result-info {
            background: white;
            padding: 18px 25px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.08);
            color: #555;
        }

        .result-info span {
            color: #0d47a1;
            font-weight: bold;
        }

        .places-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(290px, 1fr));
            gap: 25px;
        }

        .place-card {
            background: white;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            transition: 0.3s;
            border-left: 5px solid #1976d2;
        }

        .place-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 14px 35px rgba(0,0,0,0.14);
        }

        .place-card h3 {
            color: #0d47a1;
            font-size: 24px;
            margin-bottom: 14px;
        }

        .place-card p {
            color: #555;
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 22px;
        }

        .place-card b {
            color: #222;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            background: linear-gradient(135deg, #1976d2, #0d47a1);
            color: white;
            padding: 11px 18px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn:hover {
            box-shadow: 0 8px 18px rgba(13,71,161,0.3);
            transform: translateY(-2px);
        }

        .empty-box {
            background: white;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            border-left: 5px solid #d32f2f;
        }

        .empty-box h3 {
            color: #d32f2f;
            margin-bottom: 10px;
            font-size: 24px;
        }

        .empty-box p {
            color: #666;
            margin-bottom: 18px;
        }

        .back-link {
            text-decoration: none;
            color: #0d47a1;
            font-weight: bold;
        }

        @media(max-width: 600px) {
            .top-section {
                padding: 35px 25px;
            }

            .top-section h2 {
                font-size: 28px;
            }

            .container {
                width: 92%;
            }
        }
    </style>
</head>

<body>

    
     <%@ include file="backButton.jsp" %>
<div class="top-section">
    <h2>Available Tourist Places</h2>
    <p>Explore matching destinations based on your selected city and interest.</p>
</div>

<div class="container">

<%
String country = request.getParameter("country");
String city = request.getParameter("city");
String interest = request.getParameter("interest");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/travelmanagementsystem",
        "root",
        "Mysql@1234"
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM places WHERE country=? AND city=? AND interest=?"
    );

    ps.setString(1, country);
    ps.setString(2, city);
    ps.setString(3, interest);

    ResultSet rs = ps.executeQuery();

    boolean found = false;
%>

    <div class="result-info">
        Showing results for 
        <span><%= country %></span> /
        <span><%= city %></span> /
        <span><%= interest %></span>
    </div>

    <div class="places-grid">

<%
    while(rs.next()) {
        found = true;
%>

        <div class="place-card">
            <h3><%= rs.getString("place_name") %></h3>

            <p>
                <b>Famous For:</b><br>
                <%= rs.getString("famous_for") %>
            </p>

            <a class="btn" href="placeDetails.jsp?id=<%= rs.getInt("id") %>">
                View Details
            </a>
        </div>

<%
    }
%>

    </div>

<%
    if(!found) {
%>

    <div class="empty-box">
        <h3>No Places Found!</h3>
        <p>No tourist places matched your selected country, city and interest.</p>
        <a class="back-link" href="touristGuide.jsp">? Back to Search</a>
    </div>

<%
    }

    con.close();

} catch(Exception e) {
%>

    <div class="empty-box">
        <h3>Something went wrong!</h3>
        <p><%= e.getMessage() %></p>
        <a class="back-link" href="touristGuide.jsp">? Back to Search</a>
    </div>

<%
}
%>

</div>

</body>
</html>