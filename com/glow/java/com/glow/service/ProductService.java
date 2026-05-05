package com.glow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.glow.Product;
import com.glow.dao.ProductDAO;

@Service
public class ProductService {

    @Autowired
    private ProductDAO productDAO;

    // GET ALL PRODUCTS
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    // GET PRODUCT BY ID
    public Product getProductById(int id) {
        return productDAO.getProductById(id);
    }
}