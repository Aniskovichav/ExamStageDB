package by.itstep.aniskovich.java.examstagedb.model.entity;

public abstract class BaseEntity implements Entity{
    private int id;

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }
}
