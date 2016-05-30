package include;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author FAST
 */
public class Enlace {
    private int bli_id;
    private int modu_id;
    private String modu_nombre;
    private String bli_enlace;
    private String bli_descripcion;
    private String fecha_modifi;

    public Enlace() {
    }
    //CONSULTA ENLACE CON MODULO NOBMRE
    public Enlace(int bli_id, String modu_nombre, String bli_enlace, String bli_descripcion, String fecha_modifi) {
        this.bli_id = bli_id;
        this.modu_nombre = modu_nombre;
        this.bli_enlace = bli_enlace;
        this.bli_descripcion = bli_descripcion;
        this.fecha_modifi = fecha_modifi;
    }
    //CONSULTA ENLACE ID MODULO
    public Enlace(int bli_id, int modu_id, String bli_enlace, String bli_descripcion, String fecha_modifi) {
        this.bli_id = bli_id;
        this.modu_id = modu_id;
        this.bli_enlace = bli_enlace;
        this.bli_descripcion = bli_descripcion;
        this.fecha_modifi = fecha_modifi;
    }
    
    public Enlace(int modu_id, String bli_enlace, String bli_descripcion) {
        this.modu_id = modu_id;
        this.bli_enlace = bli_enlace;
        this.bli_descripcion = bli_descripcion;
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        this.fecha_modifi = sdf.format(d);
    }

    /**
     * @return the bli_id
     */
    public int getBli_id() {
        return bli_id;
    }

    /**
     * @param bli_id the bli_id to set
     */
    public void setBli_id(int bli_id) {
        this.bli_id = bli_id;
    }

    /**
     * @return the modu_id
     */
    public int getModu_id() {
        return modu_id;
    }

    /**
     * @param modu_id the modu_id to set
     */
    public void setModu_id(int modu_id) {
        this.modu_id = modu_id;
    }

    /**
     * @return the bli_enlace
     */
    public String getBli_enlace() {
        return bli_enlace;
    }

    /**
     * @param bli_enlace the bli_enlace to set
     */
    public void setBli_enlace(String bli_enlace) {
        this.bli_enlace = bli_enlace;
    }

    /**
     * @return the bli_descripcion
     */
    public String getBli_descripcion() {
        return bli_descripcion;
    }

    /**
     * @param bli_descripcion the bli_descripcion to set
     */
    public void setBli_descripcion(String bli_descripcion) {
        this.bli_descripcion = bli_descripcion;
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
     * @return the modu_nombre
     */
    public String getModu_nombre() {
        return modu_nombre;
    }

    /**
     * @param modu_nombre the fecha_modifi to set
     */
    public void setModu_nombre(String modu_nombre) {
        this.modu_nombre = modu_nombre;
    }
    
}