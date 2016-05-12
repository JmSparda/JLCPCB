package Controlador;

import Modelo.ModeloUsuario;
import include.Usuario;

/**
 *
 * @author FAST
 */
public class ControladorUsuario {
    public boolean crearTrabajador(Usuario u){
        ModeloUsuario modelou = new ModeloUsuario();
        return modelou.crearUsuario(u);
    }
}
