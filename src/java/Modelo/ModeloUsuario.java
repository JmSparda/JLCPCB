/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import include.Usuario;
import java.sql.PreparedStatement;

/**
 *
 * @author JMLOPEZ
 */
public class ModeloUsuario extends Conexion{
    public boolean crearUsuario(Usuario u){
        PreparedStatement pst = null;
        boolean flag = true;
        try {
            String sql = "call crearUsuario";
            pst = getConnection().prepareStatement(sql);
            pst.setInt(1, u.getUsu_id());
            pst.setString(2, u.getUsu_usuario());
            pst.setString(3, u.getUsu_password());
        } catch (Exception e) {
        }
        return flag;
    }
}
