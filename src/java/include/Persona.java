package include;


/**
 *
 * @author JMLOPEZ
 */
public class Persona {
    private int per_id;
    private String per_nombre;
    private String per_apellidop;
    private String per_apellidom;
    private String per_sexo;
    private String per_fechanacimiento;
    private int per_documentoID;
    private int per_numerodocumento;
    private String per_direccion;
    private String per_telefono;
    private String per_email;
    private String per_foto;

    public Persona(){
        
    }

    public Persona(int per_id, String per_nombre, String per_apellidop, String per_apellidom, String per_sexo, String per_fechanacimiento, int per_documentoID, int per_numerodocumento, String per_direccion, String per_telefono, String per_email, String per_foto) {
        this.per_id = per_id;
        this.per_nombre = per_nombre;
        this.per_apellidop = per_apellidop;
        this.per_apellidom = per_apellidom;
        this.per_sexo = per_sexo;
        this.per_fechanacimiento = per_fechanacimiento;
        this.per_documentoID = per_documentoID;
        this.per_numerodocumento = per_numerodocumento;
        this.per_direccion = per_direccion;
        this.per_telefono = per_telefono;
        this.per_email = per_email;
        this.per_foto = per_foto;
    }
    
    /**
     * @return the per_id
     */
    public int getPer_id() {
        return per_id;
    }

    /**
     * @param per_id the per_id to set
     */
    public void setPer_id(int per_id) {
        this.per_id = per_id;
    }

    /**
     * @return the per_nombre
     */
    public String getPer_nombre() {
        return per_nombre;
    }

    /**
     * @param per_nombre the per_nombre to set
     */
    public void setPer_nombre(String per_nombre) {
        this.per_nombre = per_nombre;
    }

    /**
     * @return the per_apellidop
     */
    public String getPer_apellidop() {
        return per_apellidop;
    }

    /**
     * @param per_apellidop the per_apellidop to set
     */
    public void setPer_apellidop(String per_apellidop) {
        this.per_apellidop = per_apellidop;
    }

    /**
     * @return the per_apellidom
     */
    public String getPer_apellidom() {
        return per_apellidom;
    }

    /**
     * @param per_apellidom the per_apellidom to set
     */
    public void setPer_apellidom(String per_apellidom) {
        this.per_apellidom = per_apellidom;
    }

    /**
     * @return the per_sexo
     */
    public String getPer_sexo() {
        return per_sexo;
    }

    /**
     * @param per_sexo the per_sexo to set
     */
    public void setPer_sexo(String per_sexo) {
        this.per_sexo = per_sexo;
    }

    /**
     * @return the per_fechanacimiento
     */
    public String getPer_fechanacimiento() {
        return per_fechanacimiento;
    }

    /**
     * @param per_fechanacimiento the per_fechanacimiento to set
     */
    public void setPer_fechanacimiento(String per_fechanacimiento) {
        this.per_fechanacimiento = per_fechanacimiento;
    }

    /**
     * @return the per_documentoID
     */
    public int getPer_documentoID() {
        return per_documentoID;
    }

    /**
     * @param per_documentoID the per_documentoID to set
     */
    public void setPer_documentoID(int per_documentoID) {
        this.per_documentoID = per_documentoID;
    }

    /**
     * @return the per_numerodocumento
     */
    public int getPer_numerodocumento() {
        return per_numerodocumento;
    }

    /**
     * @param per_numerodocumento the per_numerodocumento to set
     */
    public void setPer_numerodocumento(int per_numerodocumento) {
        this.per_numerodocumento = per_numerodocumento;
    }

    /**
     * @return the per_direccion
     */
    public String getPer_direccion() {
        return per_direccion;
    }

    /**
     * @param per_direccion the per_direccion to set
     */
    public void setPer_direccion(String per_direccion) {
        this.per_direccion = per_direccion;
    }

    /**
     * @return the per_telefono
     */
    public String getPer_telefono() {
        return per_telefono;
    }

    /**
     * @param per_telefono the per_telefono to set
     */
    public void setPer_telefono(String per_telefono) {
        this.per_telefono = per_telefono;
    }

    /**
     * @return the per_email
     */
    public String getPer_email() {
        return per_email;
    }

    /**
     * @param per_email the per_email to set
     */
    public void setPer_email(String per_email) {
        this.per_email = per_email;
    }

    /**
     * @return the per_foto
     */
    public String getPer_foto() {
        return per_foto;
    }

    /**
     * @param per_foto the per_foto to set
     */
    public void setPer_foto(String per_foto) {
        this.per_foto = per_foto;
    }
}
