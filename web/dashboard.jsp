<%@ page contentType="text/html; charset=UTF-8" %>

<%
String username = (String)session.getAttribute("username");

if(username == null){
    response.sendRedirect("login.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>

<link rel="stylesheet" href="css/dashboardLayout.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>



/* RIGHT SIDE */
.right {
    flex: 1;
    background-image: url("<%= request.getContextPath() %>/home.jpg");
    background-size: cover;
    position: relative;
}

/* OVERLAY */
.overlay {
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.5);
}

/* CENTER */
.center {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    text-align: center;
}

h1 {
    font-size: 42px;
}

.cards {
    display: flex;
    gap: 20px;
    margin-top: 20px;
}

.card {
    background: rgba(255,255,255,0.2);
    padding: 20px;
    border-radius: 10px;
    transition: 0.3s;
}
.card:hover {
    transform: scale(1.05);
}




</style>
</head>

<body>
  
    <%@ include file="layout/header.jsp" %>
    
<!-- HEADER 
<div class="header">
    <div class="logo">✈ Travel Management System</div>

    <input type="text" class="search" placeholder="Search here...">

    <div class="right-section">
        <i class="fa fa-bell"></i>
        <span>Admin Panel</span>
        <span><%= username %></span>
        <span id="datetime"></span>
        <a href="logout.jsp" style="color:red;">Logout</a>
    </div>
</div>
        -->

<div class="container">

    <%@ include file="layout/sidebar.jsp" %>
    
    <!-- MAIN CONTENT -->
    <div class="right">

        <div class="overlay"></div>

        <div class="center">
            <h1>Welcome, <%= username %> ✈️</h1>
            <p>Manage Customers, Packages & Hotels Easily</p>

            <div class="cards">
                <div class="card">👥 Customers</div>
                <div class="card">🏨 Hotels</div>
                <div class="card">📦 Packages</div>
            </div>
        </div>

    </div>

</div>


       
       <%@ include file="layout/footer.jsp" %>

<script>
    function updateDateTime(){
        const now =new Date();
        
        const date= now.toLocaleDateString();
        const time= now.toLocaleTimeString();
        
        document.getElementById("datetime").innerHTML=date + "|" +time;
    }
    setInterval(updateDateTime, 1000);
    
    //initial call
    updateDateTime();
</script>

</body>
</html>