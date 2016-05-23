package include;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 *
 * @author JMLOPEZ
 */
public class Trabajador extends Persona {
    private int tra_id;
    private String tra_puesto;
    private int suc_id;
    private String tra_iniciocontrato;
    private String fecha_modifi;

    public Trabajador() {
    }

    public Trabajador(int tra_id, String tra_puesto, int suc_id, String tra_iniciocontrato, int per_id, String per_nombre, String per_apellidop, String per_apellidom, String per_sexo, String per_fechanacimiento, int per_documentoID, int per_numerodocumento, String per_direccion, String per_telefono, String per_email, String per_foto) {
        super(per_id, per_nombre, per_apellidop, per_apellidom, per_sexo, per_fechanacimiento, per_documentoID, per_numerodocumento, per_direccion, per_telefono, per_email, per_foto);
        this.tra_id = tra_id;
        this.tra_puesto = tra_puesto;
        this.suc_id = suc_id;
        this.tra_iniciocontrato = tra_iniciocontrato;
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        this.fecha_modifi = sdf.format(d);
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
     * @return the rol_id
     */
    public String getTra_puesto() {
        return tra_puesto;
    }

    /**
     * @param rol_id the rol_id to set
     */
    public void setTra_puesto(String tra_puesto) {
        this.tra_puesto = tra_puesto;
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
     * @return the tra_iniciocontrato
     */
    public String getTra_iniciocontrato() {
        return tra_iniciocontrato;
    }

    /**
     * @param tra_iniciocontrato the tra_iniciocontrato to set
     */
    public void setTra_iniciocontrato(String tra_iniciocontrato) {
        this.tra_iniciocontrato = tra_iniciocontrato;
    }
    
    
    public String getFecha_modifi() {
        return fecha_modifi;
    }

    /**
     * @param fecha_modifi the usu_last_session to set
     */
    public void setFecha_modifi(String fecha_modifi) {
        this.fecha_modifi = fecha_modifi;
    }
}
