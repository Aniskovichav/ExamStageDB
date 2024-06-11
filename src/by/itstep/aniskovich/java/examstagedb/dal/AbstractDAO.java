package by.itstep.aniskovich.java.examstagedb.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public abstract class AbstractDAO<T> implements CRUD<T> {
    private static final String URL = "jdbc:mysql://localhost:3306/products_db";
    private static final String USER = "root";
    private static final String PASSWORD = "qwe123";

    protected Connection connection;

    public AbstractDAO() throws SQLException {
        connection = DriverManager.getConnection(URL, USER, PASSWORD);
    }

    @Override
    public void create(T entity) throws SQLException {
    }

    @Override
    public T getById(int id) throws SQLException {
        return null;
    }

    @Override
    public List<T> getAll() throws SQLException {
        return null;
    }

    @Override
    public void update(T entity) throws SQLException {
    }

    @Override
    public void delete(int id) throws SQLException {
    }


    public void close() throws SQLException {
        connection.close();
    }
}
