<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Cart</title>

    <style>
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .btn {
            padding: 5px 10px;
            background: red;
            color: white;
            border: none;
            cursor: pointer;
        }

        .top {
            text-align: center;
            margin: 20px;
        }
    </style>
</head>

<body>

<div class="top">
    <h2>🛒 Your Cart</h2>
    <a href="${pageContext.request.contextPath}/">⬅ Continue Shopping</a>
</div>

<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Total</th>
            <th>Action</th>
        </tr>
    </thead>

    <tbody id="cartTable"></tbody>
</table>

<h3 style="text-align:center; margin-top:20px;">
    Grand Total: ₹ <span id="grandTotal">0</span>
</h3>

<div style="text-align:center; margin-top:20px;">
    <a href="${pageContext.request.contextPath}/checkout">
        <button>Proceed to Checkout</button>
    </a>
</div>

<script>

function loadCart() {

    // ✅ SAFE parsing (prevents crashes)
    let cart = JSON.parse(localStorage.getItem("cart") || "[]");
    let table = document.getElementById("cartTable");

    table.innerHTML = "";

    let grandTotal = 0;

    cart.forEach((item, index) => {

        let price = Number(item.price) || 0;
        let qty = Number(item.qty) || 0;
        let total = price * qty;

        grandTotal += total;

        // ✅ safer HTML build (no template literal issues in JSP)
        let row =
            "<tr>" +
                "<td>" + (item.name || "N/A") + "</td>" +
                "<td>₹ " + price + "</td>" +
                "<td>" + qty + "</td>" +
                "<td>₹ " + total + "</td>" +
                "<td><button class='btn' onclick='removeItem(" + index + ")'>Remove</button></td>" +
            "</tr>";

        table.innerHTML += row;
    });

    document.getElementById("grandTotal").innerText = grandTotal;
}

function removeItem(index) {

    let cart = JSON.parse(localStorage.getItem("cart") || "[]");

    cart.splice(index, 1);

    localStorage.setItem("cart", JSON.stringify(cart));

    loadCart();
}

// INIT
loadCart();

</script>

</body>
</html>