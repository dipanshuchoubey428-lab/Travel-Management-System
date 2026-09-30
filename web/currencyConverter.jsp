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

    ps.setString(1,username);
    ps.setString(2,"Currency Converter");

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
<title>Currency Converter</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:linear-gradient(135deg,#0d47a1,#1976d2);
    min-height:100vh;
}

.header{
    text-align:center;
    color:white;
    padding:50px 20px 20px;
}

.header h1{
    font-size:42px;
    margin-bottom:10px;
}

.header p{
    opacity:0.9;
}

.container{
    width:90%;
    max-width:600px;
    margin:30px auto;
}

.card{
    background:white;
    border-radius:20px;
    padding:35px;
    box-shadow:0 15px 35px rgba(0,0,0,0.15);
}

label{
    display:block;
    margin-bottom:8px;
    font-weight:600;
    color:#333;
}

input,select{
    width:100%;
    padding:14px;
    border:1px solid #d6dce5;
    border-radius:10px;
    margin-bottom:20px;
    font-size:15px;
}

input:focus,
select:focus{
    outline:none;
    border-color:#1976d2;
}

button{
    width:100%;
    padding:15px;
    border:none;
    border-radius:10px;
    background:linear-gradient(135deg,#1976d2,#0d47a1);
    color:white;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
}

button:hover{
    opacity:0.95;
}

.result-box{
    margin-top:25px;
    background:#f4f8ff;
    border-left:5px solid #1976d2;
    padding:20px;
    border-radius:10px;
}

#result{
    color:#0d47a1;
    font-size:22px;
    font-weight:bold;
}

.back-btn{
    display:inline-block;
    margin-top:25px;
    text-decoration:none;
    background:#eef3fb;
    color:#0d47a1;
    padding:12px 20px;
    border-radius:10px;
    font-weight:bold;
}

.back-btn:hover{
    background:#dfe9f8;
}

.rates{
    margin-top:25px;
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:12px;
}

.rate-card{
    background:#fafafa;
    padding:15px;
    border-radius:10px;
    text-align:center;
    border:1px solid #e5e5e5;
}

.rate-card h4{
    color:#1976d2;
    margin-bottom:5px;
}

</style>

<script>

function convertCurrency(){

    var amount = parseFloat(document.getElementById("amount").value);
    var currency = document.getElementById("currency").value;
    var result = 0;

    if(currency=="USD"){
        result = amount * 83;
    }
    else if(currency=="GBP"){
        result = amount * 105;
    }
    else if(currency=="EUR"){
        result = amount * 90;
    }
    else if(currency=="AUD"){
        result = amount * 55;
    }

    document.getElementById("result").innerHTML =
        "? " + result.toFixed(2);
}

</script>

</head>
<body>
    
    <%@ include file="backButton.jsp" %>

<div class="header">
    <h1>? Currency Converter</h1>
    <p>Convert foreign currencies into Indian Rupees (INR)</p>
</div>

<div class="container">

    <div class="card">

        <label>Enter Amount</label>
        <input type="number"
               id="amount"
               placeholder="Enter Amount">

        <label>Select Currency</label>
        <select id="currency">
            <option value="USD">USD ? INR</option>
            <option value="GBP">GBP ? INR</option>
            <option value="EUR">EUR ? INR</option>
            <option value="AUD">AUD ? INR</option>
        </select>

        <button onclick="convertCurrency()">
            Convert Currency
        </button>

        <div class="result-box">
            <h4>Converted Amount</h4>
            <div id="result">? 0.00</div>
        </div>

        <div class="rates">

            <div class="rate-card">
                <h4>USD</h4>
                <p>?83</p>
            </div>

            <div class="rate-card">
                <h4>GBP</h4>
                <p>?105</p>
            </div>

            <div class="rate-card">
                <h4>EUR</h4>
                <p>?90</p>
            </div>

            <div class="rate-card">
                <h4>AUD</h4>
                <p>?55</p>
            </div>

        </div>

        <a href="dashboard.jsp" class="back-btn">
            ? Back to Dashboard
        </a>

    </div>

</div>

</body>
</html>