package Modelo;

import include.Datos;
import include.Encriptar;
import include.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author JMLOPEZ
 */
public class ModeloUsuario extends Conexion{
    
    //CREAR
    public boolean crearUsuario(Usuario u){
        PreparedStatement pst = null;
        boolean flag = true;
        try {
            String sql = "call crearUsuario(?,?,?,?,?)";
            pst = getConnection().prepareStatement(sql);
            pst.setInt(1, u.getPer_id());
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
    
    //CONSULTAR USUARIOS
    public ArrayList<Usuario> consultaUsuario(){
        ArrayList<Usuario> usuario = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaUsuario()";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                usuario.add(new Usuario(0, rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)) );
            }
        } catch (Exception e) {
        } finally{
            try {
                if(getConnection()!= null) getConnection().close();
                if(pst !=null) pst.close();
            } catch (Exception e) {
                System.err.println("ErrorCone");
            }
        }
        return usuario;
    }
    
    //CONSULTAR USUARIO ACTIVO
    public ArrayList<Usuario> consultaUsuarioActivo(){
        ArrayList<Usuario> usuario = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaUsuarioActivo()";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                usuario.add(new Usuario(rs.getInt(1),rs.getString(3) , rs.getString(5)));
            }
        } catch (Exception e) {
        } finally{
            try {
                if(getConnection()!= null) getConnection().close();
                if(pst !=null) pst.close();
            } catch (Exception e) {
                System.err.println("ErrorCone");
            }
        }
        return usuario;
    }
    
    public Usuario obtenerUsuario(int idUsuario){
        Usuario usuario = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM admusu WHERE usu_id = ? ";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idUsuario);
            rs = pst.executeQuery();
            while(rs.next()){
                usuario = new Usuario(rs.getInt(1), rs.getString(3), rs.getString(5));
            }
        } catch (Exception e) {
        } finally{
            try {
                if(getConnection()!= null) getConnection().close();
                if(pst !=null) pst.close();
            } catch (Exception e) {
                System.err.println("ErrorCone");
            }
        }
        return usuario;
    }
    
    //ELIMINAR USUARIO
    public boolean eliminarUsuario(int idUsuario){
        boolean flag = false;
        PreparedStatement pst = null;
        
        try {
            String sql = "call eliminarUsuario(?)";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idUsuario);
            if(pst.executeUpdate() == 1){
                flag = true;
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
        return flag;
    }
    
    public boolean updateUsuario(Usuario u){
        
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "call updateUsuario(?,?,?,?)";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, u.getPer_id());
            pst.setString(2, u.getUsu_usuario());
            pst.setString(3, Encriptar.sha1(u.getUsu_password()));
            pst.setString(4, u.getUsu_estado());
            
            if(pst.executeUpdate()==1){
                flag = true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }finally{
            try {
                if(getConnection()!= null) getConnection().close();
                if(pst !=null) pst.close();
            } catch (Exception e) {
                System.err.println("ErrorCone");
            }
        }
        return flag;
    }
    
    ///CONSULTAR DATOS DE UN USUARIO
    public ArrayList<Datos>consultaDetalleUsuario(String usuusuario){
        ArrayList<Datos> datos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaDetalleUsuario(?) ";
            pst = getConnection().prepareCall(sql);
            pst.setString(1, usuusuario);
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add (new Datos(rs.getString(7), "", "", "", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
            }
        } catch (Exception e) {
        } finally{
            try {
                if(getConnection()!= null) getConnection().close();
                if(pst !=null) pst.close();
            } catch (Exception e) {
                System.err.println("ErrorCone");
            }
        }
        return datos;
    }   
    ////////////////////////////////
    
    
    
    //IDENTIFICAR
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
