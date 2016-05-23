/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import include.Documento;
import include.Sucursal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author JMLOPEZ
 */
public class ModeloConsultas extends Conexion{
    
   
    public ArrayList<Documento> consultaDocumento(){
        ArrayList<Documento> documento = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String sql = "call consultaDocumento";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {                
                documento.add(new Documento(rs.getInt("per_documentoid"), rs.getString("descripcion")));
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
        return documento;
    }
    
    public ArrayList<Sucursal> consultaSucursal(){
        ArrayList<Sucursal> sucursal = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call consultaSucursal";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()){
                sucursal.add(new Sucursal(rs.getInt("suc_id"), rs.getInt("emp_id"), rs.getString("suc_nombre"), rs.getString("suc_direccion"), rs.getString("suc_telefono"), rs.getString("suc_fechareg"), rs.getString("user_nombre"), rs.getString("fecha_modifi")));
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
        return sucursal;
    }
    /*public static void main(String[] args) {
        ModeloConsultas consul = new ModeloConsultas();
        for (Rol r : consul.consultaRol()) {
            System.out.println(r.getRol_id());
            System.out.println(r.getRol_descripcion());
        }
    }*/
}
