/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package include;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author FAST
 */
public class Perfil {
    private int prof_id;
    private String prof_codigo;
    private String prof_nombre;
    private String prof_descripcion;
    private String fecha_modifi;
    private String estado;

    public Perfil() {
    }

    public Perfil(int prof_id, String prof_codigo, String prof_nombre, String prof_descripcion,  String estado) {
        this.prof_id = prof_id;
        this.prof_codigo = prof_codigo;
        this.prof_nombre = prof_nombre;
        this.prof_descripcion = prof_descripcion;
        this.estado = estado;
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        this.fecha_modifi = sdf.format(d);
    }
    
    public Perfil(String prof_codigo, String prof_nombre, String prof_descripcion,  String estado) {
        this.prof_codigo = prof_codigo;
        this.prof_nombre = prof_nombre;
        this.prof_descripcion = prof_descripcion;
        this.estado = estado;
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        this.fecha_modifi = sdf.format(d);
    }

    /**
     * @return the prof_id
     */
    public int getProf_id() {
        return prof_id;
    }

    /**
     * @param prof_id the prof_id to set
     */
    public void setProf_id(int prof_id) {
        this.prof_id = prof_id;
    }

    /**
     * @return the prof_codigo
     */
    public String getProf_codigo() {
        return prof_codigo;
    }

    /**
     * @param prof_codigo the prof_codigo to set
     */
    public void setProf_codigo(String prof_codigo) {
        this.prof_codigo = prof_codigo;
    }

    /**
     * @return the prof_nombre
     */
    public String getProf_nombre() {
        return prof_nombre;
    }

    /**
     * @param prof_nombre the prof_nombre to set
     */
    public void setProf_nombre(String prof_nombre) {
        this.prof_nombre = prof_nombre;
    }

    /**
     * @return the prof_descripcion
     */
    public String getProf_descripcion() {
        return prof_descripcion;
    }

    /**
     * @param prof_descripcion the prof_descripcion to set
     */
    public void setProf_descripcion(String prof_descripcion) {
        this.prof_descripcion = prof_descripcion;
    }

    /**
     * @return the fecha_modifi
     */
    public String getFecha_modifi() {
        return fecha_modifi;
    }

    /**
     * @param fecha_modifi the fecha_modifi to set
     */
    public void setFecha_modifi(String fecha_modifi) {
        this.fecha_modifi = fecha_modifi;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }


}
    
    

   