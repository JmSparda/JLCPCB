package Controlador;

import Modelo.ModeloTrabajador;
import include.Datos;
import include.Persona;
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
    public String consultaTrabajadorCBX(){
        String htmlcode = "";
        ModeloTrabajador modelot = new ModeloTrabajador();
        for (Trabajador t : modelot.consultaTrabajador()) {
            htmlcode += "<option value='"+t.getPer_id()+"'>"+t.getPer_numerodocumento()+"</option>";
            //htmlcode += "<option value=\"DNI\">DNI</option>";
        }
        return htmlcode;
    }
    

    public String consultaIDPERSONA(){
        String htmlcode = "";
        ModeloTrabajador modetra = new ModeloTrabajador();
        for (Persona p : modetra.consultaPersona()) {
            htmlcode = "<input type=\"hidden\" value='"+(p.getPer_id()+1) +"' name=\"per_id\" id=\"per_id\">";
        }
        return htmlcode;
    }
    
    public String consultaTRABAJADOR(){
        String htmlcode = "";
        ModeloTrabajador modetra = new ModeloTrabajador();
        for (Datos t : modetra.consultaTrabajador2()) {
            htmlcode +="<tr>\n" +
                                "<td><div class=\"checkbox\"><input type=\"checkbox\"></div></td>\n" +
                                "<td id='id_trabajador'>"+t.getValor6()+"</td>\n" +
                                "<td>"+t.getValor1()+"</td>\n" +
                                "<td>"+t.getValor2()+"</td>\n" +
                                "<td>"+t.getValor3()+"</td>\n" +
                                "<td>"+t.getValor4()+"</td>\n" +
                                //"<td><span class=\"label label-success\">Active</span></td>\n" +
                                "<td class=\"text-right\">\n" +
                                    "<a id='btneditar' href=\"#\" class=\"btn btn-default btn-xs\"><i class=\"icon-pencil\"></i>Editar</a>\n" +
                                    "<a id='btneliminar' href=\"#\" class=\"btn btn-danger btn-xs\"><i class=\"icon-remove\"></i></a>\n" +
                                "</td>\n" +
                        "</tr>";
        }
        return htmlcode;
    }
    public String consultaDocumentoTrabajador(int documento){
       
        
        Datos t = new ModeloTrabajador().consultaDocumentoTrabajador(documento);
        
        String dato1 = t.getValor2();
        //for (Datos t : motra.consultaDocumentoTrabajador(71484498)) {
            //System.out.println(t.getValor6());
            
            //System.out.println(t.getValor1());
            //System.out.println(t.getValor2());
            //System.out.println(t.getValor3());
        //}
        return dato1;
    }
    
    
    public boolean eliminarTrabajador(int id){
        ModeloTrabajador mt = new ModeloTrabajador();
        return mt.eliminarTrabajador(id);
    }
    
}