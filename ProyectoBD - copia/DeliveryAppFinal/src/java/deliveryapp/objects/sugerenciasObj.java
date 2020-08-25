/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deliveryapp.objects;

/**
 *
 * @author Usuario
 */
public class sugerenciasObj {
    private int Id;
    private String Email;
    private String Asunto;
    private String Descripcion;

    public sugerenciasObj(int pId, String pEmail, String pAsunto, String pDescripcion) {
        setId(pId);
        setEmail(pEmail);
        setAsunto(pAsunto);
        setDescripcion(pDescripcion);
    }

    public int getId() {
        return Id;
    }

    private void setId(int pId) {
        this.Id = pId;
    }

    public String getEmail() {
        return Email;
    }

    private void setEmail(String pEmail) {
        this.Email = pEmail;
    }

    public String getAsunto() {
        return Asunto;
    }

    private void setAsunto(String pAsunto) {
        this.Asunto = pAsunto;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    private void setDescripcion(String pDescripcion) {
        this.Descripcion = pDescripcion;
    }
    
    
    
}
