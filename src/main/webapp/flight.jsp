<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking and Payment</title>
    <style>
        /* Add your styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<section>
	<div class="container">
        <h1>Flight Booking and Payment</h1>

        <form action="processBooking.jsp" method="post">

            <!-- Flight Booking Section -->
            <h2>Flight Booking</h2>
            <label for="departure">Departure City:</label>
            <input type="text" id="departure" name="departure" required>

            <label for="destination">Destination City:</label>
            <input type="text" id="destination" name="destination" required>

            <label for="date">Departure Date:</label>
            <input type="date" id="date" name="date" required>

            <!-- Payment Section -->
            <h2>Payment</h2>
            <label for="cardNumber">Credit Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" required>

            <label for="expiryDate">Expiry Date:</label>
            <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>

            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv" required>

            <button type="submit">Submit Booking and Pay</button>
        </form>
    </div>
</section>
</html>
