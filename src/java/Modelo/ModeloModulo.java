package Modelo;

import include.Modulo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author FAST
 */
public class ModeloModulo extends Conexion {
    
    //CREAR PERFILES
    public boolean crearModulo(Modulo m){
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "call crearModulo(?,?,?,?,?)";
            pst = getConnection().prepareCall(sql);
            pst.setString(1, m.getModu_cod());
            pst.setString(2, m.getModu_nombre());
            pst.setString(3, m.getModu_desc());
            pst.setString(4, m.getFecha_modifi());
            pst.setString(5, m.getEstado());
            
            if(pst.executeUpdate()==1){
                flag = true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally{
            try {
                if(getConnection()!= null) getConnection().close();
                if(pst!=null) pst.close();
            } catch (Exception e) {
                System.err.println("ErrorCone");
            }
        }
        return flag;
    }
    
    
    //CONSULTAR PERFILES
    public ArrayList<Modulo> consultaModulo(){
        ArrayList<Modulo> modulo = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaModulo()";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                modulo.add(new Modulo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6)));
            }
        } catch (Exception e) {
        } finally{
            try {
                if(getConnection()!=null) getConnection().close();
                if(pst !=null) pst.close();
            } catch (Exception e) {
                System.err.println("ERRORCONE");
            }
        }
        return modulo;
    }
    
    public Modulo obtenerModulo(int idModulo){
        Modulo modulo = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM admmodu WHERE modu_id = ? ";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idModulo);
            rs = pst.executeQuery();
            while(rs.next()){
                modulo = new Modulo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6));
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
        return modulo;
    }
    //ACTUALIZAR MODULO
    public boolean updateModulo(Modulo m){
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "call updateModulo(?,?,?,?,?,?)";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, m.getModu_id());
            pst.setString(2, m.getModu_cod());
            pst.setString(3, m.getModu_nombre());
            pst.setString(4, m.getModu_desc());
            pst.setString(5, m.getFecha_modifi());
            pst.setString(6, m.getEstado());
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
    
    
    //ELIMINAR MODULO
    public boolean eliminarModulo(int idModulo){
        boolean flag = false;
        PreparedStatement pst = null;
        try {
            String sql = "call eliminarModulo(?)";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idModulo);
            if(pst.executeUpdate()==1){
                flag = true;
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
        return flag;
    }
}
