
package com.emergentes.modelo;

public class Orden {
   private int id;
   private int producto_id;
   private int cantidad;
   private String fecha;
   private String producto;

    public Orden() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    @Override
    public String toString() {
        return "Orden{" + "id=" + id + ", producto_id=" + producto_id + ", cantidad=" + cantidad + ", fecha=" + fecha + ", producto=" + producto + '}';
    }
   
   
}
