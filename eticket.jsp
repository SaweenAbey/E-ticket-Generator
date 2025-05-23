<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Train E-Ticket</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('pexels-genine-alyssa-pedreno-andrada-1263127-2403209.jpg');
            background-size: cover;
            background-position: center;
            color: #333;
        }
        .ticket {
            width: 320px;
            border: 1px solid #ddd;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            position: relative;
        }
        .ticket h2 {
            font-size: 24px;
            margin-bottom: 15px;
        }
        .ticket p {
            font-size: 14px;
            margin: 8px 0;
            color: #555;
        }
        .qr-code {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }
        .qr-code img {
            width: 120px;
            height: 120px;
        }
        .download-btn {
            margin-top: 15px;
        }
        #notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #10b981;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: none;
            z-index: 999;
        }
    </style>
</head>
<body onload="getready()">
    
    <!-- Notification -->
    <div id="notification">🎉 E-Ticket image is ready. Download started!</div>

    <div class="ticket" id="ticket">
        <h2>Train E-Ticket</h2>
        <p><strong>Station:</strong> ${param.source}</p>
        <p><strong>Destination:</strong> ${param.des}</p>
        <p><strong>Ticket Value:</strong> Rs.${param.rice}</p>

        <div class="qr-code">
            <img id="qrCode" src="" alt="QR Code">
        </div>
    </div>
        <div class="download-btn">
            <button onclick="downloadTicket()" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700"><i class="ri-download-2-fill"></i>Download Receipt</button>
        </div>


   <script>
async function getready() {
    const sid = "${param.source}";
    const did = "${param.des}";
    const tid = "${param.rice}";
    const qrData = sid + " to " + did + " - Rs." + tid;

    const qrCode = document.getElementById('qrCode');

    // Fetch QR code as Blob and convert to Base64
    const response = await fetch("https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=" + encodeURIComponent(qrData), {
        mode: 'cors'
    });
    const blob = await response.blob();

    const reader = new FileReader();
    reader.onloadend = function () {
        qrCode.src = reader.result;
    };
    reader.readAsDataURL(blob);
}

function downloadTicket() {
    const ticket = document.getElementById("ticket");

    // Ensure image is fully loaded
    const qrImage = document.getElementById('qrCode');
    if (!qrImage.complete || qrImage.naturalHeight === 0) {
        qrImage.onload = () => captureTicket(ticket);
    } else {
        captureTicket(ticket);
    }
}

function captureTicket(ticket) {
    html2canvas(ticket).then(canvas => {
        const link = document.createElement("a");
        link.download = "Train_E-Ticket.png";
        link.href = canvas.toDataURL();
        link.click();

        const note = document.getElementById("notification");
        note.style.display = "block";
        setTimeout(() => {
            note.style.display = "none";
        }, 3000);
    });
}
</script>


</body>
</html>
