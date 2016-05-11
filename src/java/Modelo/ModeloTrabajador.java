package Modelo;

import include.Trabajador;
import include.VariablesGlobales;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author JMLOPEZ
 */
public class ModeloTrabajador extends Conexion {
    
    public boolean crear_trabajador(Trabajador t){
        String usuario = "ADMIN";
        String fechaActual = VariablesGlobales.fechahora_actual;
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "call crearTrabajador(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pst = getConnection().prepareStatement(sql);
            pst.setInt(1, t.getPer_id());
            pst.setString(2, t.getPer_nombre());
            pst.setString(3, t.getPer_apellidop());
            pst.setString(4, t.getPer_apellidom());
            pst.setString(5, t.getPer_sexo());
            pst.setString(6, t.getPer_fechanacimiento());
            pst.setInt(7, t.getPer_documentoID());
            pst.setInt(8, t.getPer_numerodocumento());
            pst.setString(9, t.getPer_direccion());
            pst.setString(10, t.getPer_telefono());
            pst.setString(11, t.getPer_email());
            pst.setString(12, t.getPer_foto());
            pst.setInt(13, t.getRol_id());
            pst.setInt(14, t.getSuc_id());
            pst.setString(15, t.getTra_iniciocontrato());
            pst.setString(16, usuario);
            pst.setString(17, fechaActual);
            
            if(pst.executeUpdate()==1){
                flag = true;
            }
        } catch (Exception e) {
        } finally{
            try {
                if(getConnection()!= null) getConnection().close();
                if(pst !=null) pst.close();
            } catch (Exception e) {
            }
        }
        return flag;        
    }
    
    public ArrayList<Trabajador> consultaTrabajador(){
        ArrayList<Trabajador> trabajador = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaTrabajador";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {                
                trabajador.add(new Trabajador(rs.getInt("tra_id"), rs.getInt("rol_id"), rs.getInt("suc_id"), rs.getString("tra_iniciocontrato"), rs.getInt("per_id"), rs.getString("per_nombre"), rs.getString("per_apellidop"), rs.getString("per_apellidom"), rs.getString("per_sexo"), rs.getString("per_fechanacimiento"), rs.getInt("per_documentoID"), rs.getInt("per_numerodocumento"), rs.getString("per_direccion"), rs.getString("per_telefono"), rs.getString("per_email"), rs.getString("per_foto")));
            }
        } catch (Exception e) {
        }finally{
            try {
                if(getConnection()!= null) getConnection().close();
                if(pst !=null) pst.close();
            } catch (Exception e) {
                System.err.println("ErrorCone");
            }
        }
        return trabajador;
    }
    
    
    /*public static void main(String[] args) {
        ModeloTrabajador modtra = new ModeloTrabajador();
        for (Trabajador t : modtra.consultaTrabajador()) {
            System.out.println(t.getTra_id()+1);
        }
    }*/
}
