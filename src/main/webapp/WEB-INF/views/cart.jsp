<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Cart</title>

    <style>
     
body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, sans-serif;
    background: #fffff0;
    color: #333;
}


.top {
    text-align: center;
    padding: 20px;
}

.top h2 {
    margin-bottom: 10px;
    color: #3c000b;
}

.top a {
    text-decoration: none;
    color: #3c000b;
    font-weight: bold;
}


table {
    width: 85%;
    margin: 20px auto;
    border-collapse: collapse;
    background: white;

    border-radius: 12px;
    overflow: hidden;

    box-shadow: 0 6px 20px rgba(0,0,0,0.08);
}


th {
    background: #3c000b;
    color: white;
    padding: 14px;
    font-weight: 600;
}


td {
    padding: 12px;
    border-bottom: 1px solid #eee;
}


tr:hover {
    background: #fafafa;
}


button {
    padding: 6px 12px;
    background: #3c000b;
    color: white;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    transition: 0.3s;
}

button{
    background: #5a0015;
}


#grandTotal {
    color: #3c000b;
    font-weight: bold;
}


h3 {
    text-align: center;
    margin-top: 25px;
    font-size: 20px;
}


.checkout-btn {
    padding: 12px 25px;
    background: #3c000b;
    color: white;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    font-size: 15px;
    font-weight: bold;
    transition: 0.3s;
}

.checkout-btn:hover {
    background: #5a0015;
    transform: translateY(-2px);
}


.checkout-wrap {
    text-align: center;
    margin: 25px 0 40px;
}
    </style>
</head>

<body>

<div class="top">
    <h2>🛒 Cart</h2>
    <a href="${pageContext.request.contextPath}/"> Continue Shopping</a>
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

    
    let cart = JSON.parse(localStorage.getItem("cart") || "[]");
    let table = document.getElementById("cartTable");

    table.innerHTML = "";

    let grandTotal = 0;

    cart.forEach((item, index) => {

        let price = Number(item.price) || 0;
        let qty = Number(item.qty) || 0;
        let total = price * qty;

        grandTotal += total;

       
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


loadCart();

</script>

</body>
</html>