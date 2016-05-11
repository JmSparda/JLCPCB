package include;

/**
 *
 * @author JMLOPEZ
 */
public class Sucursal {
    private int suc_id;
    private int emp_id;
    private String suc_nombre;
    private String suc_direccion;
    private String suc_telefono;
    private String suc_fechareg;
    private String user_nombre;
    private String fecha_modifi;

    public Sucursal() {
    }

    public Sucursal(int suc_id, int emp_id, String suc_nombre, String suc_direccion, String suc_telefono, String suc_fechareg, String user_nombre, String fecha_modifi) {
        this.suc_id = suc_id;
        this.emp_id = emp_id;
        this.suc_nombre = suc_nombre;
        this.suc_direccion = suc_direccion;
        this.suc_telefono = suc_telefono;
        this.suc_fechareg = suc_fechareg;
        this.user_nombre = user_nombre;
        this.fecha_modifi = fecha_modifi;
    }
   
    /**
     * @return the suc_id
     */
    public int getSuc_id() {
        return suc_id;
    }

    /**
     * @param suc_id the suc_id to set
     */
    public void setSuc_id(int suc_id) {
        this.suc_id = suc_id;
    }

    /**
     * @return the emp_id
     */
    public int getEmp_id() {
        return emp_id;
    }

    /**
     * @param emp_id the emp_id to set
     */
    public void setEmp_id(int emp_id) {
        this.emp_id = emp_id;
    }

    /**
     * @return the suc_nombre
     */
    public String getSuc_nombre() {
        return suc_nombre;
    }

    /**
     * @param suc_nombre the suc_nombre to set
     */
    public void setSuc_nombre(String suc_nombre) {
        this.suc_nombre = suc_nombre;
    }

    /**
     * @return the suc_direccion
     */
    public String getSuc_direccion() {
        return suc_direccion;
    }

    /**
     * @param suc_direccion the suc_direccion to set
     */
    public void setSuc_direccion(String suc_direccion) {
        this.suc_direccion = suc_direccion;
    }

    /**
     * @return the suc_telefono
     */
    public String getSuc_telefono() {
        return suc_telefono;
    }

    /**
     * @param suc_telefono the suc_telefono to set
     */
    public void setSuc_telefono(String suc_telefono) {
        this.suc_telefono = suc_telefono;
    }

    /**
     * @return the suc_fechareg
     */
    public String getSuc_fechareg() {
        return suc_fechareg;
    }

    /**
     * @param suc_fechareg the suc_fechareg to set
     */
    public void setSuc_fechareg(String suc_fechareg) {
        this.suc_fechareg = suc_fechareg;
    }

    /**
     * @return the user_nombre
     */
    public String getUser_nombre() {
        return user_nombre;
    }

    /**
     * @param user_nombre the user_nombre to set
     */
    public void setUser_nombre(String user_nombre) {
        this.user_nombre = user_nombre;
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
}
