<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>${product.name}</title>

    <style>
        .container {
            display: flex;
            gap: 30px;
            padding: 30px;
        }

        img {
            width: 300px;
            height: 300px;
            object-fit: cover;
        }

        .details {
            max-width: 400px;
        }

        .btn {
            padding: 10px 15px;
            background: green;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>

<body>

<a href="${pageContext.request.contextPath}/">⬅ Back to Products</a>

<div class="container">

    <img src="${pageContext.request.contextPath}/static/images/${product.image}" alt="product"/>

    <div class="details">
    
        <h2>${product.name}</h2>

        <p>${product.description}</p>

        <h3>₹ ${product.price}</h3>

<button class="btn"
        data-id="${product.id}"
        data-name="${product.name}"
        data-price="${product.price}"
        onclick="addToCartFromBtn(this)">
    Add to Cart
</button>
    </div>

</div>

<script>
function addToCartFromBtn(btn) {

    let id = btn.getAttribute("data-id");
    let name = btn.getAttribute("data-name");
    let price = btn.getAttribute("data-price");

    // 🔥 FORCE CORRECT TYPES
    id = parseInt(id);
    price = parseFloat(price);

    // 🔥 SAFETY CHECK (VERY IMPORTANT)
    if (!id || !name || !price) {
        console.error("Invalid product data:", id, name, price);
        alert("Error adding product. Check console.");
        return;
    }

    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    let existing = cart.find(item => item.id === id);

    if (existing) {
        existing.qty = (existing.qty || 0) + 1;
    } else {
        cart.push({
            id: id,
            name: name,
            price: price,
            qty: 1
        });
    }

    localStorage.setItem("cart", JSON.stringify(cart));

    console.log("Cart:", cart); // 🔍 debug
    alert("Added to cart!");
}
</script>

</body>
</html>