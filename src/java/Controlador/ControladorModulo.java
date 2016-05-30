package Controlador;

import Modelo.ModeloModulo;
import include.Datos;
import include.Modulo;

/**
 *
 * @author FAST
 */
public class ControladorModulo {
    
    //CREAR MODULO
    public boolean crearMODULO(Modulo m){
        ModeloModulo mm = new ModeloModulo();
        return mm.crearModulo(m);
    }
    
    //CREAR DATOS TABLA --------- READ
    public String consultaMODULO(){
        String htmlcode ="";
        ModeloModulo modmo = new ModeloModulo();
        for (Modulo m : modmo.consultaModulo()) {
            htmlcode +="<tr>\n" +
                                "<td><div class=\"checkbox\"><input type=\"checkbox\"></div></td>\n" +
                                "<td id='id_modulo'>"+m.getModu_id()+"</td>\n" +
                                "<td>"+m.getModu_cod()+"</td>\n" +
                                "<td>"+m.getModu_nombre()+"</td>\n" +
                                "<td>"+m.getModu_desc()+"</td>\n" +
                                "<td>"+m.getEstado()+"</td>\n" +
                                //"<td><span class=\"label label-success\">Active</span></td>\n" +
                                "<td class=\"text-center\">\n" +
                                    "<a id='btneditar' href='modificarmodulo.jsp?id="+m.getModu_id()+"' class=\"btn btn-default btn-xs\"><i class=\"icon-pencil\"></i>Editar</a>\n" +
                                    "<a id='btneliminar' href=\"#\" class=\"btn btn-danger btn-xs\"><i class=\"icon-remove\"></i></a>\n" +
                                "</td>\n" +
                        "</tr>";
        }
        
        return htmlcode;
    }
    
    //ACTUALIZAR MODULO
        public String getEditViewModulo(int idModulo){
        ModeloModulo mp = new ModeloModulo();
        Modulo m = mp.obtenerModulo(idModulo);
        String htmlcode = "";
        htmlcode += "<div class=\"modal-dialog\" role=\"document\">\n" +
"        <form class=\"form-horizontal\" id=\"frmmodificar\" name=\"frmmodificar\">\n" +
"        <div class=\"modal-content \">\n" +
"            <div class=\"modal-header\">\n" +
"                <h4 class=\"modal-title\" id=\"myModalLabel\">MODIFICAR PERFIL</h4>\n" +
"            </div>\n" +
                                                                 
"            <div class=\"modal-body\">\n" +
"                <div class=\"row\">\n" +
"                    <div class=\"col-md-3\">\n" +
"                        <div class=\"form-group\">\n" +
"                            <label>CODIGO</label>\n" +
"                            <input type=\"hidden\"  class=\"form-control\" name=\"modu_id\" id=\"modu_id\" value='"+m.getModu_id()+"'  placeholder=\"CODIGO\">\n" +
"                            <input type=\"text\"  class=\"form-control\" name=\"modu_cod\" id=\"modu_cod\" value='"+m.getModu_cod()+"'  placeholder=\"CODIGO\">\n" +
"                            <span class=\"help-block\"></span>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                    <div class=\"col-md-9\">\n" +
"                        <div class=\"form-group\">\n" +
"                            <label>NOMBRE</label>\n" +
"                            <input type=\"text\" class=\"form-control\" name=\"modu_nombre\" id=\"modu_nombre\" value='"+m.getModu_nombre()+"' placeholder=\"NOMBRE\">\n" +
"                            <span class=\"help-block\"></span>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"                            <label class=\"control-label\" >DESCRIPCION</label>\n" +
"                            <div class=\"form-group\">\n" +
"                                <textarea class=\"form-control\" rows=\"5\" name=\"modu_desc\" id=\"modu_desc\" placeholder=\"DESCRIPCION\">"+m.getModu_desc()+"</textarea>\n" +
"                                <span class=\"help-block\"></span>\n" +
"                            </div>\n" +
"                            <div class=\"control-group\">\n" +
"                                <label class=\"control-label\">ESTADO</label><br>\n" +
"                                <div class=\"controls\">\n" +
"                                    <div class=\"radio input-append bootstrap-timepicker-component\">\n" +
"                                        <label>\n";
        if(!"A".equals(m.getEstado())){
            htmlcode += "<input type=\"radio\" name=\"modu_estado\" id=\"modu_estado\" value=\"A\" >\n";
        } else {
            htmlcode += "<input type=\"radio\" name=\"modu_estado\" id=\"modu_estado\" value=\"A\" checked>\n";
        }
        htmlcode +=
"                                            Activo\n" +
"                                        </label>\n" +
"                                    </div>\n" +
"                                    <div class=\"radio input-append bootstrap-timepicker-component\">\n" +
"                                        <label>\n";
        if(!"D".equals(m.getEstado())){
            htmlcode += "<input type=\"radio\" name=\"modu_estado\" id=\"modu_estado\" value=\"D\" >\n";
        } else {
            htmlcode += "<input type=\"radio\" name=\"modu_estado\" id=\"modu_estado\" value=\"D\" checked>\n";
        }
        htmlcode +=
"                                            No Activo\n" +
"                                        </label>\n" +
"                                    </div>\n" +
"                                </div>\n" +
"                            </div>\n" +
"            </div>\n" +
"                            <div class=\"modal-footer\">\n" +
                                "<a href='tabla-modulos.jsp' class=\"btn btn-default\">CANCELAR</a>\n" +
"                                <button type=\"button submit\" class=\"btn btn-primary\" id=\"btnmodificarmodulo\" name='btnmodificarmodulo' >GUARDAR</button>\n" +
"                            </div>\n" +
"        </div>\n" +
"    </form>\n" +
"    </div>";
        return htmlcode;
    }
    //ACTUALIZAR MODULO 2
    public boolean updateMODULO(Modulo m){
        ModeloModulo mm = new ModeloModulo();
        return mm.updateModulo(m);
    }
    
    //ELIMINAR MODULO
    public boolean eliminarModulo(int id){
        Modelo.ModeloModulo mm = new ModeloModulo();
        return mm.eliminarModulo(id);
    }
    
    //CONSULTA MODULOS EN CHECKBOX
    public String consultaMODULOCHECKBOX(){
        String htmlcode = "";
        ModeloModulo mm = new ModeloModulo();
        for(Modulo m : mm.consultaModuloActivo()){
            htmlcode +=
                    "<li class=\"list-group-item\">\n" +
"                           "+m.getModu_nombre()+"\n" +
"                           <div class=\"material-switch pull-right\">\n" +
"                               <input id='"+m.getModu_id()+"' name=\"prof_modu[]\" value='"+m.getModu_id()+"' type=\"checkbox\"/>\n" +
"                               <label for='"+m.getModu_id()+"' class=\"label-primary\"></label>\n" +
"                           </div>\n" +
"                       </li>";
        }
        return htmlcode;
    }
    
    //CONSULTA MODULOS EN CMBBOX
    public String consultaMODULOCBX(){
        String htmlcode = "";
        ModeloModulo mm = new ModeloModulo();
        for(Modulo m : mm.consultaModuloActivo()){
            htmlcode += "<option value='"+m.getModu_id()+"'>"+m.getModu_nombre()+"</option>";
        }
        return htmlcode;
    }
    
    public boolean crearPROFMODU(Datos d){
        ModeloModulo mm = new ModeloModulo();
        return mm.crearProfModuf(d);
    }
}
