package by.itstep.aniskovich.java.examstagedb.controller;

import by.itstep.aniskovich.java.examstagedb.dal.ProductDAO;
import by.itstep.aniskovich.java.examstagedb.model.entity.Category;
import by.itstep.aniskovich.java.examstagedb.model.entity.Product;

import java.sql.SQLException;
import java.util.List;

public class Main {
    public static void main(String[] args) throws SQLException {
        ProductDAO productDAO = new ProductDAO();

        // Add a new product
        Product newProduct = new Product();
        newProduct.setName("Strawberry");
        newProduct.setDescription("Fresh strawberries");
        newProduct.setPrice(2.99);
        newProduct.setCategoryId(1); // Assuming category 1 is 'Fruits'
        productDAO.create(newProduct);
        System.out.println("Added product: " + newProduct.getName());

        // Get all products
        List<Product> products = productDAO.getAll();
        System.out.println("\nProducts list:");
        for (Product product : products) {
            System.out.println(product.getName() + " - " + product.
                    getDescription() + " - " + product.getPrice());
        }

        // Get product by ID
        int id = 5;
        Product product = productDAO.getById(id);
        if (product != null) {
            System.out.println("\nProduct with ID " + id + ": "
                    + product.getName());
        }

        // Update a product
        if (product != null) {
            product.setDescription("Fresh and juicy strawberries");
            productDAO.update(product);
            System.out.println("\nUpdated product: " + product.getName() + " - "
                    + product.getDescription());
        }

        // Delete a product
        productDAO.delete(newProduct.getId());
        System.out.println("\nDeleted product: " + newProduct.getName());

        // Business logic queries
        int totalProductsCount = productDAO.getTotalProductsCount();
        System.out.println("\nTotal products count: " + totalProductsCount);

        Product cheapestProduct = productDAO.getCheapestProduct();
        if (cheapestProduct != null) {
            System.out.println("\nCheapest product: " + cheapestProduct.getName()
                    + " - " + cheapestProduct.getPrice());
        }

        Product mostExpensiveProduct = productDAO.getMostExpensiveProduct();
        if (mostExpensiveProduct != null) {
            System.out.println("\nMost expensive product: " + mostExpensiveProduct
                    .getName() + " - " + mostExpensiveProduct.getPrice());
        }

        Category mostExpensiveCategory = productDAO.getMostExpensiveCategory();
        if (mostExpensiveCategory != null) {
            System.out.println("\nMost expensive category: " +
                    mostExpensiveCategory.getName());
        }

    }
}