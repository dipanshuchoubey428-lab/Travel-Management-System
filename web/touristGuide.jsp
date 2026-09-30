<%@ page import="java.sql.*" %>

<%
String username = (String)session.getAttribute("username");

if(username==null){
    response.sendRedirect("login.html");
    return;
}

try{

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/travelmanagementsystem",
        "root",
        "Mysql@1234"
    );

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO page_visits(username,page_name) VALUES(?,?)"
    );

    ps.setString(1, username);
    ps.setString(2, "Smart Tourist Guide");

    ps.executeUpdate();

    ps.close();
    con.close();

}catch(Exception e){
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Smart Tourist Guide</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',sans-serif;
        }

        body{
            min-height:100vh;
            background:
            linear-gradient(rgba(0,0,0,0.65),rgba(0,0,0,0.55)),
            url("images/travel-bg.jpg");
            background-size:cover;
            background-position:center;
            display:flex;
            justify-content:center;
            align-items:center;
            padding:20px;
        }

        .guide-box{
            width:480px;
            background:rgba(255,255,255,0.97);
            border-radius:25px;
            padding:40px;
            box-shadow:0 20px 50px rgba(0,0,0,0.35);
        }

        .guide-box h2{
            text-align:center;
            color:#0d47a1;
            font-size:32px;
            margin-bottom:10px;
        }

        .subtitle{
            text-align:center;
            color:#666;
            font-size:15px;
            line-height:1.6;
            margin-bottom:30px;
        }

        .form-group{
            margin-bottom:20px;
        }

        label{
            display:block;
            font-weight:600;
            margin-bottom:8px;
            color:#333;
        }

        input,
        select{
            width:100%;
            padding:14px;
            border:1px solid #d6dce5;
            border-radius:12px;
            font-size:15px;
            background:#f8faff;
            outline:none;
            transition:.3s;
        }

        input:focus,
        select:focus{
            border-color:#1e88e5;
            background:#fff;
            box-shadow:0 0 10px rgba(30,136,229,.25);
        }

        button{
            width:100%;
            padding:15px;
            border:none;
            border-radius:12px;
            background:linear-gradient(135deg,#1e88e5,#0d47a1);
            color:#fff;
            font-size:16px;
            font-weight:bold;
            cursor:pointer;
            transition:.3s;
            margin-top:10px;
        }

        button:hover{
            transform:translateY(-2px);
            box-shadow:0 10px 25px rgba(13,71,161,.35);
        }

        .footer-text{
            text-align:center;
            margin-top:20px;
            color:#777;
            font-size:13px;
        }

        @media(max-width:550px){
            .guide-box{
                width:100%;
                padding:30px;
            }

            .guide-box h2{
                font-size:28px;
            }
        }
    </style>
</head>

<body>
    
    <%@ include file="backButton.jsp" %>

<div class="guide-box">

    <h2>? Explore Your Perfect Destination</h2>

    <p class="subtitle">
        Find the best tourist attractions based on your city,
        interests and travel budget for a memorable journey.
    </p>

    <form action="placeList.jsp" method="get">

        <div class="form-group">
            <label>Country</label>
            <select name="country" required>
                <option value="">Select Country</option>
                <option value="India">India</option>
            </select>
        </div>

        <div class="form-group">
            <label>City</label>
            <select name="city" required>
                <option value="">Select City</option>
                <option value="Agra">Agra</option>
                <option value="Varanasi">Varanasi</option>
                <option value="Jaipur">Jaipur</option>
                <option value="Manali">Manali</option>
                <option value="Kedarnath">Kedarnath</option>
            </select>
        </div>

        <div class="form-group">
            <label>Travel Interest</label>
            <select name="interest" required>
                <option value="">Select Interest</option>
                <option value="Historical">Historical Places</option>
                <option value="Religious">Religious Places</option>
                <option value="Nature">Nature & Wildlife</option>
                <option value="Adventure">Adventure Activities</option>
            </select>
        </div>

        <div class="form-group">
            <label>Budget</label>
            <input type="number"
                   name="budget"
                   placeholder="Enter Your Budget"
                   required>
        </div>

        <button type="submit">
            Search Tourist Places
        </button>

    </form>

    <div class="footer-text">
        Plan Smart ? Travel Better ? Explore More
    </div>

</div>

</body>
</html>