<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Train Reservation System</title>
    <style>
        :root {
            --primary-color: #3a7bd5;
            --secondary-color: #f0f4f8;
            --text-color: #333;
            --accent-color: #00bcd4;
            --error-color: #f44336;
            --success-color: #4CAF50;
            --border-radius: 8px;
            --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            width: 100%;
            background: #fff;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
            display: flex;
        }
        
        .image-container {
            flex: 1;
            background-color: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            position: relative;
        }
        
        .train-image {
            width: 100%;
            height: auto;
            max-height: 600px;
            object-fit: cover;
            border-radius: var(--border-radius);
        }
        
        .form-container {
            flex: 1;
            padding: 30px;
        }
        
        .title {
            font-size: 26px;
            font-weight: 600;
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 25px;
            position: relative;
        }
        
        .title::after {
            content: '';
            position: absolute;
            left: 50%;
            bottom: -8px;
            transform: translateX(-50%);
            height: 3px;
            width: 50px;
            background: var(--primary-color);
            border-radius: 5px;
        }
        
        .content form .user-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        
        form .user-details .input-box {
            width: calc(100% / 2 - 15px);
            margin-bottom: 20px;
        }
        
        form .user-details .input-box.full-width {
            width: 100%;
        }
        
        .user-details .input-box .details {
            display: block;
            font-weight: 500;
            margin-bottom: 8px;
            color: var(--text-color);
        }
        
        .user-details .input-box input,
        .user-details .input-box select {
            height: 45px;
            width: 100%;
            outline: none;
            border: 1px solid #ccc;
            padding: 0 15px;
            font-size: 16px;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
        }
        
        .user-details .input-box input:focus,
        .user-details .input-box select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(58, 123, 213, 0.2);
        }
        
        .button {
            text-align: center;
            margin-top: 10px;
        }
        
        .button input[type="submit"] {
            padding: 12px 24px;
            background: var(--primary-color);
            color: #fff;
            border: none;
            font-size: 16px;
            font-weight: 500;
            border-radius: var(--border-radius);
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .button input[type="submit"]:hover {
            background: #2a5db0;
            transform: translateY(-2px);
        }
        
        .routes-table {
            margin-top: 30px;
            width: 100%;
            border-collapse: collapse;
        }
        
        .routes-table th {
            background-color: var(--primary-color);
            color: white;
            padding: 12px;
            text-align: left;
        }
        
        .routes-table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        
        .routes-table tr:nth-child(even) {
            background-color: var(--secondary-color);
        }
        
        .routes-table tr:hover {
            background-color: #e6f2ff;
        }
        
        .table-actions {
            display: flex;
            gap: 8px;
        }
        
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.2s;
        }
        
        .btn-book {
            background-color: var(--success-color);
            color: white;
        }
        
        .btn-book:hover {
            background-color: #3d8b40;
        }
        
        .btn-view {
            background-color: var(--accent-color);
            color: white;
        }
        
        .btn-view:hover {
            background-color: #0097a7;
        }
        
        .section-title {
            font-size: 20px;
            color: var(--text-color);
            margin: 30px 0 15px;
            padding-bottom: 5px;
            border-bottom: 1px solid #eee;
        }
        
        .filter-container {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .filter-container .input-box {
            flex: 1;
        }
        
        /* Responsive design */
        @media (max-width: 950px) {
            .container {
                flex-direction: column;
            }
            
            .image-container {
                order: -1;
                padding: 20px 20px 0 20px;
            }
            
            .train-image {
                max-height: 300px;
            }
        }
        
        @media (max-width: 750px) {
            form .user-details .input-box {
                width: 100%;
                margin-bottom: 15px;
            }
            
            .filter-container {
                flex-direction: column;
                gap: 10px;
            }
        }
        
        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .container {
            animation: fadeIn 0.8s ease-out;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <div class="title">Train Route Registration</div>
            <div class="content">
                <form action="addTroute" method="post" id="routeForm">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Starting Station</span>
                            <input type="text" placeholder="Enter starting station" name="sstation" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Ending Station</span>
                            <input type="text" placeholder="Enter ending station" name="estation" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Departure Time</span>
                            <input type="time" placeholder="Enter departure time" name="depTime" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Arrival Time</span>
                            <input type="time" placeholder="Enter arrival time" name="arrTime" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Train Number</span>
                            <input type="text" placeholder="Enter train number" name="trainNumber" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Train Name</span>
                            <input type="text" placeholder="Enter train name" name="trainName" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Ticket Price</span>
                            <input type="number" placeholder="Enter ticket price" name="tprice" min="0" step="0.01" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Available Seats</span>
                            <input type="number" placeholder="Enter available seats" name="seats" min="0" required>
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" value="Register Route">
                    </div>
                </form>
            </div>
            
            <h3 class="section-title">Available Routes</h3>
            <div class="filter-container">
                <div class="input-box">
                    <input type="text" id="fromFilter" placeholder="Filter by from station" onkeyup="filterRoutes()">
                </div>
                <div class="input-box">
                    <input type="text" id="toFilter" placeholder="Filter by to station" onkeyup="filterRoutes()">
                </div>
            </div>
            
            <table class="routes-table">
                <thead>
                    <tr>
                        <th>Train</th>
                        <th>Route</th>
                        <th>Time</th>
                        <th>Price</th>
                        <th>Available</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="routesTableBody">
                    <tr>
                        <td>12711 Pinakini</td>
                        <td>Chennai → Hyderabad</td>
                        <td>07:00 → 16:30</td>
                        <td>₹850</td>
                        <td>42</td>
                        <td class="table-actions">
                            <button class="btn btn-book">Book</button>
                            <button class="btn btn-view">View</button>
                        </td>
                    </tr>
                    <tr>
                        <td>12622 Tamil Nadu</td>
                        <td>Delhi → Chennai</td>
                        <td>22:30 → 06:45</td>
                        <td>₹1350</td>
                        <td>16</td>
                        <td class="table-actions">
                            <button class="btn btn-book">Book</button>
                            <button class="btn btn-view">View</button>
                        </td>
                    </tr>
                    <tr>
                        <td>12951 Rajdhani</td>
                        <td>Mumbai → Delhi</td>
                        <td>16:35 → 08:35</td>
                        <td>₹1650</td>
                        <td>28</td>
                        <td class="table-actions">
                            <button class="btn btn-book">Book</button>
                            <button class="btn btn-view">View</button>
                        </td>
                    </tr>
                    <tr>
                        <td>12259 Duronto</td>
                        <td>Sealdah → Bangalore</td>
                        <td>11:45 → 19:15</td>
                        <td>₹1100</td>
                        <td>35</td>
                        <td class="table-actions">
                            <button class="btn btn-book">Book</button>
                            <button class="btn btn-view">View</button>
                        </td>
                    </tr>
                    <tr>
                        <td>12301 Howrah Mail</td>
                        <td>Howrah → Mumbai</td>
                        <td>23:55 → 04:15</td>
                        <td>₹1450</td>
                        <td>7</td>
                        <td class="table-actions">
                            <button class="btn btn-book">Book</button>
                            <button class="btn btn-view">View</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <div class="image-container">
            <img src="gallery-1.jpg" alt="Train" class="train-image">
        </div>
    </div>
</body>
</html>