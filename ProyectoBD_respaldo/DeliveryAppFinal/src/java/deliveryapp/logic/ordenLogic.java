/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deliveryapp.logic;

import balcorpfw.database.DatabaseX;
import balcorpfw.logic.Logic;
import deliveryapp.objects.rootViewObj;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author franc
 */
public class ordenLogic extends Logic {

    public ordenLogic(String pConnectionString) {
        super(pConnectionString);
    }
    
    
    
    public int insertNewOrden(int pCantidad,Double pTotal, String pDate, int pId){
        
        DatabaseX database = getDatabase();
        
        String sql = "INSERT INTO aplicacion_domicilio.orden" +
                "(id_orden, cantidad, total, estado, Datetime, id_producto)" +
                "VALUES" +
                "(0, '"+pCantidad+"','"+pTotal+"', 'SE', '"+pDate+"', '"+pId+"');";
        int rows = database.executeNonQueryRows(sql);
        return rows;
    }
   
    
    public int insertNewOrden_Producto(int pIdProducto, int pId_orden, int pId_usuario){
        DatabaseX database = getDatabase();
        String sql="INSERT INTO aplicacion_domicilio.orden_productos"+
                    "(codigo_orden, id_producto, id_orden, id_usuario)"+
                    "VALUES"+
                    "(0, '"+pIdProducto+"','"+pId_orden+"', '"+pId_usuario+"');";
        int rows = database.executeNonQueryRows(sql);
        return rows;
        
    }  
    
    public int getId_Orden(){
        DatabaseX database = getDatabase();
        String sql="SELECT id_orden FROM aplicacion_domicilio.orden ORDER BY id_orden DESC LIMIT 1 ;";
        ResultSet result = database.executeQuery(sql);
        
        int iId = 0;
        
        if (result!=null) {
            try{
            while(result.next())
                {
                    iId = result.getInt("id_orden");
                    
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(ordenLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        }    
        return iId;
        
    }
    
     public int getId_usuario(String pEmail){
        DatabaseX database = getDatabase();
        String sql="SELECT id_usuario FROM aplicacion_domicilio.usuario WHERE Email='"+pEmail+"';"; 
        int rows = database.executeNonQueryRows(sql);
        return rows;
     }
    
    public String fecha(){
        Date objDate = new Date();  // Sistema actual La fecha y la hora se asignan a objDate 
 
        System.out.println(objDate); 
        String strDateFormat = "yyyy-MM-dd HH:mm:ss"; // El formato de fecha está especificado  
        SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); // La cadena de formato de fecha se pasa como un argumento al objeto de formato de fecha  
        System.out.println(objSDF.format(objDate)); // El formato de fecha se aplica a la fecha actual
        return objSDF.format(objDate);
    }
    
    public ArrayList<rootViewObj> getAllOrdersView() 
    {
        DatabaseX database = getDatabase();
        ArrayList<rootViewObj> repartidorListArray = new ArrayList<>();
        String sql = "SELECT * FROM aplicacion_domicilio.root_view;";
        ResultSet result = database.executeQuery(sql);
        
        if(result!=null)
        {
            try 
            {
                
              
                int iId_usuario;
                String strNombre;
                String strApellido;
                String strTelefono;
                int iId_orden;
                int iCantidad;
                double dTotal;
                String strEstado;
                String strFecha;
                int iId_producto;
                String strProducto;
                int iId_direccion;
                String strDepartamento;
                String strMunicipio;
                String strColonia;
                int Num_casa;
                
                
                rootViewObj temp;
                
                while(result.next())
                {
                    iId_usuario = result.getInt("id_usuario");
                    strNombre = result.getString("Nombre");
                    strApellido = result.getString("Apellido");
                    strTelefono = result.getString("Telefono_usuario");
                    iId_orden = result.getInt("id_orden");
                    iCantidad = result.getInt("cantidad");
                    dTotal = result.getDouble("total");
                    strEstado = result.getString("estado");
                    strFecha = result.getString("Fecha_pedido");
                    iId_producto = result.getInt("id_producto");
                    strProducto = result.getString("Producto");
                    iId_direccion = result.getInt("id_direccion");
                    strDepartamento = result.getString("Departamento");
                    strMunicipio = result.getString("Municipio");
                    strColonia = result.getString("Colonia");
                    Num_casa = result.getInt("Numero_casa");
                    temp = new rootViewObj(iId_usuario, strNombre, strApellido, strTelefono, iId_orden, iCantidad, dTotal, strEstado, iId_producto, strProducto, strFecha, iId_direccion, strDepartamento, strMunicipio, strColonia, Num_casa);
                    repartidorListArray.add(temp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(repartidorLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return repartidorListArray;        
        
    }
    
    //Id_orden
    public int updateOrden(String pEstado, int pId){
        DatabaseX database = getDatabase();
        String sql="UPDATE aplicacion_domicilio.orden" +
                "SET" +
                "estado = '"+pEstado+"'," +
                "WHERE id_orden = '"+pId+"';";
        int rows = database.executeNonQueryRows(sql);
        return rows;
    }
   
    public int insertOrProRe(int pId_or, int pId_re, int pId_pro, int pId_us, int pId_direccion){
        DatabaseX database = getDatabase();
        String sql="INSERT INTO aplicacion_domicilio.or_pro_re" +
                "(id_or_pro_re," +"id_codigo_orden," +"id_repartidor," +"id_producto," +"id_usuario," +"id_direccion)" +
                "VALUES" +
                "(0," +"'"+pId_or+"'," +"'"+pId_re+"'," +"'"+pId_pro+"'," +"'"+pId_us+"'," +"'"+pId_direccion+"');";
        
        int rows = database.executeNonQueryRows(sql);
        return rows;
        
    }
}
