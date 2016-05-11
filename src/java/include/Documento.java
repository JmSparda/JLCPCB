/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package include;

/**
 *
 * @author JMLOPEZ
 */
public class Documento {
    private int per_documentoid;
    private String descripcion;

    public Documento() {
    }

    public Documento(int per_documentoid, String descripcion) {
        this.per_documentoid = per_documentoid;
        this.descripcion = descripcion;
    }

    /**
     * @return the per_documentoid
     */
    public int getPer_documentoid() {
        return per_documentoid;
    }

    /**
     * @param per_documentoid the per_documentoid to set
     */
    public void setPer_documentoid(int per_documentoid) {
        this.per_documentoid = per_documentoid;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
