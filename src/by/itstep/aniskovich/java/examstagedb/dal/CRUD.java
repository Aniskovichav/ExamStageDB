package by.itstep.aniskovich.java.examstagedb.dal;

import java.sql.SQLException;
import java.util.List;

public interface CRUD<T> {
    void create(T entity) throws SQLException;
    T getById(int id) throws SQLException;
    List<T> getAll() throws SQLException;
    void update(T entity) throws SQLException;
    void delete(int id) throws SQLException;
}
