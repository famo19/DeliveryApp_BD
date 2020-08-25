package deliveryapp.logic;

import balcorpfw.database.DatabaseX;
import balcorpfw.logic.Logic;
import deliveryapp.objects.productoObj;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class productoLogic extends Logic
{

    public productoLogic(String pConnectionString) {
        super(pConnectionString);
    }

    public productoObj getOrdenById(int pId)
    {
        DatabaseX database = getDatabase();
        ArrayList<productoObj> ordenArray = new ArrayList<>();
        String sql = "select * from aplicacion_domicilio.productos where id_producto="+pId+";";
        ResultSet result = database.executeQuery(sql);
        
        productoObj temp = null;
        
        if(result!=null)
        {
            
            try 
            {
                int iId;
                String strName;
                int iCantidad;
                double dPrecio;
                String strExistencia;
                
                while(result.next())
                {
                    iId = result.getInt("id_producto");
                    iCantidad = result.getInt("cantidad");
                    dPrecio = result.getDouble("precio");
                    strExistencia = result.getString("existencia");
                    strName = result.getString("nombre");
                    temp = new productoObj(iId, iCantidad, dPrecio, strExistencia, strName);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(productoLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return temp;
    }
    
    public ArrayList<productoObj> getAllProducts()
    {
        
        DatabaseX database = getDatabase();
        ArrayList<productoObj> productoArray = new ArrayList<>();
        String sql = "SELECT * FROM aplicacion_domicilio.productos;";
        ResultSet result = database.executeQuery(sql);
        
        if(result!=null)
        {
            try 
            {
                
                
                int iId;
                String strName;
                int iCantidad;
                double dPrecio;
                String strExistencia;
                productoObj temp;
                
                while(result.next())
                {
                    iId = result.getInt("id_producto");
                    strName = result.getString("nombre");
                    iCantidad= result.getInt("cantidad");
                    dPrecio= result.getDouble("precio");
                    strExistencia = result.getString("existencia");
                    temp = new productoObj(iId, iCantidad, dPrecio, strExistencia, strName );
                    productoArray.add(temp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(productoLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return productoArray;
    }
    
    public productoObj getPrecioById(int pId)
    {
        DatabaseX database = getDatabase();
        String sql= "SELECT * FROM aplicacion_domicilio.productos WHERE id_producto="+pId+";";
        ArrayList<productoObj> ordenArray = new ArrayList<>();
        ResultSet result = database.executeQuery(sql);
        
        productoObj temp = null;
        
        if(result!=null)
        {
            
            try 
            {
                int iId;
                String strName;
                int iCantidad;
                double dPrecio;
                String strExistencia;
                
                while(result.next())
                {
                    iId = result.getInt("id_producto");
                    strName = result.getString("nombre");
                    iCantidad = result.getInt("cantidad");
                    dPrecio = result.getDouble("precio");
                    strExistencia = result.getString("existencia");
                    temp = new productoObj(iId, iCantidad, dPrecio, strExistencia, strName);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(productoLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return temp;
    }
    
    //Borrar producto, FALTA HACERLO
    public int deleteProducto(int pId)
    {
        DatabaseX database = getDatabase();
        String sql2="DELETE FROM aplicacion_domicilio.orden_productos " +
                "WHERE id_producto='"+pId+"';";
        int rows= database.executeNonQueryRows(sql2);
        String sql3 = "DELETE FROM aplicacion_domicilio.orden "
                + "WHERE id_producto ='"+pId+"';";
        rows+= database.executeNonQueryRows(sql3);
        String sql="DELETE FROM aplicacion_domicilio.productos " +
                "WHERE id_producto='"+pId+"';";
        rows += database.executeNonQueryRows(sql);
        
        return (rows/3);
    }
    
    public int deleteRowView(int pId)
    {
        DatabaseX database = getDatabase();
        String sql = "DELETE FROM aplicacion_domicilio.orden "
                + "WHERE id = '"+pId+"';";
        int rows = database.executeNonQueryRows(sql);
        
        return (rows);
    }
    
    public int deleteOrden(int pId)
    {
        
        DatabaseX database = getDatabase();
        String sql2="DELETE FROM aplicacion_domicilio.orden_productos " +
                "WHERE id_orden='"+pId+"';";
        int rows= database.executeNonQueryRows(sql2);
        String sql = "DELETE FROM aplicacion_domicilio.orden "
                + "WHERE id_orden = '"+pId+"';";
        rows += database.executeNonQueryRows(sql);
        
        return (rows/2);
    }
    
}


