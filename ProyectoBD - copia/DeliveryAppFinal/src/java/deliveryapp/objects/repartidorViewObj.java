/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deliveryapp.objects;

public class repartidorViewObj {
    
    private int Id_usuario;
    private String Nombre;
    private String Apellido;
    private int Id_orden;
    private int Cantidad;
    private double Total;
    private String Estado;
    private int Id_producto;
    private String Producto;
    private int Id_direccion;
    private String Departamento;
    private String Municipio;
    private String Colonia;
    private int Num_casa;

    public repartidorViewObj(int pId_usuario, String pNombre, String pApellido, int pId_orden,int pCantidad, double pTotal, String pEstado, int pId_direccion, String pProducto, int pId_producto,  String pDepartamento, String pMunicipio, String pColonia, int pNum_casa) {
        setId_usuario(pId_usuario);
        setNombre(pNombre);
        setApellido(pApellido);
        setCantidad(pCantidad);
        setId_orden(pId_orden);
        setTotal(pTotal);
        setEstado(pEstado);
        setId_producto(pId_producto);
        setProducto(pProducto);
        setId_direccion(pId_direccion);
        setDepartamento(pDepartamento);
        setMunicipio(pMunicipio);
        setColonia(pColonia);
        setNum_casa(pNum_casa);
    }

    public int getId_usuario() {
        return Id_usuario;
    }

    private void setId_usuario(int pId_usuario) {
        this.Id_usuario = pId_usuario;
    }

    public String getNombre() {
        return Nombre;
    }

    private void setNombre(String pNombre) {
        this.Nombre = pNombre;
    }

    public String getApellido() {
        return Apellido;
    }

    private void setApellido(String pApellido) {
        this.Apellido = pApellido;
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

    private void setTotal(double pTotal) {
        this.Total = pTotal;
    }

    public int getId_direccion() {
        return Id_direccion;
    }

    private void setId_direccion(int pId_direccion) {
        this.Id_direccion = pId_direccion;
    }
    
    public String getEstado() {
        return Estado;
    }

    private void setEstado(String pEstado) {
        this.Estado = pEstado;
    }

    public int getId_producto() {
        return Id_producto;
    }

    public void setId_producto(int pId_producto) {
        this.Id_producto = pId_producto;
    }

    public String getProducto() {
        return Producto;
    }

    public void setProducto(String pProducto) {
        this.Producto = pProducto;
    }
    
    public String getDepartamento() {
        return Departamento;
    }

    private void setDepartamento(String pDepartamento) {
        this.Departamento = pDepartamento;
    }

    public String getMunicipio() {
        return Municipio;
    }

    private void setMunicipio(String pMunicipio) {
        this.Municipio = pMunicipio;
    }

    public String getColonia() {
        return Colonia;
    }

    private void setColonia(String pColonia) {
        this.Colonia = pColonia;
    }

    public int getNum_casa() {
        return Num_casa;
    }

    private void setNum_casa(int pNum_casa) {
        this.Num_casa = pNum_casa;
    }
    
    
}
