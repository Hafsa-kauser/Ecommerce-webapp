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

    padding: 12px 20px;
    background: #3c000b;
    color: white;
}


.navbar-center {
    flex: 1;
    display: flex;
    justify-content: center;
}

#search {
    width: 300px;
    padding: 8px;
    border: 1px solid #ccc;
    outline: none;
    font-size: 14px;
}


.navbar a {
    color: #3c000b;
    background: white;
    padding: 6px 12px;
    text-decoration: none;
    font-weight: bold;
}


.container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 15px;
    padding: 20px;
}


.card {
    background: white;
    padding: 10px;
    border: 1px solid #ddd;
    display: flex;
    flex-direction: column;
    
}


.card img {
    width: 100%;
    height: 130px;
    object-fit: contain;
}


.card h3 {
    margin: 8px 0 4px;
}

.card p {
    font-size: 12px;
    color: #666;
}

.card h4 {
    margin: 6px 0;
    color: #3c000b;
}

a{
text-decoration:none;}
.btn {
    padding: 8px;
    background: #3c000b;
    color: white;
    border: none;
    cursor: pointer;
    margin-top: 8px;
}

.qty-box {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 6px;
}

.qty-box button {
    padding: 4px 8px;
    border: none;
    background: #3c000b;
    color: white;
    cursor: pointer;
}

.qty-input {
    width: 35px;
    text-align: center;
    border: 1px solid #ccc;
}


@media (max-width: 600px) {

    .navbar {
        flex-direction: column;
        gap: 10px;
    }

    .navbar-center {
        width: 100%;
    }

    #search {
        width: 90%;
    }

    .container {
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    }

    .card img {
        height: 100px;
    }
}
</style>
    
</head>

<body>

<div class="navbar" id="navbar">
    <h2>📱 Mobile Store</h2>

    <div class="navbar-center">
        <input type="text" id="search" placeholder="Search products..." onkeyup="searchProducts()">
    </div>

    <a href="${pageContext.request.contextPath}/cart">Go to Cart 🛒</a>
</div>
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