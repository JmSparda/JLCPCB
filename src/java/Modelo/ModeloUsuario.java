package Modelo;

import include.Encriptar;
import include.Usuario;
import include.VariablesGlobales;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author JMLOPEZ
 */
public class ModeloUsuario extends Conexion{
    
    public boolean crearUsuario(Usuario u){
        
        PreparedStatement pst = null;
        boolean flag = true;
        try {
            String sql = "call crearUsuario(?,?,?,?,?)";
            pst = getConnection().prepareStatement(sql);
            pst.setInt(1, u.getTra_id());
            pst.setString(2, u.getUsu_usuario());
            pst.setString(3, Encriptar.sha1(u.getUsu_password()));
            pst.setString(4, u.getUsu_estado());
            pst.setString(5, u.getUsu_last_session());
            
            if(pst.executeUpdate()==1){
                flag = true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally{
            try {
                if(getConnection()!= null) getConnection().close();
                if(pst !=null) pst.close();
            } catch (Exception e) {
            }
        }
        return flag;  
    }
    
    public boolean autenticar(Usuario u){
        boolean flag = false;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call autenticar(?,?)";
            pst = getConnection().prepareCall(sql);
            pst.setString(1, u.getUsu_usuario());
            pst.setString(2, Encriptar.sha1(u.getUsu_password()));
            rs = pst.executeQuery();
            if(rs.absolute(1)){
                flag = true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }finally{
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
