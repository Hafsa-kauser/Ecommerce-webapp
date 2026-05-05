package com.glow.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.glow.Product;

@Repository
public class ProductDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 1. GET ALL PRODUCTS
    public List<Product> getAllProducts() {

        String sql = "SELECT * FROM products";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {

            Product p = new Product();

            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setDescription(rs.getString("description"));
            p.setPrice(rs.getDouble("price"));
            p.setImage(rs.getString("image"));

            return p;
        });
    }

    // 2. GET PRODUCT BY ID
    public Product getProductById(int id) {

        String sql = "SELECT * FROM products WHERE id = ?";

        return jdbcTemplate.queryForObject(
                sql,
                new Object[]{id},
                (rs, rowNum) -> {

                    Product p = new Product();

                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setDescription(rs.getString("description"));
                    p.setPrice(rs.getDouble("price"));
                    p.setImage(rs.getString("image"));

                    return p;
                }
        );
    }
}
