package include;


/**
 *
 * @author JMLOPEZ
 */
public class Trabajador extends Persona {
    private int tra_id;
    private int rol_id;
    private int suc_id;
    private String tra_iniciocontrato;

    public Trabajador() {
    }

    public Trabajador(int tra_id, int rol_id, int suc_id, String tra_iniciocontrato, int per_id, String per_nombre, String per_apellidop, String per_apellidom, String per_sexo, String per_fechanacimiento, int per_documentoID, int per_numerodocumento, String per_direccion, String per_telefono, String per_email, String per_foto) {
        super(per_id, per_nombre, per_apellidop, per_apellidom, per_sexo, per_fechanacimiento, per_documentoID, per_numerodocumento, per_direccion, per_telefono, per_email, per_foto);
        this.tra_id = tra_id;
        this.rol_id = rol_id;
        this.suc_id = suc_id;
        this.tra_iniciocontrato = tra_iniciocontrato;
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
}
