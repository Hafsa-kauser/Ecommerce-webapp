# 🛒 Ecommerce Web Application

A mini ecommerce web application built using **Spring MVC, JDBC, and MySQL**.  
Users can browse products, add items to cart, and simulate a checkout process.

---

## 🚀 Features

- 🛍️ Product Listing Page  
- 📄 Product Details (image, price, description)  
- 🛒 Add to Cart functionality  
- 🧾 Cart Page with total price calculation  
- 🔍 Search and Filter Products  
- 📱 Responsive UI design  
- 💾 Cart persistence using LocalStorage  
- 💳 Checkout simulation with form validation  

---

## 🛠️ Tech Stack

- **Frontend:** HTML, CSS, JavaScript  
- **Backend:** Spring MVC  
- **Database:** MySQL  
- **Data Access:** Spring JDBC  
- **IDE:** Eclipse  

---

## ⚙️ How to Run

### 1. Clone the repository

```bash
git clone https://github.com/Hafsa-kauser/Ecommerce-webapp.git
2. Import into Eclipse
Open Eclipse
Go to File → Import → Existing Projects into Workspace
Select the project folder
3. Setup Database

Open MySQL and run:

CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description VARCHAR(255),
    price DOUBLE,
    image VARCHAR(100)
);

INSERT INTO products (name, description, price, image) VALUES
('iPhone 14', 'Apple flagship phone', 79999, 'iphone.jpg'),
('Samsung S23', 'Samsung premium phone', 69999, 'samsung.jpg'),
('Redmi 14', 'Xiaomi budget 5G smartphone', 14999, 'redmi14.jpg'),
('OnePlus 11', 'High performance flagship killer', 56999, 'oneplus11.jpg'),
('Realme GT Neo 3', 'Fast charging gaming phone', 36999, 'realmegtneo3.jpg'),
('Vivo V27', 'Stylish phone with great camera', 32999, 'vivov27.jpg'),
('Oppo Reno 10', 'Slim design with strong camera', 38999, 'opporeno10.jpg'),
('iQOO Neo 7', 'Performance-focused gaming phone', 29999, 'iqooneo7.jpg'),
('Samsung Galaxy A54', 'Midrange Samsung with AMOLED display', 38999, 'galaxya54.jpg'),
('Motorola Edge 40', 'Clean Android experience with sleek design', 29999, 'motoedge40.jpg');