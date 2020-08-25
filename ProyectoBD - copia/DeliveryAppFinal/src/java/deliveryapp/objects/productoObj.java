package deliveryapp.objects;


public class productoObj 
{
    private int id;
    private int cantidad;
    private double precio;
    private String existencia;
    private String name;

    

    public productoObj(int pId,  int pCantidad, double pPrecio, String pExistencia, String pName) {
        setId(pId);
        setCantidad(pCantidad);
        setPrecio(pPrecio);
        setExistencia(pExistencia);
        setName(pName);
        
    }

    public int getId() {
        return id;
    }

    private void setId(int pId) {
        this.id = pId;
    }

    public String getName() {
        return name;
    }

    private void setName(String pName) {
        this.name = pName;
    }

    public int getCantidad() {
        return cantidad;
    }

    private void setCantidad(int pCantidad) {
        this.cantidad = pCantidad;
    }

    public double getPrecio() {
        return precio;
    }

    private void setPrecio(double pPrecio) {
        this.precio = pPrecio;
    }

    public String getExistencia() {
        return existencia;
    }

    private void setExistencia(String pExistencia) {
        this.existencia = pExistencia;
    }
    
    
}
