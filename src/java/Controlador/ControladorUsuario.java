package Controlador;

import Modelo.ModeloUsuario;
import include.Datos;
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
    
    public String getViewUserFoto(Usuario u){
        String htmlcode = "";
        htmlcode += "<a href='dashboard.jsp' class=\"logo hidden-sm hidden-xs\">";
        //htmlcode += "<img WIDTH=100 HEIGHT=150 src=\"assets/img/trabajadores/JUAN MANUEL CABANILLAS LOPEZ.jpg\" alt=\"\"/>";
        ModeloUsuario mu = new ModeloUsuario();
        for(Datos d : mu.consultaDetalleUsuario(u.getUsu_usuario())){
            htmlcode += "<img WIDTH=100 HEIGHT=150 src="+d.getValor1()+" alt=\"\"/>";
        }
        htmlcode +="    <span>"+u.getUsu_usuario()+"</span>\n" +
        "            </a>";
        return htmlcode;
    }
    
    //CREAR DATOS DE TABLA A TRAVES DE CODIGO HTML
    public String consultaUSUARIO(){
        String htmlcode = "";
        ModeloUsuario mu = new ModeloUsuario();
        for(Usuario u : mu.consultaUsuario()){
            htmlcode +="<tr>\n" +
                                "<td><div class=\"checkbox\"><input type=\"checkbox\"></div></td>\n" +
                                "<td id='id_usuario'>"+u.getPer_id()+"</td>\n" +
                                "<td>"+u.getUsu_usuario()+"</td>\n" +
                                "<td>"+u.getUsu_password()+"</td>\n" +
                                "<td>"+u.getUsu_estado()+"</td>\n" +
                                "<td>"+u.getUsu_last_session()+"</td>\n" +
                                //"<td><span class=\"label label-success\">Active</span></td>\n" +
                                "<td class=\"text-center\">\n" +
                                    "<a id='btneditar' href='modificarusuario.jsp?id="+u.getPer_id()+"' class=\"btn btn-default btn-xs\"><i class=\"icon-pencil\"></i>Editar</a>\n" +
                                    "<a id='btneliminar' href=\"#\" class=\"btn btn-danger btn-xs\"><i class=\"icon-remove\"></i></a>\n" +
                                "</td>\n" +
                        "</tr>";
        }
        return htmlcode;
    }
    
    public String getEditViewUsuario(int idUsuario){
        ModeloUsuario mp = new ModeloUsuario();
        Usuario u = mp.obtenerUsuario(idUsuario);
        String htmlcode = "";
        htmlcode += "<div class=\"modal-dialog\" role=\"document\">\n" +
"        <form class=\"form-horizontal\" id=\"frmmodificar\" name=\"frmmodificar\">\n" +
"        <div class=\"modal-content \">\n" +
"            <div class=\"modal-header\">\n" +
"                <h4 class=\"modal-title\" id=\"myModalLabel\">MODIFICAR PERFIL</h4>\n" +
"            </div>\n" +
                                                                 
"            <div class=\"modal-body\">\n" +
"                <div class=\"row\">\n" +
"                            <label>USUARIO</label>\n" +
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
"    </div>";
        return htmlcode;
    }
    public boolean updateUSUARIO(Usuario u){
        ModeloUsuario mp = new ModeloUsuario();
        return mp.updateUsuario(u);
    }
    
    
    //ELIMINAR USUARIO
    public boolean eliminarUSUARIO(int id){
        ModeloUsuario mt = new ModeloUsuario();
        return mt.eliminarUsuario(id);
    }
    
    //CONSULTAR USUARIOS ACTIVO
    public String consultaUsuarioCBX(){
        String htmlcode = "";
        ModeloUsuario modelot = new ModeloUsuario();
        for (Usuario u : modelot.consultaUsuarioActivo()) {
            htmlcode += "<option value='"+u.getUsu_id()+"'>"+u.getUsu_usuario()+"</option>";
            //htmlcode += "<option value=\"DNI\">DNI</option>";
        }
        return htmlcode;
    }
    
}
