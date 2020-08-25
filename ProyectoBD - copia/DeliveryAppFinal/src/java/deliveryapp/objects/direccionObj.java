/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deliveryapp.objects;


public class direccionObj {
    
    private int id;
    private String Direccion;
    private String Municipio;
    private String Colonia;
    private int NumCasa;
    private int id_usu;

    public direccionObj(int pId, String pDireccion, String pMunicipio, String pColonia, int pNumCasa, int pId_usu) {
        setId(pId);
        setDireccion(pDireccion);
        setMunicipio(pMunicipio);
        setColonia(pColonia);
        setNumCasa(pNumCasa);
        setId_usu(pId_usu);
    }

    
    
    
    public int getId() {
        return id;
    }

    private void setId(int pId) {
        this.id = pId;
    }

    public String getDireccion() {
        return Direccion;
    }

    private void setDireccion(String pDireccion) {
        this.Direccion = pDireccion;
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

    public int getNumCasa() {
        return NumCasa;
    }

    private void setNumCasa(int pNumCasa) {
        this.NumCasa = pNumCasa;
    }

    public int getId_usu() {
        return id_usu;
    }

    private void setId_usu(int pId_usu) {
        this.id_usu = pId_usu;
    }
    
    
}
