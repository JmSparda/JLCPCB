package include;

/**
 *
 * @author JMLOPEZ
 */
public class Rol {
    
    private int rol_id;
    private String rol_descripcion;
    private String rol_estado;

    public Rol() {
    }

    public Rol(int rol_id, String rol_descripcion, String rol_estado) {
        this.rol_id = rol_id;
        this.rol_descripcion = rol_descripcion;
        this.rol_estado = rol_estado;
    }

    /**
     * @return the rol_id
     */
    public int getRol_id() {
        return rol_id;
    }

    /**
     * @param rol_id the rol_id to set
     */
    public void setRol_id(int rol_id) {
        this.rol_id = rol_id;
    }

    /**
     * @return the rol_descripcion
     */
    public String getRol_descripcion() {
        return rol_descripcion;
    }

    /**
     * @param rol_descripcion the rol_descripcion to set
     */
    public void setRol_descripcion(String rol_descripcion) {
        this.rol_descripcion = rol_descripcion;
    }

    /**
     * @return the rol_estado
     */
    public String getRol_estado() {
        return rol_estado;
    }

    /**
     * @param rol_estado the rol_estado to set
     */
    public void setRol_estado(String rol_estado) {
        this.rol_estado = rol_estado;
    }
    
}
