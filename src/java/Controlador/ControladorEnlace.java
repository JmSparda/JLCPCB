package Controlador;

import Modelo.ModeloEnlace;
import include.Enlace;

/**
 *
 * @author FAST
 */
public class ControladorEnlace {
    
    public boolean crearEnlace(Enlace en){
        ModeloEnlace me = new ModeloEnlace();
        return me.crearEnlace(en);
    }
    
    public String consultaEnlace(){
        String htmlcode = "";
        ModeloEnlace me = new ModeloEnlace();
        for (Enlace en : me.consultaEnlace()) {
            htmlcode +="<tr>\n" +
                                "<td><div class=\"checkbox\"><input type=\"checkbox\"></div></td>\n" +
                                "<td id='id_enlace'>"+en.getBli_id()+"</td>\n" +
                                "<td>"+en.getModu_nombre()+"</td>\n" +
                                "<td>"+en.getBli_enlace()+"</td>\n" +
                                "<td>"+en.getBli_descripcion()+"</td>\n" +
                                "<td>"+en.getFecha_modifi()+"</td>\n" +
                                //"<td><span class=\"label label-success\">Active</span></td>\n" +
                                "<td class=\"text-center\">\n" +
                                    "<a id='btneditar' href='modificarenlace.jsp?id="+en.getBli_id()+"' class=\"btn btn-default btn-xs\"><i class=\"icon-pencil\"></i>Editar</a>\n" +
                                    "<a id='btneliminar' href=\"#\" class=\"btn btn-danger btn-xs\"><i class=\"icon-remove\"></i></a>\n" +
                                "</td>\n" +
                        "</tr>";
        }
        return htmlcode;
    }
    
    public String getEditViewEnlace(int idEnlace){
        ModeloEnlace me = new ModeloEnlace();
        Enlace en = me.obtenerEnlace(idEnlace);
        String htmlcode = "";
        /*htmlcode += "<div class=\"modal-dialog\" role=\"document\">\n" +
"        <form class=\"form-horizontal\" id=\"frmmodificar\" name=\"frmmodificar\">\n" +
"        <div class=\"modal-content \">\n" +
"            <div class=\"modal-header\">\n" +
"                <h4 class=\"modal-title\" id=\"myModalLabel\">MODIFICAR ENLACE</h4>\n" +
"            </div>\n" +
                                                                 
"            <div class=\"modal-body\">\n" +
"                <div class=\"row\">\n" +
"                            <label>MODULO</label>\n" +
"                            <input type=\"hidden\"  class=\"form-control\" name=\"usu_id\" id=\"usu_id\" value='"+u.getUsu_id()+"'  placeholder=\"USUARIO\">\n" +
"                            <input type=\"text\"  class=\"form-control\" name=\"usu_usuario\" id=\"usu_usuario\" value='"+u.getUsu_usuario()+"'  placeholder=\"USUARIO\" >\n" +
"                            <span class=\"help-block\"></span>\n" +
"               </div>"+
"               <div class=\"row\">\n" +
"                    <div class=\"col-md-6\">\n" +
"                        <div class=\"form-group\">\n" +
"                            <label>CONTRASEÑA</label>\n" +
"                            <input type=\"password\" class=\"form-control\" name=\"usu_password\" id=\"usu_password\" placeholder=\"PASSWORD\" >\n" +
"                            <span class=\"help-block\"></span>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                    <div class=\"col-md-6\">\n" +
"                        <div class=\"form-group\">\n" +
"                            <label>VERIFICAR CONTRASEÑA</label>\n" +
"                            <input type=\"password\" class=\"form-control\" name=\"usu_pass2\" id=\"usu_pass2\" placeholder=\"PASSWORD\" >\n" +
"                            <span class=\"help-block\"></span>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>"+
"                            <div class=\"control-group\">\n" +
"                                <label class=\"control-label\">ESTADO</label><br>\n" +
"                                <div class=\"controls\">\n" +
"                                    <div class=\"radio input-append bootstrap-timepicker-component\">\n" +
"                                        <label>\n";
        if(!"A".equals(u.getUsu_estado())){
            htmlcode += "<input type=\"radio\" name=\"usu_estado\" id=\"usu_estado\" value=\"A\" >\n";
        } else {
            htmlcode += "<input type=\"radio\" name=\"usu_estado\" id=\"usu_estado\" value=\"A\" checked>\n";
        }
        htmlcode +=
"                                            Activo\n" +
"                                        </label>\n" +
"                                    </div>\n" +
"                                    <div class=\"radio input-append bootstrap-timepicker-component\">\n" +
"                                        <label>\n";
        if(!"D".equals(u.getUsu_estado())){
            htmlcode += "<input type=\"radio\" name=\"usu_estado\" id=\"usu_estado\" value=\"D\" >\n";
        } else {
            htmlcode += "<input type=\"radio\" name=\"usu_estado\" id=\"usu_estado\" value=\"D\" checked>\n";
        }
        htmlcode +=
"                                            No Activo\n" +
"                                        </label>\n" +
"                                    </div>\n" +
"                                </div>\n" +
"                            </div>\n" +
"            </div>\n" +
"                            <div class=\"modal-footer\">\n" +
                                "<a href='tabla-usuarios.jsp' class=\"btn btn-default\">CANCELAR</a>\n" +
"                                <button type=\"button submit\" class=\"btn btn-primary\" id=\"btnmodificarusuario\" name='btnmodificarusuario' >GUARDAR</button>\n" +
"                            </div>\n" +
"        </div>\n" +
"    </form>\n" +
"    </div>";*/
        return htmlcode;
    }
    
    
    public boolean updateENLACE(Enlace en){
        ModeloEnlace mp = new ModeloEnlace();
        return mp.updateEnlace(en);
    }
    
    
    //ELIMINAR USUARIO
    public boolean eliminarEnlace(int id){
        ModeloEnlace mt = new ModeloEnlace();
        return mt.eliminarEnlace(id);
    }
    
}
