<%-- 
    Document   : dashboard
    Created on : 17/05/2016, 09:30:34 PM
    Author     : FAST
--%>

<%@page import="include.Usuario"%>
<%@page import="Controlador.ControladorUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);//inicializamos la variable de Sesion 
    /*Una vez obtenida la variable de session se hace lo siguiente
        Creamos una variable OBJECT   y una validacion
        y hacemos una comparacion con la variable llamada desde el JSP llamada usu_usuario
        pero si usu_usuario == null entonces la variable username sera nula, 
        pero si existe se le asigna la variable usu_usuario
    */
    Object usu_usuario = session.getAttribute("usu_usuario") == null ? null : session.getAttribute("usu_usuario");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(usu_usuario != null){
                Controlador.ControladorUsuario cu = new ControladorUsuario();
                Usuario user = new Usuario(usu_usuario.toString());
        %>
        
            <%=cu.getViewUser(user)%>
        
        <%
            }else{
        %>
    <script>
            setTimeout(function(){
                window.location = "index.jsp";
            },0); 
     </script>
        <%   }
        %>
    </body>
</html>
