package Modelo;

import include.Datos;
import include.Persona;
import include.Trabajador;
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
            pst.setString(13, t.getTra_puesto());
            pst.setInt(14, t.getSuc_id());
            pst.setString(15, t.getTra_iniciocontrato());
            pst.setString(16, usuario);
            pst.setString(17, t.getFecha_modifi());
            
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
                trabajador.add(new Trabajador(rs.getInt("tra_id"), rs.getString("tra_puesto"), rs.getInt("suc_id"), rs.getString("tra_iniciocontrato"), rs.getInt("per_id"), rs.getString("per_nombre"), rs.getString("per_apellidop"), rs.getString("per_apellidom"), rs.getString("per_sexo"), rs.getString("per_fechanacimiento"), rs.getInt("per_documentoID"), rs.getInt("per_numerodocumento"), rs.getString("per_direccion"), rs.getString("per_telefono"), rs.getString("per_email"), rs.getString("per_foto")));
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
    
    public ArrayList<Persona> consultaPersona(){
        ArrayList<Persona> persona = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaPersona";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {                
                persona.add(new Persona(rs.getInt("per_id"), rs.getString("per_nombre"), rs.getString("per_apellidop"), rs.getString("per_apellidom"), rs.getString("per_sexo"), rs.getString("per_fechanacimiento"), rs.getInt("per_documentoID"), rs.getInt("per_numerodocumento"), rs.getString("per_direccion"), rs.getString("per_telefono"), rs.getString("per_email"), rs.getString("per_foto")));
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
        return persona;
    }
    
    
    public ArrayList<Datos> consultaTrabajador2(){
        ArrayList<Datos> datos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaTrabajador2";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {                
                datos.add(new Datos(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(1), 0, 0, 0, 0, 0, 0, 0, 0, 0));

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
        return datos;
    }
    /*public static void main(String[] args) {
        ModeloTrabajador modtra = new ModeloTrabajador();
        for (Datos t : modtra.consultaTrabajador2()) {
            System.out.println(t.getValor6());
            System.out.println(t.getValor1());
        }
    }*/
    
    public Datos consultaDocumentoTrabajador(int documento){
        Datos dato = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try{
            String sql = "call consultaDocumentoTrabajador(?)";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, documento);
            rs = pst.executeQuery();
            while (rs.next()){
                dato = new Datos(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(1), 0, 0, 0, 0, 0, 0, 0, 0, 0);
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
        return dato;
    }
    
    public boolean eliminarTrabajador(int idTrabajador){
        boolean flag = false;
        PreparedStatement pst = null;
        
        try {
            String sql = "call eliminarTrabajador(?)";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idTrabajador);
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

   /* public static void main(String[] args) {
        Datos t = new ModeloTrabajador().consultaDocumentoTrabajador(71484498);
        //for (Datos t : motra.consultaDocumentoTrabajador(71484498)) {
            //System.out.println(t.getValor6());
            System.out.println(t.getValor1());
            System.out.println(t.getValor2());
            System.out.println(t.getValor3());
        //}
    }*/
}
