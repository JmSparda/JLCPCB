package include;

/**
 *
 * @author JMLOPEZ
 */
public class Usuario {
    private int usu_id;
    private int tra_id;
    private String usu_usuario;
    private String usu_password;
    private String usu_estado;

    public Usuario() {
    }

    public Usuario(int usu_id, int tra_id, String usu_usuario, String usu_password, String usu_estado) {
        this.usu_id = usu_id;
        this.tra_id = tra_id;
        this.usu_usuario = usu_usuario;
        this.usu_password = usu_password;
        this.usu_estado = usu_estado;
    }

    /**
     * @return the usu_id
     */
    public int getUsu_id() {
        return usu_id;
    }

    /**
     * @param usu_id the usu_id to set
     */
    public void setUsu_id(int usu_id) {
        this.usu_id = usu_id;
    }

    /**
     * @return the tra_id
     */
    public int getTra_id() {
        return tra_id;
    }

    /**
     * @param tra_id the tra_id to set
     */
    public void setTra_id(int tra_id) {
        this.tra_id = tra_id;
    }

    /**
     * @return the usu_usuario
     */
    public String getUsu_usuario() {
        return usu_usuario;
    }

    /**
     * @param usu_usuario the usu_usuario to set
     */
    public void setUsu_usuario(String usu_usuario) {
        this.usu_usuario = usu_usuario;
    }

    /**
     * @return the usu_password
     */
    public String getUsu_password() {
        return usu_password;
    }

    /**
     * @param usu_password the usu_password to set
     */
    public void setUsu_password(String usu_password) {
        this.usu_password = usu_password;
    }

    /**
     * @return the usu_estado
     */
    public String getUsu_estado() {
        return usu_estado;
    }

    /**
     * @param usu_estado the usu_estado to set
     */
    public void setUsu_estado(String usu_estado) {
        this.usu_estado = usu_estado;
    } 
    
}