package Controlador;

import Modelo.ModeloConsultas;
import include.Documento;
import include.Sucursal;

/**
 *
 * @author JMLOPEZ
 */
public class ControladorConsultas {
    
    public String consultaDocumento(){
        String htmlcode = "";
        ModeloConsultas consul = new ModeloConsultas();
        for (Documento d : consul.consultaDocumento()) {
            htmlcode += "<option value='"+d.getPer_documentoid()+"'>"+d.getDescripcion()+"</option>";
            //htmlcode += "<option value=\"DNI\">DNI</option>";
        }
        return htmlcode;
    }
    
    public String consultaSucursal(){
        String htmlcode = "";
        ModeloConsultas consul = new ModeloConsultas();
        for (Sucursal s : consul.consultaSucursal()) {
            htmlcode += "<option value='"+s.getSuc_id()+"'>"+s.getSuc_nombre()+"</option>";
        }        
        return htmlcode;
    }
}
