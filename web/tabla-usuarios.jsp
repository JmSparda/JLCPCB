<%-- 
    Document   : tabla-usuarios
    Created on : 23/05/2016, 07:57:27 PM
    Author     : FAST
--%>
<%@page import="Controlador.ControladorTrabajador"%>
<%@page import="Controlador.ControladorUsuario"%>
<!DOCTYPE html>
<%
    ControladorUsuario cu = new ControladorUsuario();
%>
<% Controlador.ControladorTrabajador ct = new ControladorTrabajador();%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='stylesheet' href='assets/estilos.css'>
    <link href='http://fonts.googleapis.com/css?family=Oswald:300,400,700|Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/favicon.ico" rel="shortcut icon">
    <link href="assets/apple-touch-icon.png" rel="apple-touch-icon">
    <link href="assets/css/form.css" rel="stylesheet" type="text/css"/>
    <title>Tabla de Usuarios</title>
</head>
<body class="body-dark-linen">
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
                                <h1><i class="icon-bar-chart"></i>Registro de Usuarios</h1>
                            </div>
                                <div class="main-content">
                                    <div class="widget">
                                        <h3 class="section-title first-title"><i class="icon-table"></i>Tabla Usuarios</h3>
                                        <div class="text-right row">
                                            <div class="col-md-1">
                                                <button type="button" class="btn btn-primary btn-round" data-toggle="modal" data-target="#myModalRegistro" data-backdrop="static" data-keyboard="false">Nuevo Usuario</button>
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
                                                            <th>NOMBRE</th>
                                                            <th>USUARIO</th>
                                                            <th>ULTIMA SESSION</th>
                                                            <th>ESTADO</th>
                                                            <!--<th>Status</th>-->
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <!-- DATOS DE LA BD EN LA TABLA-->
                                                        <%=cu.consultaUSUARIO()%>
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

<div class="modal fade" id="myModalRegistro" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form action="addUsuario" class="form-horizontal" id="frmregistrousuario" name="frmregistrousuario" method="POST">
        <div class="modal-content ">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Registro de Usuarios</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <label class="control-label">PERSONA</label>
                        <div class="controls">
                            <div class="input-append bootstrap-timepicker-component">
                                <select name="per_id" id="per_id" class="form-control">
                                  <option value="" selected="selected">--SELECCIONAR--</option>
                                  <%= ct.consultaTrabajadorCBX()%>
                                </select>
                            </div>
                        </div>
                </div>
                <div class="row">
                    <div class="controls">
                        <label>USUARIO</label>
                        <input type="text"  class="form-control" name="usu_usuario" id="usu_usuario" placeholder="USUARI">
                        <span class="help-block"></span>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>CONTRASEÑA</label>
                            <input type="password" class="form-control" name="usu_password" id="usu_password" placeholder="NOMBRE">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>VERIFICAR CONTRASEÑA</label>
                            <input type="password" class="form-control" name="usu_pass2" id="usu_pass2" placeholder="NOMBRE">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                        <label class="control-label">Estado</label><br>
                        <div class="controls">
                            <div class="radio input-append bootstrap-timepicker-component">
                              <label>
                                <input type="radio" name="usu_estado" id="per_estado"  value="A" checked>
                                Activo
                              </label>
                            </div>
                            <div class="radio input-append bootstrap-timepicker-component">
                              <label>
                                <input type="radio" name="usu_estado" id="per_estado" value="D">
                                No Activo
                              </label>
                            </div>
                        </div>
                </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <button type="button submit" class="btn btn-primary" id="btnregistro" name="btnregistro">Guardar</button>
                            </div>
        </div>
    </form>
    </div>
</div>                                             
</body>
<script src="assets/ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="assets/ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="assets/js/main.js" type="text/javascript"></script>
<script src="assets/js/admUsuario.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<script src='assets/estilos4.js'></script>
<script src='assets/estilos3.js'></script>
</html>
