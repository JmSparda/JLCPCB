/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import include.Enlace;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author FAST
 */
public class ModeloEnlace extends Conexion {
    
    //CREAR 
    public boolean crearEnlace(Enlace en){
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "call crearEnlace(?,?,?,?)";
            pst = getConnection().prepareStatement(sql);
            pst.setInt(1, en.getModu_id());
            pst.setString(2, en.getBli_enlace());
            pst.setString(3, en.getFecha_modifi());
            pst.setString(4, en.getFecha_modifi());
            if(pst.executeUpdate()==1){
                flag = true;
            }
        }catch (Exception e) {
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
    
    //CONSULTA ENLACES
    public ArrayList<Enlace> consultaEnlace(){
        ArrayList<Enlace> enlace = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaEnlace()";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                enlace.add(new Enlace(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
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
        return enlace;
    }
    
    //ELIMINAR ENLACE
    public boolean eliminarEnlace(int idEnlace){
        boolean flag = false;
        PreparedStatement pst = null;
        try {
            String sql = "call eliminarEnlace(?)";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idEnlace);
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
    
    public boolean updateEnlace(Enlace en){
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "call updateEnlace()";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, en.getBli_id());
            pst.setInt(2, en.getModu_id());
            pst.setString(3, en.getBli_enlace());
            pst.setString(4, en.getBli_descripcion());
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
    
    public Enlace obtenerEnlace(int idEnlace){
        Enlace enlace = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM blienlaces WHERE usu_id = ? ";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idEnlace);
            rs = pst.executeQuery();
            while(rs.next()){
                enlace = new Enlace(rs.getInt(1), rs.getString(3), rs.getString(5));
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
        return enlace;
    }
    
    //CONSULTAR ENLACE DE MODULO
    public ArrayList<Enlace>consultaEnlaceModulo(int idModulo){
        ArrayList<Enlace> enlace = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaEnlaceModulo(?) ";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idModulo);
            rs = pst.executeQuery();
            while(rs.next()){
                enlace.add (new Enlace(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),rs.getString(5)));
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
        return enlace;
    }   
    
    
    
}
