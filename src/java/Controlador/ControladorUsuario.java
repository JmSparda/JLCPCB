package Controlador;

import Modelo.ModeloUsuario;
import include.Usuario;

/**
 *
 * @author FAST
 */
public class ControladorUsuario {
    
    public boolean crearUsuario(Usuario u){
        ModeloUsuario modelou = new ModeloUsuario();
        return modelou.crearUsuario(u);
    }
    
    public boolean validarUsuario(Usuario u){
        ModeloUsuario modelou = new ModeloUsuario();
        return modelou.autenticar(u);
    }
    
    public String getViewUser(Usuario u){
        String htmlcode = "";
        htmlcode += "<h2>Bienvenido " + u.getUsu_usuario()+ "</h2>";
        htmlcode += "<div><a href='logout'>Cerrar Session</a></div>";
        return htmlcode;
    }
    
}
