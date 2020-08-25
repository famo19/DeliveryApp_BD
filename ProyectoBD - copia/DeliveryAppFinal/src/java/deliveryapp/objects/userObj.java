/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deliveryapp.objects;


public class userObj {
 
    private int Id;
    private String Nombre;
    private String Apellido;
    private String Telefono;
    private String Email;
    private String Pass;
    private String Type;

    public userObj(int pId, String pNombre, String pApellido, String pTelefono, String pEmail, String pPass, String pType) {
        setId(pId);
        setNombre(pNombre);
        setApellido(pApellido);
        setTelefono(pTelefono);
        setEmail(pEmail);
        setPass(pPass);
        setType(pType);
        
    }

    public int getId() {
        return Id;
    }

    private void setId(int pId) {
        this.Id = pId;
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

    public String getTelefono() {
        return Telefono;
    }

    private void setTelefono(String pTelefono) {
        this.Telefono = pTelefono;
    }

    public String getEmail() {
        return Email;
    }

    private void setEmail(String pEmail) {
        this.Email = pEmail;
    }

    public String getPass() {
        return Pass;
    }

    private void setPass(String pPass) {
        this.Pass = pPass;
    }

    public String getType() {
        return Type;
    }

    private void setType(String pType) {
        this.Type = pType;
    }
    
    
    
}
