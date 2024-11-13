<?php
// Include database connection
include('../Asset/Connection/Connection.php'); // Adjust the path to your actual connection file
include('Head.php');

// Get user ID from URL
$user_id = isset($_GET['user_id']) ? intval($_GET['user_id']) : 0;

// Check if user_id is valid
if ($user_id <= 0) {
    echo "Invalid user ID.";
    exit;
}

// Query to retrieve bookings for the specific user
$query = "
    SELECT b.booking_id, b.booking_date, b.booking_fordate, b.booking_address, b.booking_fortime, b.booking_amount, 
           b.booking_details, b.booking_status, b.booking_count, b.booking_service, p.place_name, b.packagehead_id
    FROM tbl_booking b
    INNER JOIN tbl_place p ON b.place_id = p.place_id
    WHERE b.user_id = $user_id
    ORDER BY b.booking_date DESC
";

$result = $con->query($query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Bookings</title>
    <link rel="stylesheet" href="path/to/bootstrap.css"> <!-- Adjust path as needed -->
    <link rel="stylesheet" href="path/to/your/custom.css"> <!-- Adjust path to your custom stylesheet -->
    <style>
        body {
            background-color: #f8f9fa; /* Light background color */
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 20px;
            background-color: white; /* White background for content area */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 1434px; /* Adjusted width */
            margin: 20px auto; /* Centered margin */
        }
        h2 {
            color: #343a40; /* Dark color for headings */
            margin-bottom: 20px;
            text-align: center; /* Centered heading */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #007bff; /* Bootstrap primary color for headers */
            color: white; /* White text for headers */
        }
        .nav-links {
            text-align: center;
            margin-top: 20px;
        }
        .nav-links a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .nav-links a:hover {
            text-decoration: underline; /* Underline on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>User Bookings</h2>
        <table class="table table-striped table-bordered">
            <head>
                <tr>
                    <th>Booking ID</th>
                    <th>Booking Date</th>
                    <th>Event Date</th>
                    <th>Place</th>
                    <th>Address</th>
                    <th>Time</th>
                    <th>Booking Details</th>
                    <th>Package Info</th>
                    <th>Service</th>
                    <th>Status</th>
                </tr>
            </head>
            <tbody>
                <?php
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>{$row['booking_id']}</td>";
                        echo "<td>{$row['booking_date']}</td>";
                        echo "<td>{$row['booking_fordate']}</td>";
                        echo "<td>{$row['place_name']}</td>";
                        echo "<td>{$row['booking_address']}</td>";
                        echo "<td>{$row['booking_fortime']}</td>";
                        echo "<td>{$row['booking_details']}</td>";

                        // Create a link to the viewpackageinfo page with the packagehead_id as a URL parameter
                        echo "<td><a href='viewpackageinfo.php?packagehead_id={$row['packagehead_id']}' class='btn btn-info btn-sm'>View Package</a></td>";

                        // Map booking service status
                        $serviceLabel = $row['booking_service'] == 1 ? "Yes" : "No";
                        echo "<td>{$serviceLabel}</td>";

                        // Map booking status
                        switch ($row['booking_status']) {
                            case 1: $statusLabel = "Accepted"; break;
                            case 2: $statusLabel = "Rejected"; break;
                            case 3: $statusLabel = "Completed"; break;
                            case 4: $statusLabel = "Cancelled"; break;
                            default: $statusLabel = "Unknown"; break;
                        }
                        echo "<td>{$statusLabel}</td>"; // Status display

                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='10'>No bookings found for this user.</td></tr>"; // Adjusted colspan
                }
                ?>
            </tbody>
        </table>
        <div class="nav-links">
            <a href="adminhomepage.php">Home</a>
        </div>
    </div>
</body>
</html>

<?php
include('Foot.php');
$con->close();
?>
