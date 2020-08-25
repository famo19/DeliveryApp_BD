/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deliveryapp.logic;

import balcorpfw.database.DatabaseX;
import balcorpfw.logic.Logic;
import deliveryapp.objects.sugerenciasObj;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class sugerenciasLogic extends Logic {
    public sugerenciasLogic(String pConnectionString) {
        super(pConnectionString);
}
    
    public int insertNewSugerencias(String pEmail, String pAsunto, String pDescripcion){
        
        DatabaseX database = getDatabase();
        
        String sql = "INSERT INTO aplicacion_domicilio.sugerencias" +
                "(idsugerencias, email, asunto, descripcion)" +
                "VALUES" +
                "(0,'"+pEmail+"', '"+pAsunto+"', '"+pDescripcion+"');";
        int rows = database.executeNonQueryRows(sql);
        return rows;
    }
    
    public ArrayList<sugerenciasObj> getAllSuggests() 
    {
        DatabaseX database = getDatabase();
        ArrayList<sugerenciasObj> sugerenciasListArray = new ArrayList<>();
        String sql = "SELECT * FROM aplicacion_domicilio.sugerencias;";
        ResultSet result = database.executeQuery(sql);
        
        if(result!=null)
        {
            try 
            {
                String strEmail;
                String strAsunto;
                String strDescripcion;
                int iId;
                
                sugerenciasObj temp;
                
                while(result.next())
                {
                    iId = result.getInt("idsugerencias");
                    strEmail = result.getString("email");
                    strAsunto = result.getString("asunto");
                    strDescripcion = result.getString("descripcion");
                    temp = new sugerenciasObj(iId, strEmail, strAsunto, strDescripcion);
                    sugerenciasListArray.add(temp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(sugerenciasLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return sugerenciasListArray; 
    
    }
}
