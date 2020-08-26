package deliveryapp.logic;

import balcorpfw.database.DatabaseX;
import balcorpfw.logic.Logic;
import deliveryapp.objects.userObj;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class userLogic extends Logic {

    public userLogic(String pConnectionString) {
        super(pConnectionString);
    }
    
    public userObj getUserByEmail(String pEmail)
    {
        DatabaseX database = getDatabase();
        String sql = "SELECT * FROM aplicacion_domicilio.usuario where email like '"+pEmail+"';";
        ResultSet result = database.executeQuery(sql);
        
        userObj temp = null;
        
        if(result!=null)
        {
            
            try 
            {
                
                int id;
                String name;
                String apellido;
                String telefono;
                String email;
                String pass;
                String type;
                int placa;
                while(result.next())
                {
                    id = result.getInt("id_usuario");
                    name = result.getString("Nombre");
                    apellido = result.getString("Apellido");
                    telefono = result.getString("Telefono");
                    email = result.getString("Email");
                    pass = result.getString("Contrasena");
                    type = result.getString("Tipo_usuario");
                    placa= result.getInt("placa_vehiculo");
                    temp = new userObj(id, name, apellido, telefono, email, pass, type, placa);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(userLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return temp;
    }
    
    public int registerNewUser(String pNombre, String pApellido, String pTelefono, String pCorreo, String pContrasena, String pTipo, int pPlaca) {
        DatabaseX database = getDatabase();
        String query = "insert into aplicacion_domicilio.usuario"
                + "(id_usuario, Nombre, Apellido, Telefono, Email, Contrasena, Tipo_usuario, placa_vehiculo) values"
                + "(0, '"+pNombre+"', '"+pApellido+"', '"+pTelefono+"', '"+pCorreo+"', '"+pContrasena+"', '"+pTipo+"', "+pPlaca+")" ;
        int rows = database.executeNonQueryRows(query);
        return rows;
    }
 
     //HACER EL COMANDO LAST INSERT ID
    public int getId_Usuario(){
        DatabaseX database = getDatabase();
        String sql="SELECT id_usuario FROM aplicacion_domicilio.usuario ORDER BY id_usuario DESC LIMIT 1 ;";
        ResultSet result = database.executeQuery(sql);
        
        int iId = 0;
        
        if (result!=null) {
            try{
            while(result.next())
                {
                    iId = result.getInt("id_usuario");
                    
                }
            }   
            catch (SQLException ex) 
            {
                Logger.getLogger(userLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        }    
        return iId;
        
    }
    public int registerNewClientDirection(String pDepartamento, String pMunicipio, String pColonia, int pCasa, int pId) {
        DatabaseX database = getDatabase();
        String query = "insert into aplicacion_domicilio.direccion "
                + "(id_direccion, Departamento, Municipio, Colonia, Numero_casa, id_usuario) values"
                + "(0, '"+pDepartamento+"', '"+pMunicipio+"', '"+pColonia+"', "+pCasa+", "+pId+")" ;
        int rows = database.executeNonQueryRows(query);
        return rows;
    }
    
    public int getId_usuario(String pEmail){
        DatabaseX database = getDatabase();
        String sql="SELECT id_usuario FROM aplicacion_domicilio.usuario WHERE Email='"+pEmail+"';"; 
        int rows = database.executeNonQueryRows(sql);
        return rows;
     }
    public int deleteUser(int pId)
    {
        DatabaseX database = getDatabase();
        String sql = "DELETE FROM aplicacion_domicilio.usuario "
                + "WHERE id_usuario = '"+pId+"';";
        int rows = database.executeNonQueryRows(sql);
        String sql2 = "DELETE FROM aplicacion_domicilio.direccion"
                  + "WHERE id_usuario ='"+pId+"';";
        rows += database.executeNonQueryRows(sql2); 
        return (rows/2);
        
    } 
    
    public ArrayList<userObj> getAllUsers()
    {
        DatabaseX database = getDatabase();
        ArrayList<userObj> userArray = new ArrayList<>();
        String sql = "select * from aplicacion_domicilio.usuario";
        ResultSet result = database.executeQuery(sql);
        
        if(result!=null)
        {
            try 
            {
                int iId;
                String strNombre;
                String strApellido;
                String strTelefono;
                String strEmail;
                String strPass;
                String strType;
                int iPlaca;
                userObj temp;
                
                while(result.next())
                {
                    iId = result.getInt("id_usuario");
                    strNombre = result.getString("Nombre");
                    strApellido = result.getString("Apellido");
                    strTelefono = result.getString("Telefono");
                    strEmail = result.getString("Email");
                    
                    strPass = result.getString("Contrasena");
                    strType = result.getString("Tipo_usuario");
                    iPlaca = result.getInt("placa_vehiculo");
                    temp = new userObj (iId, strNombre, strApellido, strTelefono, strEmail, strPass, strType, iPlaca);
                    userArray.add(temp);
                }
            } 
            catch (SQLException ex) 
            {
                
            }
        }
        
        return userArray;
    }    
    
    public userObj getUserById(int pId)
    {
        DatabaseX database = getDatabase();
        ArrayList<userObj> userArray = new ArrayList<>();
        String sql = "select * from aplicacion_domicilio.usuario where id_usuario= '"+pId+"';";
        ResultSet result = database.executeQuery(sql);
        
        userObj temp = null;
        
        if(result!=null)
        {
            
            try 
            {
                int iId;
                String strNombre;
                String strApellido;
                String strTelefono;
                String strEmail;
                String strPass;
                String strType;
                int iPlaca;
                while(result.next())
                {
                    iId = result.getInt("id_usuario");
                    strNombre = result.getString("Nombre");
                    strApellido = result.getString("Apellido");
                    strTelefono = result.getString("Telefono");
                    strEmail = result.getString("Email");
                    strPass = result.getString("Contrasena");
                    strType = result.getString("Tipo_usuario");
                    iPlaca = result.getInt("placa_vehiculo");
                    temp = new userObj(pId, strNombre, strApellido, strTelefono, strEmail, strPass, strType, iPlaca);
                }
            } 
            catch (SQLException ex) 
            {
                
            }
        }
        return temp;
    }    
    
    public int updateUser (int pId, String pNombre, String pApellido, String pTelefono, String pEmail, String pPass, String pType, int pPlaca) 
    {
        DatabaseX database = getDatabase();
        String sql = "UPDATE aplicacion_domicilio.usuario "
                + "SET Nombre = '"+pNombre+"', Apellido='"+pApellido+"', Telefono='"+pTelefono+"', Email= '"+pEmail+"', Contrasena= '"+pPass+"', Tipo_usuario= '"+pType+"', placa_vehiculo= "+pPlaca+"  "
                + "WHERE (id_usuario = '"+pId+"');";
        int rows = database.executeNonQueryRows(sql);
        return rows;
    }
    
    
}
