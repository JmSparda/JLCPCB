<%-- 
    Document   : index
    Created on : 17/05/2016, 08:58:11 PM
    Author     : FAST
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession(true);
    Object usu_usuario = session.getAttribute("usu_usuario") == null ? null : session.getAttribute("usu_usuario");
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="assets/ico/favicon.html">
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="assets/css/theme.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/alertify.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">
    <link href="assets/css/form.css" rel="stylesheet" type="text/css"/>
    
</head>
<body>
     <%
         if(usu_usuario == null){
         }else{
     %>
     <script>
            setTimeout(function(){
                window.location = "dashboard.jsp";
            },0); 
     </script>
     <%
         }
     %>
    <div id="wrap">
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span12">
            <div class="row-fluid">
                <div class="widget container-narrow">
                    <div class="widget-header">
                        <h5><span class="glyphicon glyphicon-user"></span> CUENTA</h5>
                    </div>  
                    <div class="widget-body clearfix" style="padding:25px;">
                        <form action="login" method="POST" id="frmlogin">
                            <div class="control-group">
                                <div class="controls">
                                    <input class="btn-block" type="text" name="usu_usuario" id="usu_usuario" placeholder="Usuario">
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <input class="btn-block" type="password" name="usu_password" id="usu_password" placeholder="Contraseña">
                                </div>
                            </div>
                            <input type="hidden" name="login" value="1"/>
                            <div class="control-group">
                                <!--<a href="registro.jsp">Registrarme</a>-->
                            </div>
                            <!--<div class="control-group">
                                <a href="">Recuperar Contraseña</a>
                            </div>-->
                            <div class="control-group col-md-2 col-md-offset-3">
                                <button type="button submit" class="btn btn-primary" id="btniniciar" name="btniniciar">Iniciar Seccion</button>
                            </div>
                        </form>
                    </div>  
                </div>  
            </div><!--/row-fluid-->
        </div><!--/span10-->
      </div><!--/row-fluid-->
    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->
</body>
<script src="assets/js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="assets/js/main.js" type="text/javascript"></script>
</html>