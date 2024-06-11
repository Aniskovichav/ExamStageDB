package by.itstep.aniskovich.java.examstagedb.model.entity;

import java.sql.Date;

public class Order extends BaseEntity {
    private Date orderDate;
    private int productId;
    private int quantity;
    private int supplierId;

    public Order() {
    }

    public Order(Date orderDate, int productId, int quantity, int supplierId) {
        this.orderDate = orderDate;
        this.productId = productId;
        this.quantity = quantity;
        this.supplierId = supplierId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    @Override
    public int getId() {
        return super.getId();
    }

    @Override
    public void setId(int id) {
        super.setId(id);
    }
}
