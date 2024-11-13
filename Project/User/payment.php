<?php
ob_start();

include("../Asset/Connection/Connection.php");
if (isset($_POST["btn_pay"])) {
    // Generate a unique transaction ID
    $transactionId = uniqid('txn_', true); // Prefix with 'txn_' for clarity

    // Update booking status and insert transaction ID
    $a = "UPDATE tbl_booking SET booking_status='3', transaction_id='$transactionId' WHERE booking_id='" . $_GET["bid"] . "'";
    
    if ($con->query($a)) {
        ?>
        <script>
            alert('Payment Completed. Transaction ID: <?php echo $transactionId; ?>');
            window.location = "MyBookings.php";
        </script>
        <?php
    } else {
        echo "<script>alert('Failed to update booking status.')</script>";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            background-color: #f5f5f5;
            font-family: Arial, Helvetica, sans-serif;
        }
        .wrapper {
            background-color: #fff;
            width: 500px;
            padding: 25px;
            margin: 25px auto 0;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
        }
        .wrapper h2 {
            background-color: #fcfcfc;
            color: #7ed321;
            font-size: 24px;
            padding: 10px;
            margin-bottom: 20px;
            text-align: center;
            border: 1px dotted #333;
        }
        h4 {
            padding-bottom: 5px;
            color: #7ed321;
        }
        .input-group {
            margin-bottom: 8px;
            width: 100%;
            position: relative;
            display: flex;
            flex-direction: row;
            padding: 5px 0;
        }
        .input-box {
            width: 100%;
            margin-right: 12px;
            position: relative; 
        }
        .input-box:last-child {
            margin-right: 0;
        }
        .name {
            padding: 14px 10px 14px 50px;
            width: 100%;
            background-color: #fcfcfc;
            border: 1px solid #00000033;
            outline: none;
            letter-spacing: 1px;
            transition: 0.3s;
            border-radius: 3px;
            color: #333;
        }
        .name:focus, .dob:focus {
            box-shadow: 0 0 2px 1px #7ed32180;
            border: 1px solid #7ed321;
        }
        .input-box .icon {
            width: 48px;
            display: flex;
            justify-content: center;
            position: absolute;
            padding: 15px;
            top: 0px;
            left: 0px;
            color: #333;
            background-color: #f1f1f1;	
            border-radius: 2px 0 0 2px;
            transition: 0.3s;
            font-size: 20px;
            pointer-events: none;
            border: 1px solid #000000033;
            border-right: none;
        }
        .name:focus + .icon {
            background-color: #7ed321;
            color: #fff;
            border-right: 1px solid #7ed321;
        }
        .radio:checked + label {
            background-color: #7ed321;
            color: #fcfcfc;
        }
        .dob {
            width: 30%;
            padding: 14px;
            text-align: center;
            background-color: #fcfcfc;
            border: 1px solid #c0bfbf;
            border-radius: 3px;
        }
        .radio {
            display: none;
        }
        .input-box label {
            width: 50%;
            padding: 13px;
            background-color: #fcfcfc;
            display: inline-block;
            float: left;
            text-align: center;
            border: 1px solid #c0bfbf; 
        }
        .input-box label:first-of-type {
            border-top-left-radius: 3px;
            border-bottom-left-radius: 3px;
            border-right: none;
        }
        .input-box label:last-of-type {
            border-top-right-radius: 3px;
            border-bottom-right-radius: 3px;
        }
        input[type=submit] {
            width: 100%;
            background: #7ed321;
            color: #fff;
            padding: 15px;
            border-radius: 4px;
            font-size: 16px;
            transition: all 0.35s ease;
        }
        input[type=submit]:hover {
            cursor: pointer;
            background: #5eb105;
        }
        .nav-links {
            text-align: center;
            padding: 15px 0;
        }
        .nav-links a {
            background: #7ed321;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s ease;
        }
        .nav-links a:hover {
            background: #5eb105;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
    <title>PSST - Payment Gateway</title>
</head>
<body>
    <div class="wrapper">
        <h2>Payment Gateway</h2>
        <form method="POST">
            <h4>Account</h4>
            <div class="input-group">
                <div class="input-box">
                    <input class="name" type="text" name="txtname" id="txtname" placeholder="First Name" required>
                    <i class="fa fa-user icon" aria-hidden="true"></i>
                </div>
                <div class="input-box">
                    <input class="name" type="text" name="txtnname" id="txtnname" placeholder="Second Name" required>
                    <i class="fa fa-user icon" aria-hidden="true"></i>
                </div>
            </div>
            <div class="input-group">
                <div class="input-box">
                    <input class="name" type="email" name="txtemail" id="txtemail" placeholder="Email Address" required>
                    <i class="fa fa-envelope icon" aria-hidden="true"></i>
                </div>
            </div>	
            
            <div class="input-group">
                <div class="input-box">
                    <h4>Payment Details</h4>
                    <input type="radio" name="rdbpay" id="cc" checked class="radio">
                    <label for="cc">
                        <span><i class="fa fa-cc-visa" aria-hidden="true"></i> Credit Card</span>
                    </label>
                    <input type="radio" name="rdbpay" id="dc" class="radio">
                    <label for="dc">
                        <span><i class="fa fa-cc-visa" aria-hidden="true"></i> Debit Card</span>
                    </label>
                </div>
            </div>
            <div class="input-group">
                <div class="input-box">
                    <input class="name" type="tel" id="txtcardno" name="txtcardno" required data-mask="0000 0000 0000 0000" placeholder="Card Number">
                    <i class="fa fa-credit-card icon" aria-hidden="true"></i>
                </div>
            </div>
            <div class="input-group">
                <div class="input-box">
                    <input class="name" type="text" name="txtcvc" id="txtcvc" data-mask="000" placeholder="CVC" required>
                    <i class="fa fa-user icon" aria-hidden="true"></i>
                </div>
                <div class="input-box">
                    <input class="name" type="text" name="txtmonthyear" id="txtmonthyear" data-mask="00/00" placeholder="MM/YY" required>
                    <i class="fa fa-calendar-alt icon" aria-hidden="true"></i>
                </div>
            </div>
            <input type="submit" name="btn_pay" value="Pay Now">
        </form>
        <div class="nav-links">
            <a href="MyBookings.php">Back to My Bookings</a>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#txtcardno').mask('0000 0000 0000 0000');
            $('#txtcvc').mask('000');
            $('#txtmonthyear').mask('00/00');
            $('#txtdate').mask('00');
            $('#txtmonth').mask('00');
            $('#txtyear').mask('0000');
        });

        function validateExpirationDate(inputValue) {
        const month = inputValue.slice(0, 2); // Extract month (assuming format MMYY)
        const year = inputValue.slice(2, 4); // Extract year (assuming format MMYY)

        // Get current date
        const currentDate = new Date();
        const currentYear = currentDate.getFullYear() % 100; // Get last two digits of current year
        const currentMonth = currentDate.getMonth() + 1; // getMonth() returns 0-11, so add 1

        // Validate month is between 1 and 12
        const isValidMonth = /^\d{2}$/.test(month) && parseInt(month, 10) >= 1 && parseInt(month, 10) <= 12;

        // Validate year is equal to or greater than current year
        const isValidYear = /^\d{2}$/.test(year) && parseInt(year, 10) >= currentYear;

        let isValidDate = false;

        if (isValidMonth && isValidYear) {
            const expYear = parseInt(year, 10);
            const expMonth = parseInt(month, 10);

            if (expYear > currentYear || (expYear === currentYear && expMonth >= currentMonth)) {
                isValidDate = true;
            }
        }

        if (!isValidDate) {
            // Handle invalid input (e.g., show error message, disable form submission)
            console.log('Invalid expiration date');
            alert('Invalid expiration date');
            document.getElementById("txtmonthyear").value = '';
        }
    }

    // Attach the validation function to the input field
    document.getElementById("txtmonthyear").addEventListener("blur", function() {
        const inputValue = this.value.replace("/", ""); // Remove the '/' character to match MMYY format
        validateExpirationDate(inputValue);
    });
    </script>
</body>
</html>
