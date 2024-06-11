package by.itstep.aniskovich.java.examstagedb.dal;

import by.itstep.aniskovich.java.examstagedb.model.entity.Category;
import by.itstep.aniskovich.java.examstagedb.model.entity.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends AbstractDAO<Product>
        implements ProductDAOInterface {
    public static final String CREATE_PRODUCT = "INSERT INTO products " +
            "(name, description, price, category_id) VALUES (?, ?, ?, ?)";
    public static final String GET_BY_ID = "SELECT * FROM products " +
            "WHERE id = ?";
    public static final String GET_ALL = "SELECT * FROM products";
    public static final String UPDATE_PRODUCT = "UPDATE products " +
            "SET name = ?, description = ?, price = ?, category_id = ? " +
            "WHERE id = ?";
    public static final String DELETE_PRODUCT = "DELETE FROM products " +
            "WHERE id = ?";
    public static final String GET_PRODUCTS_BY_CATEGORY = "SELECT * FROM " +
            "products WHERE category_id = ?";
    public static final String GET_PRODUCTS_COUNTS = "SELECT COUNT(*) FROM " +
            "products";
    public static final String GET_CHEAPEST_PRODUCT = "SELECT * FROM " +
            "products ORDER BY price ASC LIMIT 1";
    public static final String GET_MOST_EXPENSIVE_PRODUCT = "SELECT * FROM " +
            "products ORDER BY price DESC LIMIT 1";
    public static final String GET_MOST_EXPENSIVE_CATEGORY = "SELECT c.id, " +
            "c.name, SUM(p.price) AS total_price FROM categories c JOIN " +
            "products p ON c.id = p.category_id GROUP BY c.id, c.name " +
            "ORDER BY total_price DESC LIMIT 1";


    public ProductDAO() throws SQLException {
        super();
    }

    @Override
    public void create(Product product) throws SQLException {
        try (PreparedStatement preparedStatement = connection
                .prepareStatement(CREATE_PRODUCT,
                        Statement.RETURN_GENERATED_KEYS)) {
            setProductParameters(preparedStatement, product);
            preparedStatement.executeUpdate();

            try (ResultSet generatedKeys = preparedStatement
                    .getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    product.setId(generatedKeys.getInt(1));
                }
            }
        }
    }

    @Override
    public Product getById(int id) throws SQLException {
        try (PreparedStatement preparedStatement = connection
                .prepareStatement(GET_BY_ID)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToProduct(resultSet);
                }
            }
        }
        return null;
    }

    @Override
    public List getAll() throws SQLException {
        List<Product> products = new ArrayList<>();
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(GET_ALL)) {
            while (resultSet.next()) {
                products.add(mapResultSetToProduct(resultSet));
            }
        }
        return products;
    }

    @Override
    public void update(Product product) throws SQLException {
        try (PreparedStatement preparedStatement = connection
                .prepareStatement(UPDATE_PRODUCT)) {
            setProductParameters(preparedStatement, product);
            preparedStatement.setInt(5, product.getId());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void delete(int id) throws SQLException {
        try (PreparedStatement preparedStatement = connection
                .prepareStatement(DELETE_PRODUCT)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void close() throws SQLException {
        super.close();
    }


    @Override
    public List<Product> getProductsByCategory(int category_id)
            throws SQLException {
        List<Product> products = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection
                .prepareStatement(GET_PRODUCTS_BY_CATEGORY)) {
            preparedStatement.setInt(1, category_id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    products.add(mapResultSetToProduct(resultSet));
                }
            }
        }
        return products;
    }

    @Override
    public int getTotalProductsCount() throws SQLException {
        try (PreparedStatement statement = connection
                .prepareStatement(GET_PRODUCTS_COUNTS);
             ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        }
        return 0;
    }

    @Override
    public Product getCheapestProduct() throws SQLException {
        try (PreparedStatement statement = connection
                .prepareStatement(GET_CHEAPEST_PRODUCT);
             ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                return mapResultSetToProduct(resultSet);
            }
        }
        return null;
    }

    @Override
    public Product getMosrExpensiveProduct() throws SQLException {
        try (PreparedStatement statement = connection
                .prepareStatement(GET_MOST_EXPENSIVE_PRODUCT);
             ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                return mapResultSetToProduct(resultSet);
            }
        }
        return null;
    }

    @Override
    public Category getMostExpensiveCategory() throws SQLException {
        try (PreparedStatement statement = connection
                .prepareStatement(GET_MOST_EXPENSIVE_CATEGORY);
             ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                return category;
            }
        }
        return null;
    }

    private void setProductParameters(PreparedStatement preparedStatement,
                                      Product product) throws SQLException {
        preparedStatement.setString(1, product.getName());
        preparedStatement.setString(2, product.getDescription());
        preparedStatement.setDouble(3, product.getPrice());
        preparedStatement.setInt(4, product.getCategoryId());
    }

    private Product mapResultSetToProduct(ResultSet resultSet)
            throws SQLException {
        Product product = new Product();
        product.setId(resultSet.getInt("id"));
        product.setName(resultSet.getString("name"));
        product.setDescription(resultSet.getString("description"));
        product.setPrice(resultSet.getDouble("price"));
        product.setCategoryId(resultSet.getInt("category_id"));
        return product;
    }
}
