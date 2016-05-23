package include;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author FAST
 */
public class Modulo {
    private int modu_id;
    private String modu_cod;
    private String modu_nombre;
    private String modu_desc;
    private String fecha_modifi;
    private String estado;

    public Modulo() {
    }

    public Modulo(int modu_id, String modu_cod, String modu_nombre, String modu_desc, String estado) {
        this.modu_id = modu_id;
        this.modu_cod = modu_cod;
        this.modu_nombre = modu_nombre;
        this.modu_desc = modu_desc;
        this.estado = estado;
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        this.fecha_modifi = sdf.format(d);
    }
    
    public Modulo(String modu_cod, String modu_nombre, String modu_desc, String estado) {
        this.modu_cod = modu_cod;
        this.modu_nombre = modu_nombre;
        this.modu_desc = modu_desc;
        this.estado = estado;
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        this.fecha_modifi = sdf.format(d);
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
     * @return the modu_cod
     */
    public String getModu_cod() {
        return modu_cod;
    }

    /**
     * @param modu_cod the modu_cod to set
     */
    public void setModu_cod(String modu_cod) {
        this.modu_cod = modu_cod;
    }

    /**
     * @return the modu_nombre
     */
    public String getModu_nombre() {
        return modu_nombre;
    }

    /**
     * @param modu_nombre the modu_nombre to set
     */
    public void setModu_nombre(String modu_nombre) {
        this.modu_nombre = modu_nombre;
    }

    /**
     * @return the modu_desc
     */
    public String getModu_desc() {
        return modu_desc;
    }

    /**
     * @param modu_desc the modu_desc to set
     */
    public void setModu_desc(String modu_desc) {
        this.modu_desc = modu_desc;
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
