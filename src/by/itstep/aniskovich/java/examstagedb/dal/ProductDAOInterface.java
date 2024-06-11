package by.itstep.aniskovich.java.examstagedb.dal;

import by.itstep.aniskovich.java.examstagedb.model.entity.Category;
import by.itstep.aniskovich.java.examstagedb.model.entity.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductDAOInterface {
    List<Product> getProductsByCategory(int category_id) throws SQLException;
    int getTotalProductsCount() throws SQLException;
    Product getCheapestProduct() throws SQLException;
    Product getMostExpensiveProduct() throws SQLException;
    Category getMostExpensiveCategory() throws SQLException;
}
