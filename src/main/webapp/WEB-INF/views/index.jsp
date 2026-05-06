<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>Mobile Store</title>

    <style>
      
 
body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, sans-serif;
    background: #fffff0;
    color: #333;
}


.navbar {
    position: sticky;
    top: 0;
    z-index: 1000;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 14px 30px;
    background: #3c000b;
    color: white;

    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}


.navbar h2 {
    margin: 0;
    font-size: 22px;
}


.navbar-center {
    flex: 1;
    display: flex;
    justify-content: center;
}


.navbar a {
    color: #3c000b;
    background: white;
    padding: 8px 16px;
    border-radius: 25px;
    text-decoration: none;
    font-weight: bold;
    transition: 0.3s;
}

.navbar a:hover {
    background: #f2dede;
}


#search {
    width: 350px;
    padding: 10px 18px;

    border-radius: 25px;
    border: none;

    outline: none;
    font-size: 14px;

    box-shadow: 0 2px 6px rgba(0,0,0,0.15);
}


.container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 25px;
    padding: 30px;
}


.card {
    background: white;
    border-radius: 16px;
    padding: 15px;

    box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    transition: all 0.25s ease;

    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.card:hover {
    transform: translateY(-8px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

.card img {
    width: 100%;
    height: 170px;
    object-fit: cover;
    border-radius: 12px;
}


.card h3 {
    margin: 10px 0 5px;
}

.card p {
    font-size: 13px;
    color: #666;
    min-height: 40px;
}

.card h4 {
    margin: 8px 0;
    color: #3c000b;
}


a {
    text-decoration: none;
    color: #3c000b;
    font-weight: 600;
}


.btn {
    padding: 10px;
    background: #3c000b;
    color: white;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    margin-top: 10px;

    font-weight: bold;
    transition: 0.3s;
}

.btn:hover {
    background: #5a0015;
}


.qty-box {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
}

.qty-box button {
    padding: 6px 12px;
    border: none;
    background: #3c000b;
    color: white;
    border-radius: 8px;
    cursor: pointer;
    font-weight: bold;
}

.qty-box button:hover {
    background: #5a0015;
}

.qty-input {
    width: 45px;
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-weight: bold;
}


.card a {
    font-size: 14px;
    margin-top: 5px;
    display: inline-block;
}
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

      
      <div class="qty-box">
    <button onclick="changeQty(this, -1)">−</button>

    <input type="text" value="1" class="qty-input" readonly>

    <button onclick="changeQty(this, 1)">+</button>
</div>

<br>

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
function changeQty(btn, change) {
    let input = btn.parentElement.querySelector(".qty-input");

    let current = parseInt(input.value);

    current += change;

    if (current < 1) current = 1;

    input.value = current;
}
function addToCartFromBtn(btn) {

    let id = Number(btn.getAttribute("data-id"));
    let name = btn.getAttribute("data-name");
    let price = Number(btn.getAttribute("data-price"));

   
   let card = btn.closest(".card");
let qtyInput = card.querySelector(".qty-input");
    let qty = parseInt(qtyInput.value);

    let cart = JSON.parse(localStorage.getItem("cart") || "[]");

    let existing = cart.find(item => item.id === id);

    if (existing) {
        existing.qty += qty; 
    } else {
        cart.push({
            id: id,
            name: name,
            price: price,
            qty: qty
        });
    }

    localStorage.setItem("cart", JSON.stringify(cart));

    alert("Added to cart!");
}

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