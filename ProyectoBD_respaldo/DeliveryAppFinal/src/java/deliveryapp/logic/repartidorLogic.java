/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deliveryapp.logic;

import balcorpfw.database.DatabaseX;
import balcorpfw.logic.Logic;
import deliveryapp.objects.repartidorViewObj;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class repartidorLogic extends Logic {

    public repartidorLogic(String pConnectionString) {
        super(pConnectionString);
    }
    
    public ArrayList<repartidorViewObj> getAllOrdersView() 
    {
        DatabaseX database = getDatabase();
        ArrayList<repartidorViewObj> repartidorListArray = new ArrayList<>();
        String sql = "SELECT * FROM aplicacion_domicilio.repartidor_view;";
        ResultSet result = database.executeQuery(sql);
        
        if(result!=null)
        {
            try 
            {
                
              
                int iId_usuario;
                String strNombre;
                String strApellido;
                int iId_orden;
                int iCantidad;
                double dTotal;
                String strEstado;
                int iId_producto;
                String strProducto;
                int iId_direccion;
                String strDepartamento;
                String strMunicipio;
                String strColonia;
                int Num_casa;
                
                
                repartidorViewObj temp;
                
                while(result.next())
                {
                    iId_usuario = result.getInt("id_usuario");
                    strNombre = result.getString("Nombre");
                    strApellido = result.getString("Apellido");
                    iId_orden = result.getInt("id_orden");
                    iCantidad = result.getInt("cantidad");
                    dTotal = result.getDouble("total");
                    strEstado = result.getString("estado");
                    iId_producto = result.getInt("id_producto");
                    strProducto = result.getString("Producto");
                    iId_direccion = result.getInt("id_direccion");
                    strDepartamento = result.getString("Departamento");
                    strMunicipio = result.getString("Municipio");
                    strColonia = result.getString("Colonia");
                    Num_casa = result.getInt("Numero_casa");
                    temp = new repartidorViewObj(iId_usuario, strNombre, strApellido, iId_orden, iCantidad, dTotal, strEstado, iId_direccion, strProducto, iId_producto, strDepartamento, strMunicipio, strColonia, Num_casa);
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
    
     
    
    
    
    
}
