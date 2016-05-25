package include;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author JMLOPEZ
 */
public class Usuario {
    private int usu_id;
    private int per_id;
    private String usu_usuario;
    private String usu_password;
    private String usu_estado;
    private String usu_last_session;

    public Usuario(int usu_id, int per_id, String usu_usuario, String usu_password, String usu_estado, String usu_last_session) {
        this.usu_id = usu_id;
        this.per_id = per_id;
        this.usu_usuario = usu_usuario;
        this.usu_password = usu_password;
        this.usu_estado = usu_estado;
        this.usu_last_session = usu_last_session;
    }

    public Usuario(int per_id, String usu_usuario, String usu_password, String usu_estado) {
        this.per_id = per_id;
        this.usu_usuario = usu_usuario;
        this.usu_password = usu_password;
        this.usu_estado = usu_estado;
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        this.usu_last_session = sdf.format(d);
    }
    
    public Usuario(int usu_id, String usu_usuario, String usu_estado) {
        this.usu_id = usu_id;
        this.usu_usuario = usu_usuario;
        this.usu_estado = usu_estado;
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        this.usu_last_session = sdf.format(d);
    }
    
    
    public Usuario(String usu_usuario, String usu_password) {
        this.usu_usuario = usu_usuario;
        this.usu_password = usu_password;
    }
    
    public Usuario(String usu_usuario){
        this.usu_usuario = usu_usuario;
    }
    
    /**
     * @return the tra_id
     */
    
    public int getPer_id() {
        return per_id;
    }

    /**
     * @param per_id the tra_id to set
     */
    public void setPer_id(int per_id) {
        this.per_id = per_id;
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

    /**
     * @return the usu_last_session
     */
    public String getUsu_last_session() {
        return usu_last_session;
    }

    /**
     * @param usu_last_session the usu_last_session to set
     */
    public void setUsu_last_session(String usu_last_session) {
        this.usu_last_session = usu_last_session;
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

}