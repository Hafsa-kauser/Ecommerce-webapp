<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Checkout</title>

    <style>
        .container {
            width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
        }

        input, textarea {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
        }

        button {
            padding: 10px;
            width: 100%;
            background: green;
            color: white;
            border: none;
            cursor: pointer;
        }

        .error {
            color: red;
            font-size: 14px;
        }

        .success {
            text-align: center;
            color: green;
            font-size: 20px;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Checkout</h2>

    <div id="formSection">

        <input type="text" id="name" placeholder="Full Name">
        <div id="nameError" class="error"></div>

        <textarea id="address" placeholder="Address"></textarea>
        <div id="addressError" class="error"></div>

        <input type="text" id="phone" placeholder="Phone Number">
        <div id="phoneError" class="error"></div>

        <button onclick="placeOrder()">Place Order</button>

    </div>

    <div id="successMessage" class="success"></div>

</div>

<script>

function validate() {

    let valid = true;

    let name = document.getElementById("name").value.trim();
    let address = document.getElementById("address").value.trim();
    let phone = document.getElementById("phone").value.trim();

    document.getElementById("nameError").innerText = "";
    document.getElementById("addressError").innerText = "";
    document.getElementById("phoneError").innerText = "";

    if (name === "") {
        document.getElementById("nameError").innerText = "Name required";
        valid = false;
    }

    if (address === "") {
        document.getElementById("addressError").innerText = "Address required";
        valid = false;
    }

    if (!/^[0-9]{10}$/.test(phone)) {
        document.getElementById("phoneError").innerText = "Enter valid 10-digit phone";
        valid = false;
    }

    return valid;
}

function placeOrder() {

    if (!validate()) return;

    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    if (cart.length === 0) {
        alert("Cart is empty!");
        return;
    }

    // simulate order success
    localStorage.removeItem("cart");

    document.getElementById("formSection").style.display = "none";

    document.getElementById("successMessage").innerHTML =
        "✅ Order placed successfully! <br><br>" +
        "<a href='${pageContext.request.contextPath}/'>Go back to shop</a>";
}

</script>

</body>
</html>