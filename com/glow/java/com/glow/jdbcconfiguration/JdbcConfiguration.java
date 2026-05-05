package com.glow.jdbcconfiguration;




import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class JdbcConfiguration {

    @Bean
    public DataSource dataSource() {

        DriverManagerDataSource obj = new DriverManagerDataSource();

        obj.setDriverClassName("com.mysql.cj.jdbc.Driver");
        obj.setUrl("jdbc:mysql://localhost:3306/ecommerce");

        obj.setUsername(System.getenv("DB_USERNAME"));
        obj.setPassword(System.getenv("DB_PASSWORD"));

        return obj;
    }

    @Bean
    public JdbcTemplate jdbcTemplate(DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }
}