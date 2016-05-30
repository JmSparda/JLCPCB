package Modelo;

import include.Datos;
import include.Perfil;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author FAST
 */
public class ModeloPerfil extends Conexion {
    
    //CREAR PERFILES
    public boolean crearPerfil(Perfil p){
        
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "call crearPerfil(?,?,?,?,?)";
            pst = getConnection().prepareCall(sql);
            pst.setString(1, p.getProf_codigo());
            pst.setString(2, p.getProf_nombre());
            pst.setString(3, p.getProf_descripcion());
            pst.setString(4, p.getFecha_modifi());
            pst.setString(5, p.getEstado());
            
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
    
    //CONSULTAR PERFILES
    public ArrayList<Perfil> consultaPerfil(){
        ArrayList<Perfil> perfil = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaPerfil()";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                perfil.add(new Perfil(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6)));
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
        return perfil;
    }
    //CONSULTA PERFIL ACTIVO
    public ArrayList<Perfil> consultaPerfilActivo(){
        ArrayList<Perfil> perfil = new ArrayList<>();
        ArrayList<Datos> datos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaPerfilActivo()";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                perfil.add(new Perfil(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6)));
                //AGREGAR PRUEBA
                int perfilid = rs.getInt(1);
                PreparedStatement pst2 = null;
                ResultSet rs2 = null;
                String sql2 = "call consultaModuloPerfilMenu(?)";
                pst2 = getConnection().prepareCall(sql2);
                pst2.setInt(1, perfilid);
                rs2 = pst2.executeQuery();
                
                while(rs2.next()){
                    datos.add (new Datos(rs2.getString(2), rs2.getString(3), "", "", "", rs2.getInt(1), 0, 0, 0, 0, 0, 0, 0, 0, 0));
                }
                /////////////////////////////////////////////////////
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
        return perfil;
    }
    
    
    
    public ArrayList<Datos>consultaModuloPerfilMenu2(int idPerfil){
        ArrayList<Datos> datos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaModuloPerfilMenu(?) ";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idPerfil);
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add (new Datos(rs.getString(3), "", "", "", "", rs.getInt(1), rs.getInt(4), 0, 0, 0, 0, 0, 0, 0, 0));
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
    
    public Datos consultaModuloPerfilMenu(int idPerfil){
        Datos datos = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaModuloPerfilMenu(?) ";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idPerfil);
            rs = pst.executeQuery();
            while(rs.next()){
                datos = new Datos(rs.getString(2), rs.getString(3), "", "", "", rs.getInt(1), 0, 0, 0, 0, 0, 0, 0, 0, 0);
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
    

    
    
    public Perfil obtenerPerfil(int idPerfil){
        Perfil perfil = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM admprof WHERE prof_id = ? ";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idPerfil);
            rs = pst.executeQuery();
            while(rs.next()){
                perfil = new Perfil(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6));
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
        return perfil;
    }
    
    
    
    //ACTUALIZAR PERFIL
    public boolean updatePerfil(Perfil p){
        
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "call updatePerfil(?,?,?,?,?,?)";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, p.getProf_id());
            pst.setString(2, p.getProf_codigo());
            pst.setString(3, p.getProf_nombre());
            pst.setString(4, p.getProf_descripcion());
            pst.setString(5, p.getFecha_modifi());
            pst.setString(6, p.getEstado());
            
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
    
    
    //ELIMINAR PERFIL
    public boolean eliminarPerfil(int idPerfil){
        boolean flag = false;
        PreparedStatement pst = null;
        
        try {
            String sql = "call eliminarPerfil(?)";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idPerfil);
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
    
    //CREAR USUARIO_PERFIL
    public boolean crearUsuProf(Datos d){
        
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "call crearUsuProf(?,?)";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, d.getValor6());
            pst.setInt(2, d.getValor8());
            
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
    
}
