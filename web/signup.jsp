<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
    <meta charset="UTF-8">

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url("images/sig.jpg") no-repeat center center/cover;
            height: 100vh;

            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        /* Dark overlay */
        body::before {
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            top: 0;
            left: 0;
            z-index: 0;
        }

        .signup-box {
            width: 380px;
            padding: 30px;

            /* Glass effect */
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);

            border-radius: 15px;
            border: 1px solid rgba(255,255,255,0.3);

            box-shadow: 0px 8px 32px rgba(0,0,0,0.3);
            color: white;

            position: relative;
            z-index: 1;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #fff;
        }

        label {
            font-weight: bold;
            font-size: 14px;
            color: #fff;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            border-radius: 6px;

            border: none;
            outline: none;

            background: rgba(255,255,255,0.2);
            color: #fff;
            font-size: 14px;
        }

        input::placeholder {
            color: #ddd;
        }

        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #667eea, #764ba2);
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            opacity: 0.9;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .login-link p {
            color: #eee;
        }

        .login-link a {
            text-decoration: none;
            color: #a5b4fc;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

    </style>
</head>

<body>

<div class="signup-box">

    <h2>Create Account</h2>

    <form action="SignupServlet" method="post">

        <label>Username</label>
        <input type="text" name="username" placeholder="Enter Username" required>

        <label>Email</label>
        <input type="email" name="email" placeholder="Enter Email" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit">Signup</button>

    </form>

    <div class="login-link">
        <p>Already have an account? <a href="login.html">Login</a></p>
    </div>

</div>

</body>
</html>