<%-- 
    Document   : tabla-bliopciones
    Created on : 27/05/2016, 12:34:08 AM
    Author     : FAST
--%>
<%@page import="Controlador.ControladorUsuario"%>
<%@page import="include.Usuario"%>
<%@page import="Controlador.ControladorModulo"%>
<%@page import="Controlador.ControladorEnlace"%>
<!DOCTYPE html>
<%
    Controlador.ControladorModulo cm = new ControladorModulo();
    Controlador.ControladorEnlace ce = new ControladorEnlace();
%>
<%
     HttpSession sesion = request.getSession(true);
     Object usu_usuario = session.getAttribute("usu_usuario") == null ? null : session.getAttribute("usu_usuario");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='stylesheet' href='assets/estilos.css'>
    <link href='http://fonts.googleapis.com/css?family=Oswald:300,400,700|Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/favicon.ico" rel="shortcut icon">
    <link href="assets/apple-touch-icon.png" rel="apple-touch-icon">
    <link href="assets/css/form.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/other.css" rel="stylesheet" type="text/css"/>
    
    
    <title>Tabla de Enlaces</title>
</head>
<body class="body-dark-linen">
    <!------CREAR UNA CONEXION Y CONSULTA DE USUARIO LOGUEADO-------->
        <%
            if(usu_usuario != null){
                Controlador.ControladorUsuario cu = new ControladorUsuario();
                Usuario user = new Usuario(usu_usuario.toString());
        %>
    <!--------------------------------------------------------------->
    <div class="all-wrapper">
        <div class="row">
            <div class="col-md-3">
                <div class="text-center">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <!--BARRA LATERAL IZQUIERDA-->
            <div class="side-bar-wrapper collapse navbar-collapse navbar-ex1-collapse">
            <%=cu.getViewUserFoto(user)%>
            <jsp:include page="assets/estructura/BLI.jsp" flush="true" />
            <!--FIN DE LA BARRA LATERAL IZQUIERDA-->
            </div>
            <div class="col-md-9">
                <div class="content-wrapper">
                    <div class="content-inner content-inner-white">
                        <div class="page-header page-header-dark-blue">
                            <!--BOTONES PARA BARRA SUPERIOR DERECHA-->
                            <jsp:include page="assets/estructura/BSD.jsp" flush="true" />
                            <!--FIN DEBOTONES PARA BARRA SUPERIOR DERECHA-->
                            <h1><i class="icon-bar-chart"></i>Registro de Enlaces</h1>
                        </div>
                        <div class="main-content">
                            <div class="widget">
                                <h3 class="section-title first-title"><i class="icon-table"></i>Tabla Enlaces</h3>
                                <div class=" row">
                                    <div class="">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalAsignarEnlace" data-backdrop="static" data-keyboard="false">
                                            <span class="btn-label"><i class="icon-plus"></i></span>Asignar Enlace
                                        </button>
                                    </div>
                                </div>
                                <br>
                                <div class="widget-content-white glossed">
                                    <div class="padded">
                                        <table class="table table-striped table-bordered table-hover datatable">
                                            <thead>
                                                <tr>
                                                    <th><div class="checkbox"><input type="checkbox"></div></th>
                                                    <th>ID</th>
                                                    <th>MODULO</th>
                                                    <th>ENLACE</th>
                                                    <th>DESCRIPCION</th>
                                                    <th>FECHA</th>
                                                    <!--<th>Status</th>-->
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- DATOS DE LA BD EN LA TABLA-->
                                                <%=ce.consultaEnlace()%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>

<div class="modal fade" id="myModalAsignarEnlace" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form action="addEnlace" class="form-horizontal" id="frmregistroenlace" name="frmregistroenlace" method="POST">
            <div class="modal-content ">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Asignar Enlace a Módulo</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <label class="control-label">MODULO</label>
                        <div class="controls">
                            <div class="input-append bootstrap-timepicker-component">
                                <select name="modu_id" id="modu_id" class="form-control">
                                  <option value="" selected="selected">--SELECCIONAR--</option>
                                  <%= cm.consultaMODULOCBX()%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="controls">
                            <label>ENLACE</label>
                            <input type="text"  class="form-control" name="bli_enlace" id="bli_enlace" placeholder="USUARI">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <label class="control-label" >DESCRIPCION</label>
                    <div class="form-group">
                        <textarea class="form-control" rows="5" name="bli_descripcion" id="bli_descripcion" placeholder="DESCRIPCION"></textarea>
                        <span class="help-block"></span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="button submit" class="btn btn-primary" id="btnregistro" name="btnregistro">Guardar</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<!----------------FIN DE CONSULTA LOGIN------------------->
        <%
            }else{
        %>
    <script>
        window.location = "index.jsp";
     </script>
        <%   }
        %>
<!----------------------------------------------------------->
<script src="assets/ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="assets/ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="assets/js/main.js" type="text/javascript"></script>
<script src="assets/js/admEnlace.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<script src='assets/estilos4.js'></script>
<script src='assets/estilos3.js'></script>
</html>
