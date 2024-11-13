<?php
include('../Asset/Connection/Connection.php');
session_start();

if (isset($_POST["btn_submit"])) {
    $email = $_POST['txt_email'];
    $password = $_POST['txt_password'];

    // Query for admin
    $selAdmin = "SELECT * FROM tbl_admin WHERE admin_email = '$email'";
    $resultAdmin = $con->query($selAdmin);

    // Query for user
    $selUser = "SELECT * FROM tbl_user WHERE user_email = '$email'";
    $resultUser = $con->query($selUser);

    // Check if the user is an admin
    if ($dataAdmin = $resultAdmin->fetch_assoc()) {
        // Commenting out password verification logic for admin
        // if (password_verify($password, $dataAdmin['admin_password'])) {
        if ($password == $dataAdmin['admin_password']) { // Plain password comparison
            $_SESSION["aid"] = $dataAdmin["admin_id"];
            header("Location: ../Admin/adminhomepage.php");
            exit(); // Ensure no further code is executed after redirection
        }
    }

    // Check if the user is a regular user
    if ($dataUser = $resultUser->fetch_assoc()) {
        // Commenting out password verification logic for user
        // if (password_verify($password, $dataUser['user_password'])) {
        if ($password == $dataUser['user_password']) { // Plain password comparison
            $_SESSION["uid"] = $dataUser["user_id"];
            header("Location: ../User/Userhomepage.php");
            exit(); // Ensure no further code is executed after redirection
        }
    }

    // If no match, show an error message
    echo "<script>alert('Unable to login. Please verify your email and password.');</script>";
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <style>
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            margin: 0 auto;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 0px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        .form-group input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group input[type="submit"]:hover {
            background-color: #218838;
        }
        .nav-links {
            text-align: center;
            margin-top: 10px;
        }
        .nav-links a {
            color: #007bff;
            text-decoration: none;
        }
        .nav-links a:hover {
            text-decoration: underline;
        }
        body {
            background-image: url("../Asset/Templates/login/image/login.jpg");
            background-size: cover;
        }
    </style>
    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('txt_password');
            const passwordToggle = document.getElementById('show_password');

            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                passwordToggle.innerText = 'Hide Password';
            } else {
                passwordInput.type = 'password';
                passwordToggle.innerText = 'Show Password';
            }
        }
    </script>
</head>

<body>
    <div class="form-container">
        <form id="form1" name="form1" method="post" action="">
            <h2>Login</h2>
            <div class="form-group">
                <label for="txt_email">Email</label>
                <input type="text" name="txt_email" id="txt_email" required />
            </div>
            <div class="form-group">
                <label for="txt_password">Password</label>
                <input type="password" name="txt_password" id="txt_password" required />
                <span id="show_password" style="cursor:pointer; color:#007bff;" onclick="togglePassword()">Show Password</span>

            </div>
            <div class="form-group">
                <input type="submit" name="btn_submit" id="btn_submit" value="Login" />
            </div>
            <div class="nav-links">
                <a href="user.php">New User</a>
            </div>
        </form>
    </div>
</body>
</html>
