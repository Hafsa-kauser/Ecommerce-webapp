<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Checkout</title>

    <style>
    
body {
    margin: 0;
  font-family: 'Segoe UI', Tahoma, sans-serif;
  background: #fffff0;
   display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}


.container {
    width: 380px;
    background: white;
    padding: 25px;

    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1);

    animation: fadeIn 0.4s ease;
}


.container h2 {
    text-align: center;
    color: #3c000b;
    margin-bottom: 20px;
}


input, textarea {
    width: 100%;
    padding: 12px;

    border-radius: 10px;
    border: 1px solid #ddd;

    margin-top: 10px;
    margin-bottom: 5px;

    font-size: 14px;
    transition: 0.3s;
}


input:focus, textarea:focus {
    border-color: #3c000b;
    box-shadow: 0 0 0 2px rgba(60,0,11,0.1);
    outline: none;
}


textarea {
    resize: none;
    height: 80px;
}


button {
    margin-top: 15px;
    padding: 12px;

    width: 100%;
    border: none;
    border-radius: 25px;

    background: #3c000b;
    color: white;

    font-size: 15px;
    font-weight: bold;
    cursor: pointer;

    transition: 0.3s;
}

button:hover {
    background: #5a0015;
    transform: translateY(-2px);
}


.error {
    color: #d93025;
    font-size: 13px;
    margin-bottom: 5px;
}


.success {
    text-align: center;
    color: #3c000b;
    font-size: 20px;
    line-height: 1.6;
}

.success a {
    display: inline-block;
    margin-top: 15px;
    text-decoration: none;
    background: #3c000b;
    color: white;
    padding: 10px 20px;
    border-radius: 20px;
}


@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px); }
    to {
        opacity: 1;
        transform: translateY(0);}
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

    </div> <div id="successMessage" class="success"></div>

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

  
    localStorage.removeItem("cart");

    document.getElementById("formSection").style.display = "none";

    document.getElementById("successMessage").innerHTML =
        "✅ Order placed successfully! <br><br>" +
        "<a href='${pageContext.request.contextPath}/'>back to shop</a>";
}

</script>

</body>
</html>