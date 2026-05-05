<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>Mobile Store</title>

    <style>
       <style>
    /* ===== BASE ===== */
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #ffffff;
    }

    /* ===== NAVBAR ===== */
    .navbar {
        position: sticky;
        top: 0;
        z-index: 1000;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 12px 20px;
        background: red;
        color: white;
        transition: 0.3s ease;
    }

    .navbar.transparent {
        background: rgba(255, 0, 0, 0.75);
        backdrop-filter: blur(8px);
    }

    .logo {
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 20px;
        font-weight: bold;
    }

    .logo img {
        width: 35px;
        height: 35px;
    }

    .cart-btn {
        background: white;
        color: red;
        padding: 8px 14px;
        border-radius: 20px;
        text-decoration: none;
        font-weight: bold;
        transition: 0.3s;
    }

    .cart-btn:hover {
        background: #ffe5e5;
    }

    /* ===== SEARCH ===== */
    #search {
        width: 300px;
        padding: 10px;
        margin: 20px;
        border: 2px solid red;
        border-radius: 20px;
        outline: none;
    }

    /* ===== PRODUCT GRID ===== */
    .container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        padding: 20px;
        justify-content: center;
    }

    /* ===== CARD ===== */
    .card {
        width: 220px;
        border: 2px solid red;
        padding: 12px;
        border-radius: 14px;
        text-align: center;
        background: white;
        transition: 0.3s ease;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .card img {
        width: 100%;
        height: 150px;
        object-fit: cover;
        border-radius: 10px;
    }

    /* ===== MODERN BUTTON ===== */
    .btn {
        padding: 8px 12px;
        background: white;
        color: red;
        border: 2px solid red;
        border-radius: 20px;
        cursor: pointer;
        margin-top: 8px;
        transition: 0.3s;
        font-weight: bold;
    }

    .btn:hover {
        background: red;
        color: white;
    }

    a {
        text-decoration: none;
        color: red;
        font-weight: bold;
    }
</style>
    </style>
</head>

<body>

<div class="navbar" id="navbar">
    <h2>📱 Mobile Store</h2>
    <a href="${pageContext.request.contextPath}/cart">Go to Cart 🛒</a>
</div>

<input type="text" id="search" placeholder="Search products..." onkeyup="searchProducts()">

<br><br>

<div class="container">

<c:forEach var="p" items="${products}">
    <div class="card">

        <img src="${pageContext.request.contextPath}/static/images/${p.image}">

        <h3 class="name">${p.name}</h3>
        <p>${p.description}</p>

        <h4>₹ ${p.price}</h4>

        <a href="${pageContext.request.contextPath}/product/${p.id}">
            View Details
        </a>

        <br><br>

        <!-- FIX: safer JS passing -->
       <button class="btn"
        data-id="${p.id}"
        data-name="${p.name}"
        data-price="${p.price}"
        onclick="addToCartFromBtn(this)">
    Add to Cart
</button>

    </div>
</c:forEach>

</div>

<script>

// CLEAN & SAFE CART FUNCTION
function addToCartFromBtn(btn) {

    let id = Number(btn.getAttribute("data-id"));
    let name = btn.getAttribute("data-name");
    let price = Number(btn.getAttribute("data-price"));

    let cart = JSON.parse(localStorage.getItem("cart") || "[]");

    let existing = cart.find(item => item.id === id);

    if (existing) {
        existing.qty += 1;
    } else {
        cart.push({
            id: id,
            name: name,
            price: price,
            qty: 1
        });
    }

    localStorage.setItem("cart", JSON.stringify(cart));

    alert("Added to cart!");
}
// SEARCH FUNCTION
function searchProducts() {
    let input = document.getElementById("search").value.toLowerCase();
    let cards = document.getElementsByClassName("card");

    for (let i = 0; i < cards.length; i++) {
        let name = cards[i].getElementsByClassName("name")[0].innerText;
        cards[i].style.display =
            name.toLowerCase().includes(input) ? "" : "none";
    }
}

</script>

</body>
</html>