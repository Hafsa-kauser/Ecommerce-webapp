package com.glow.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.glow.Product;
import com.glow.service.ProductService;

@Controller
public class UserController {

    @Autowired
    private ProductService productService;

    // 1. HOME PAGE (PRODUCT LIST)
    @GetMapping("/")
    public String home(Model model) {

        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);

        return "index"; // index.jsp
    }

    // 2. PRODUCT DETAILS PAGE
    @GetMapping("/product/{id}")
    public String productDetails(@PathVariable int id, Model model) {

        Product product = productService.getProductById(id);
        model.addAttribute("product", product);

        return "product"; // product.jsp
    }

    // 3. CART PAGE
    @GetMapping("/cart")
    public String cartPage() {
        return "cart";
    }

    // 4. CHECKOUT PAGE
    @GetMapping("/checkout")
    public String checkoutPage() {
        return "checkout";
    }
}