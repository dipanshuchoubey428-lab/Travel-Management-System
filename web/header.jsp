<%@ page contentType="text/html; charset=UTF-8" %>

<div class="header">
    <div class="logo">✈ Travel Management System</div>

    <input type="text" class="search" placeholder="Search here...">

    <div class="right-section">
        <i class="fa fa-bell"></i>
        <span>Admin Panel</span>
        <span><%= session.getAttribute("username") %></span>
        <span id="datetime"></span>
        <a href="logout.jsp" style="color:red;">Logout</a>
    </div>
</div>

<script>
function updateDateTime(){
    const now = new Date();
    const date = now.toLocaleDateString();
    const time = now.toLocaleTimeString();
    document.getElementById("datetime").innerHTML = date + " | " + time;
}
setInterval(updateDateTime, 1000);
updateDateTime();
</script> 