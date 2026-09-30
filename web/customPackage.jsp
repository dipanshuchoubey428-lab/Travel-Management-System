<%@ page import="java.sql.*" %>

<%
String place = request.getParameter("place");
%>

<!DOCTYPE html>
<html>
<head>
<title>Custom Travel Package</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f4f7fb;
}

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
}

.container{
    width:90%;
    max-width:900px;
    margin:40px auto;
}

.package-card{
    background:white;
    border-radius:18px;
    padding:35px;
    box-shadow:0 10px 30px rgba(0,0,0,0.10);
}

.package-card h2{
    color:#0d47a1;
    margin-bottom:25px;
    text-align:center;
}

.form-group{
    margin-bottom:20px;
}

label{
    display:block;
    margin-bottom:8px;
    font-weight:600;
    color:#333;
}

input,
select{
    width:100%;
    padding:14px;
    border:1px solid #d6dce5;
    border-radius:10px;
    font-size:15px;
    background:#f9fbff;
}

input:focus,
select:focus{
    outline:none;
    border-color:#1976d2;
    box-shadow:0 0 8px rgba(25,118,210,0.25);
}

.services{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:18px;
}

.service-box{
    background:#f8faff;
    padding:18px;
    border-radius:12px;
    border-left:5px solid #1976d2;
}

.service-box label{
    margin-bottom:10px;
    font-weight: 700;
    color: purple;
    font-size: 16px;
}

.btn{
    width:100%;
    padding:15px;
    border:none;
    border-radius:10px;
    background:linear-gradient(135deg,#1976d2,#0d47a1);
    color:white;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    margin-top:25px;
    transition:0.3s;
}

.btn:hover{
    transform:translateY(-2px);
    box-shadow:0 8px 20px rgba(0,0,0,0.15);
}

.place-name{
    background:#eef4ff;
    color:#0d47a1;
    font-weight:bold;
}

.footer-note{
    text-align:center;
    margin-top:20px;
    color:#666;
}

@media(max-width:700px){

    .header{
        padding:30px;
    }

    .header h1{
        font-size:28px;
    }

    .package-card{
        padding:25px;
    }
}

</style>

</head>
<body>
    
     <%@ include file="backButton.jsp" %>

<div class="header">
    <h1>Customize Your Travel Package</h1>
    <p>Create your own travel experience according to your needs.</p>
</div>

<div class="container">

    <div class="package-card">

        <h2>Travel Package Builder</h2>

        <form action="customPackageResult.jsp" method="post">

            <div class="form-group">
                <label>Selected Place</label>
                <input type="text"
                       name="place"
                       value="<%= place %>"
                       readonly
                       class="place-name">
            </div>

            <div class="services">

               <div class="service-box">

    <label>? Hotel</label>

    <select name="hotel">

        <option value="">Select Hotel</option>

        <%
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/travelmanagementsystem",
                "root",
                "Mysql@1234"
            );

            PreparedStatement ps = con.prepareStatement(
               "SELECT DISTINCT name, costperperson FROM hotel"
            );

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
        %>

                <option value="<%=rs.getInt("costperperson")%>">
                    <%=rs.getString("name")%>
                    - &#8377;<%=rs.getInt("costperperson")%>
                </option>

        <%
            }

            rs.close();
            ps.close();
            con.close();

        } catch(Exception e) {
%>

    <option value="">Error: <%=e.getMessage()%></option>

<%
}
%>

    </select>

</div>

                <div class="service-box">
                    <label>?Cab Service</label>
                    <select name="cab">
                        <option value="0">No Cab</option>
                        <option value="2000">Cab - &#8377;2000</option>
                    </select>
                </div>

                <div class="service-box">
                    <label>??? Tourist Guide</label>
                    <select name="guide">
                        <option value="0">No Guide</option>
                        <option value="1500">Guide - &#8377;1500</option>
                    </select>
                </div>

                <div class="service-box">
                    <label>? Food Package</label>
                    <select name="food">
                        <option value="0">No Food</option>
                        <option value="1000">Food - &#8377;1000</option>
                    </select>
                </div>

                <div class="service-box">
                    <label>? Entry Ticket</label>
                    <select name="ticket">
                        <option value="0">No Ticket</option>
                        <option value="1100">Entry Ticket - &#8377;1100</option>
                    </select>
                </div>

            </div>

            <button type="submit" class="btn">
                Calculate Total Package Cost
            </button>

        </form>

        <div class="footer-note">
            Select only the services you need and get your customized package.
        </div>

    </div>

</div>

</body>
</html>