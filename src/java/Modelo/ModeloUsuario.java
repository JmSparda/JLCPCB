package Modelo;

import include.Usuario;
import include.VariablesGlobales;
import java.sql.PreparedStatement;

/**
 *
 * @author JMLOPEZ
 */
public class ModeloUsuario extends Conexion{
    
    public boolean crearUsuario(Usuario u){
        
        String fechaactual = VariablesGlobales.fecha_actual;
        PreparedStatement pst = null;
        boolean flag = true;
        try {
            String sql = "call crearUsuario(?,?,?,?,?,?)";
            pst = getConnection().prepareStatement(sql);
            pst.setInt(1, u.getUsu_id());
            pst.setInt(2, u.getTra_id());
            pst.setString(3, u.getUsu_usuario());
            pst.setString(4, u.getUsu_password());
            pst.setString(5, u.getUsu_estado());
            pst.setString(6, fechaactual);
        if(pst.executeUpdate()==1){
                flag = true;
            }
        } catch (Exception e) {
            System.err.println("Error "+e);
        } finally{
            try {
                if(getConnection()!= null) getConnection().close();
                if(pst !=null) pst.close();
            } catch (Exception e) {
            }
        }
        return flag;  
    }
    /*public static void main(String[] args) {
        ModeloUsuario modusu = new ModeloUsuario();
        System.out.println(modusu.crearUsuario(new Usuario(3, 3,  "falva", "falva", "Activo")));
    }*/
}
