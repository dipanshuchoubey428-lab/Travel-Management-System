<!DOCTYPE html>
<html>
<head>
    <title>Forget Password</title>
</head>

<body>
    
    <h2>Forget Password</h2>

<form action="ForgetPasswordServlet" method="post">

    <label>Username</label><br>
    <input type="text" name="username"><br><br>

    <label>Email</label><br>
    <input type="email" name="email"><br><br>

    <label>New Password</label><br>
    <input type="password" name="newPassword"><br><br>

    <label>Confirm Password</label><br>
    <input type="password" name="confirmPassword"><br><br>

    <button type="submit">Update Password</button>

</form>

</body>
</html>