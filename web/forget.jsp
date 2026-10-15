
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>

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

        .container {
            width: 100%;
            max-width: 400px;
            background: #ffffff;
            padding: 35px 30px;
            border-radius: 12px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.08);
        }

        .icon {
            width: 55px;
            height: 55px;
            margin: 0 auto 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eaf1ff;
            color: #2563eb;
            border-radius: 50%;
            font-size: 25px;
        }

        h2 {
            text-align: center;
            color: #1f2937;
            font-size: 25px;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #6b7280;
            font-size: 14px;
            line-height: 1.5;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 17px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            color: #374151;
            font-size: 14px;
            font-weight: 600;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            font-size: 14px;
            outline: none;
            transition: 0.2s;
        }

        input:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        button {
            width: 100%;
            padding: 13px;
            margin-top: 5px;
            border: none;
            border-radius: 7px;
            background: #2563eb;
            color: white;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
        }

        button:hover {
            background: #1d4ed8;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 22px;
            color: #2563eb;
            font-size: 14px;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 450px) {
            .container {
                padding: 28px 22px;
            }
        }
    </style>
</head>

<body>

    <div class="container">

        <div class="icon">&#128274;</div>

        <h2>Forgot Password?</h2>

        <p class="subtitle">
            Enter your account details and set a new password.
        </p>

        <form action="ForgetPasswordServlet" method="post">

            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username"
                       placeholder="Enter your username" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email"
                       placeholder="Enter your registered email" required>
            </div>

            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" id="newPassword"
                       name="newPassword"
                       placeholder="Enter new password"
                       minlength="8" required>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword"
                       name="confirmPassword"
                       placeholder="Confirm new password"
                       minlength="8" required>
            </div>

            <button type="submit">Update Password</button>

        </form>

        <a href="login.jsp" class="back-link">
            &larr; Back to Login
        </a>

    </div>

</body>
</html>
