/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deliveryapp.objects;

/**
 *
 * @author franc
 */
public class ordenObj {
    
    private int Id_orden;
    private int Cantidad;
    private double Total;
    private String Estado;
    private String Fecha;
    private int Id_producto;

    public ordenObj(int pId_orden, int pCantidad, double pTotal, String pEstado, String pFecha, int pId_producto) {
        setId_orden(pId_orden);
        setCantidad(pCantidad);
        setTotal(pCantidad);
        setEstado(pEstado);
        setFecha(pFecha);
        setId_producto(pId_producto);
    }
    

    

    public int getId_orden() {
        return Id_orden;
    }

    private void setId_orden(int pId_orden) {
        this.Id_orden = pId_orden;
    }

    public int getCantidad() {
        return Cantidad;
    }

    private void setCantidad(int pCantidad) {
        this.Cantidad = pCantidad;
    }

    public double getTotal() {
        return Total;
    }

    private void setTotal(int pTotal) {
        this.Total = pTotal;
    }

    public String getEstado() {
        return Estado;
    }

    private void setEstado(String pEstado) {
        this.Estado = pEstado;
    }

    public String getFecha() {
        return Fecha;
    }

    private void setFecha(String pFecha) {
        this.Fecha = pFecha;
    }

    public int getId_producto() {
        return Id_producto;
    }

    private void setId_producto(int pId_producto) {
        this.Id_producto = pId_producto;
    }


    
}
