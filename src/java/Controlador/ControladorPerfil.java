package Controlador;

import Modelo.ModeloPerfil;
import include.Datos;
import include.Perfil;

/**
 *
 * @author FAST
 */
public class ControladorPerfil {
    
    //CREAR PERFIL
    public boolean crearPERFIL(Perfil p){
        ModeloPerfil mp = new ModeloPerfil();
        return mp.crearPerfil(p);
    }
    
    //CREAR DATOS DE TABLA A TRAVES DE CODIGO HTML
    public String consultaPERFIL(){
        String htmlcode = "";
        ModeloPerfil modperf = new ModeloPerfil();
        for(Perfil p : modperf.consultaPerfil()){
            htmlcode +="<tr>\n" +
                                "<td><div class=\"checkbox\"><input type=\"checkbox\"></div></td>\n" +
                                "<td id='id_perfil'>"+p.getProf_id()+"</td>\n" +
                                "<td>"+p.getProf_codigo()+"</td>\n" +
                                "<td>"+p.getProf_nombre()+"</td>\n" +
                                "<td>"+p.getProf_descripcion()+"</td>\n" +
                                "<td>"+p.getEstado()+"</td>\n" +
                                //"<td><span class=\"label label-success\">Active</span></td>\n" +
                                "<td class=\"text-center\">\n" +
                                    "<a id='btneditar' href='modificarperfil.jsp?id="+p.getProf_id()+"' class=\"btn btn-default btn-xs\"><i class=\"icon-pencil\"></i>Editar</a>\n" +
                                    "<a id='btneliminar' href=\"#\" class=\"btn btn-danger btn-xs\"><i class=\"icon-remove\"></i></a>\n" +
                                "</td>\n" +
                        "</tr>";
        }
        return htmlcode;
    }
    
    //CONSULTA EN CHECKBOX
    public String consultaPERFILCHECKBOX(){
        String htmlcode = "";
        ModeloPerfil modperf = new ModeloPerfil();
        for(Perfil p : modperf.consultaPerfilActivo()){
            htmlcode +=
                    "<li class=\"list-group-item\">\n" +
"                           "+p.getProf_nombre()+"\n" +
"                           <div class=\"material-switch pull-right\">\n" +
"                               <input id='"+p.getProf_id()+"' name=\"usu_prof[]\" value='"+p.getProf_id()+"' type=\"checkbox\"/>\n" +
"                               <label for='"+p.getProf_id()+"' class=\"label-primary\"></label>\n" +
"                           </div>\n" +
"                       </li>";
        }
        return htmlcode;
    }
    
    //ACTUALIZAR PERFIL
    public String getEditViewPerfil(int idPerfil){
        ModeloPerfil mp = new ModeloPerfil();
        Perfil p = mp.obtenerPerfil(idPerfil);
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
"                            <input type=\"hidden\"  class=\"form-control\" name=\"prof_id\" id=\"prof_id\" value='"+p.getProf_id()+"'  placeholder=\"CODIGO\">\n" +
"                            <input type=\"text\"  class=\"form-control\" name=\"prof_codigo\" id=\"prof_codigo\" value='"+p.getProf_codigo()+"'  placeholder=\"CODIGO\">\n" +
"                            <span class=\"help-block\"></span>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                    <div class=\"col-md-9\">\n" +
"                        <div class=\"form-group\">\n" +
"                            <label>NOMBRE</label>\n" +
"                            <input type=\"text\" class=\"form-control\" name=\"prof_nombre\" id=\"prof_nombre\" value='"+p.getProf_nombre()+"' placeholder=\"NOMBRE\">\n" +
"                            <span class=\"help-block\"></span>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"                            <label class=\"control-label\" >DESCRIPCION</label>\n" +
"                            <div class=\"form-group\">\n" +
"                                <textarea class=\"form-control\" rows=\"5\" name=\"prof_descripcion\" id=\"prof_descripcion\" placeholder=\"DESCRIPCION\">"+p.getProf_descripcion()+"</textarea>\n" +
"                                <span class=\"help-block\"></span>\n" +
"                            </div>\n" +
"                            <div class=\"control-group\">\n" +
"                                <label class=\"control-label\">ESTADO</label><br>\n" +
"                                <div class=\"controls\">\n" +
"                                    <div class=\"radio input-append bootstrap-timepicker-component\">\n" +
"                                        <label>\n";
        if(!"A".equals(p.getEstado())){
            htmlcode += "<input type=\"radio\" name=\"prof_estado\" id=\"prof_estado\" value=\"A\" >\n";
        } else {
            htmlcode += "<input type=\"radio\" name=\"prof_estado\" id=\"prof_estado\" value=\"A\" checked>\n";
        }
        htmlcode +=
"                                            Activo\n" +
"                                        </label>\n" +
"                                    </div>\n" +
"                                    <div class=\"radio input-append bootstrap-timepicker-component\">\n" +
"                                        <label>\n";
        if(!"D".equals(p.getEstado())){
            htmlcode += "<input type=\"radio\" name=\"prof_estado\" id=\"prof_estado\" value=\"D\" >\n";
        } else {
            htmlcode += "<input type=\"radio\" name=\"prof_estado\" id=\"prof_estado\" value=\"D\" checked>\n";
        }
        htmlcode +=
"                                            No Activo\n" +
"                                        </label>\n" +
"                                    </div>\n" +
"                                </div>\n" +
"                            </div>\n" +
"            </div>\n" +
"                            <div class=\"modal-footer\">\n" +
                                "<a href='tabla-perfiles.jsp' class=\"btn btn-default\">CANCELAR</a>\n" +
"                                <button type=\"button submit\" class=\"btn btn-primary\" id=\"btnmodificarperfil\" name='btnmodificarperfil' >GUARDAR</button>\n" +
"                            </div>\n" +
"        </div>\n" +
"    </form>\n" +
"    </div>";
        return htmlcode;
    }
    
    
    //ACTUALIZAR PERFIL 2
    public boolean updatePERFIL(Perfil p){
        ModeloPerfil mp = new ModeloPerfil();
        return mp.updatePerfil(p);
    }
    
    
    //ELIMINAR PERFIL
    public boolean eliminarPERFIL(int id){
        ModeloPerfil mt = new ModeloPerfil();
        return mt.eliminarPerfil(id);
    }
    
    //
    public boolean crearUSUPROF(Datos d){
        ModeloPerfil mp = new ModeloPerfil();
        return mp.crearUsuProf(d);
    }
}
