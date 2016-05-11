package Controlador;

import Modelo.ModeloTrabajador;
import include.Trabajador;

/**
 *
 * @author JMLOPEZ
 */
public class ControladorTrabajador {
    public boolean crearTrabajador(Trabajador t){
        ModeloTrabajador modelot = new ModeloTrabajador();
        return modelot.crear_trabajador(t);
    }
    
    
    public String consultaIDTRABAJDOR(){
        String htmlcode = "";
        ModeloTrabajador modetra = new ModeloTrabajador();
        for (Trabajador t : modetra.consultaTrabajador()) {
            htmlcode = "<input type=\"hidden\" value='"+(t.getPer_id()+1) +"' name=\"per_id\" id=\"per_id\">";
        }
        return htmlcode;
    }
    
    
    
}
