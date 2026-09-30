<%@ page contentType="text/html; charset=UTF-8" %>

<%
String user = (String)session.getAttribute("username");
String pack = request.getParameter("package");
%>

<!DOCTYPE html>
<html>
<head>
<title>Rate Package</title>

<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

<style>
body {
    margin: 0;
    font-family: 'Roboto', sans-serif;
    background: linear-gradient(to right, #141e30, #243b55);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* CARD */
.card {
    background: #fff;
    padding: 30px;
    width: 400px;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.3);
}

/* TITLE */
.card h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #0072ff;
}

/* INPUTS */
input, select, textarea {
    width: 100%;
    padding: 10px;
    margin-top: 8px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
}

textarea {
    resize: none;
    height: 80px;
}

/* LABEL */
label {
    font-weight: 500;
    font-size: 14px;
    color: #333;
}

/* BUTTON */
button {
    width: 100%;
    padding: 12px;
    background: #0072ff;
    border: none;
    color: white;
    font-size: 16px;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    background: #0056c7;
}

/* USER TAG */
.user {
    text-align: center;
    font-size: 13px;
    color: gray;
    margin-bottom: 10px;
}
</style>

</head>

<body>

    <%@ include file="backButton.jsp" %>
<div class="card">

    <h2>⭐ Rate Your Experience</h2>

    <div class="user">Logged in as: <b><%= user %></b></div>

    <form action="RatingServlet" method="post">

        <input type="hidden" name="username" value="<%=user%>">

        <label>Package</label>
        <input type="text" name="package" value="<%=pack%>" readonly>

        <label>Rating (1 to 5)</label>
        <select name="rating">
            <option>1 ⭐</option>
            <option>2 ⭐</option>
            <option>3 ⭐</option>
            <option>4 ⭐</option>
            <option>5 ⭐</option>
        </select>

        <label>Comment</label>
        <textarea name="comment" placeholder="Write your feedback..."></textarea>

        <button type="submit">Submit Rating</button>

    </form>

</div>

</body>
</html>