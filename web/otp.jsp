<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>OTP Verification</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .box {
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            width: 350px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        h2 {
            color: #0072ff;
            margin-bottom: 10px;
        }

        .otp-show {
            background: #f1f7ff;
            padding: 10px;
            border-radius: 6px;
            margin: 15px 0;
            font-weight: bold;
            color: #333;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
            text-align: center;
            letter-spacing: 3px;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            background: #0072ff;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }

        button:hover {
            background: #005bb5;
        }

        .note {
            font-size: 13px;
            color: #777;
            margin-top: 10px;
        }
    </style>
</head>

<body>
    
     <%@ include file="backButton.jsp" %>

<div class="box">

    <h2>OTP Verification</h2>
    <p>Enter the OTP sent to your account</p>

    <%
    Integer otp = (Integer) session.getAttribute("otp");
    %>

    <div class="otp-show">
        Your OTP: <%= otp %>
    </div>

    <form action="VerifyOtpServlet" method="post">
        <input type="text" name="userOtp" placeholder="Enter OTP" required>
        <button type="submit">Verify OTP</button>
    </form>

    <p class="note">Please enter correct OTP to Request Send Successfully To Administer</p>

</div>

</body>
</html>