
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout Successfully</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f3f6fb;
            padding: 20px;
        }

        .logout-container {
            width: 100%;
            max-width: 420px;
            background: #ffffff;
            padding: 40px 30px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.08);
        }

        .success-icon {
            width: 75px;
            height: 75px;
            margin: 0 auto 22px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            background: #dcfce7;
            color: #16a34a;
            font-size: 38px;
        }

        h2 {
            color: #1f2937;
            font-size: 24px;
            margin-bottom: 12px;
        }

        p {
            color: #6b7280;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 28px;
        }

        .login-btn {
            display: block;
            width: 100%;
            padding: 13px;
            background: #2563eb;
            color: #ffffff;
            text-decoration: none;
            font-size: 15px;
            font-weight: 600;
            border-radius: 7px;
            transition: background 0.2s;
        }

        .login-btn:hover {
            background: #1d4ed8;
        }

        .footer-text {
            margin-top: 22px;
            margin-bottom: 0;
            font-size: 12px;
            color: #9ca3af;
        }
    </style>
</head>

<body>

    <div class="logout-container">

        <div class="success-icon">&#10003;</div>

        <h2>Logged Out Successfully!</h2>

        <p>
            You have been securely logged out of your account.
            Thank you for visiting us.
        </p>

        <a href="login.html" class="login-btn">
            Back to Login
        </a>

        <p class="footer-text">
            Your session has ended successfully.
        </p>

    </div>

</body>
</html>
