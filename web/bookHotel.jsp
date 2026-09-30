<%@ page import="java.sql.*" %>

<%
String username = (String)session.getAttribute("username");
String id = (String)session.getAttribute("id");
String phone = (String)session.getAttribute("phone");
String number = (String)session.getAttribute("number");

if(username == null){
    response.sendRedirect("login.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Book Hotel</title>

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
    linear-gradient(rgba(0,0,0,0.45),rgba(0,0,0,0.45)),url('images/bookedhotel.jpg');

    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
    background-attachment:fixed;

    min-height:100vh;

    display:flex;
    justify-content:center;
    align-items:center;

    padding:40px 20px;
}

/* MAIN CONTAINER */
.container{

    width:100%;
    max-width:480px;

    padding:38px;

    background:
    rgba(255,255,255,0.12);

    backdrop-filter:blur(14px);
    -webkit-backdrop-filter:blur(14px);

    border:
    1px solid rgba(255,255,255,0.18);

    border-radius:28px;

    box-shadow:
    0 15px 40px rgba(0,0,0,0.45);
}

/* HEADING */
h2{

    text-align:center;

    color:white;

    font-size:34px;
    font-weight:700;

    margin-bottom:30px;

    letter-spacing:1px;
}

/* LABELS */
label{

    display:block;

    color:#ecfeff;

    margin-bottom:8px;

    font-size:14px;
    font-weight:500;
}

/* INPUTS */
input,
select{

    width:100%;

    padding:14px 16px;

    margin-bottom:18px;

    border:none;
    outline:none;

    border-radius:14px;

    background:
    rgba(255,255,255,0.94);

    color:#0f172a;

    font-size:14px;

    transition:0.3s;

    box-shadow:
    inset 0 2px 6px rgba(0,0,0,0.12);
}

/* READONLY */
input[readonly]{
    background:#f1f5f9;
}

/* FOCUS */
input:focus,
select:focus{

    transform:scale(1.01);

    box-shadow:
    0 0 0 3px rgba(103,232,249,0.35);
}

/* PRICE BOX */
.price-box{
    background:#e2e8f0;
}

/* BUTTONS */
button,
.submit-btn{

    width:100%;

    padding:15px;

    border:none;

    border-radius:14px;

    color:white;

    font-size:15px;
    font-weight:600;

    cursor:pointer;

    transition:0.3s;
}

/* CHECK PRICE BUTTON */
button{

    background:
    linear-gradient(
        135deg,
        #06b6d4,
        #0891b2
    );

    margin-bottom:15px;
}

/* BOOK HOTEL BUTTON */
.submit-btn{

    background:
    linear-gradient(
        135deg,
        #14b8a6,
        #0f766e
    );
}

/* HOVER */
button:hover,
.submit-btn:hover{

    transform:translateY(-3px);

    box-shadow:
    0 10px 22px rgba(0,0,0,0.35);
}

/* RESPONSIVE */
@media(max-width:600px){

    .container{
        padding:28px;
    }

    h2{
        font-size:28px;
    }

}

</style>

<script>

function calculatePrice() {

    var hotelSelect = document.getElementById("hotel");

    var selectedOption =
        hotelSelect.options[hotelSelect.selectedIndex];

    var persons =
        parseInt(document.getElementById("persons").value) || 1;

    var days =
        parseInt(document.getElementById("days").value) || 1;

    var ac =
        document.getElementById("ac").value;

    var food =
        document.getElementById("food").value;


    // Hotel select nahi kiya
    if (hotelSelect.value === "") {

        alert("Please select hotel");
        return;

    }


    // Database se hotel ka price
    var roomPrice =
        parseInt(selectedOption.getAttribute("data-price")) || 0;


    // Database se AC charge
    var acCharge =
        parseInt(selectedOption.getAttribute("data-ac")) || 0;


    // Database se Food charge
    var foodCharge =
        parseInt(selectedOption.getAttribute("data-food")) || 0;


    // Non-AC hai to AC charge nahi lagega
    if (ac === "Non-AC") {

        acCharge = 0;

    }


    // Food No hai to food charge nahi lagega
    if (food === "No") {

        foodCharge = 0;

    }


    // Per person per day
    var perPersonPerDay =
        roomPrice + acCharge + foodCharge;


    // Final total
    var total =
        perPersonPerDay * persons * days;


    document.getElementById("price").value =
        "Rs " + total;
}

</script>

</head>

<body>
    
    <%@ include file="backButton.jsp" %>
    




<div class="container">

<h2>Book Hotel</h2>

<form action="bookHotelAction.jsp"
      method="post">

<label>Username</label>

<input type="text"
       name="username"
       value="<%=username%>"
       readonly>

<label>ID</label>

<input type="text"
       name="id"
       value="<%=id%>"
       readonly>

<label>Number</label>

<input type="text"
       name="number"
       value="<%=number%>"
       readonly>

<label>Phone</label>

<input type="text"
       name="phone"
       value="<%=phone%>"
       readonly>

<label>Hotel</label>

<select name="hotel" id="hotel">

<option value="">Select Hotel</option>

<%
try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/travelmanagementsystem",
        "root",
        "Mysql@1234"
    );

   PreparedStatement ps = con.prepareStatement("SELECT name, MAX(costperperson) AS costperperson, " +
    "MAX(acroom) AS acroom, MAX(foodinclude) AS foodinclude " +"FROM hotel GROUP BY name");

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
%>

<option
    value="<%=rs.getString("name")%>"
    data-price="<%=rs.getInt("costperperson")%>"
    data-ac="<%=rs.getInt("acroom")%>"
    data-food="<%=rs.getInt("foodinclude")%>">

    <%=rs.getString("name")%>

</option>

<%
    }

    rs.close();
    ps.close();
    con.close();

} catch(Exception e) {

    out.println(e);

}
%>

</select>

<label>Persons</label>

<input type="number"
       id="persons"
       name="persons"
       value="1">

<label>Days</label>

<input type="number"
       id="days"
       name="days"
       value="1">

<label>AC</label>

<select name="ac"
        id="ac">

<option>AC</option>

<option>Non-AC</option>

</select>

<label>Food</label>

<select name="food"
        id="food">

<option>Yes</option>

<option>No</option>

</select>

<label>Total Price</label>

<input type="text"
       id="price"
       name="price"
       class="price-box"
       readonly>

<button type="button"
        onclick="calculatePrice()">

    Check Price

</button>

<input type="submit"
       value="Book Hotel"
       class="submit-btn">

</form>

</div>
</body>
</html>