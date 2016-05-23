<%-- 
    Document   : registro
    Created on : 02/05/2016, 08:19:10 PM
    Author     : FAST
--%>

<%@page import="Controlador.ControladorTrabajador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% Controlador.ControladorTrabajador ct = new ControladorTrabajador();%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Registro</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="assets/ico/favicon.html">
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="assets/css/theme.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/alertify.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link href="assets/css/form.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="row-fluid">
    <div class="widget widget-padding span12">
        <div class="widget-header"><h5><span class="glyphicon glyphicon-th-list"></span> Registro</h5></div>
        <form action="registrar" class="form-horizontal" id="frmregistrousuario" name="frmregistrousuario" method="POST">
            <div class="widget-body">
                <div class="widget-forms clearfix">
                    <div class="control-group">
                        <label class="control-label">Trabajador</label>
                        <div class="controls">
                            <div class="input-append bootstrap-timepicker-component">
                                <select name="tra_id" id="tra_id" class="form-control">
                                  <option value="" selected="selected">--SELECCIONAR--</option>
                                  <%= ct.consultaTrabajadorCBX()%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Usuario</label>
                        <div class="controls">
                            <div class="input-append bootstrap-timepicker-component">
                                <input type="text" id="usu_usuario" name ="usu_usuario" class="input-xxlarge" >
                            </div>
                            <span class="help-inline"></span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Contraseña</label>
                        <div class="controls">
                            <div class="input-append bootstrap-timepicker-component">
                                <input type="password" name ="usu_password" id="usu_password" class="input-xxlarge" >
                            </div>
                            <span class="help-inline"></span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Verificar Contraseña</label>
                        <div class="controls">
                            <div class="input-append bootstrap-timepicker-component">
                                <input type="password" name ="usu_pass2" id="usu_pass2" class="input-xxlarge" >
                            </div>
                            <span class="help-inline"></span>
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
                </div>
            </div>
            <div class="widget-footer">
               <button type="button submit" class="btn btn-primary" id="btnregistro" name="btnregistro">Registrar</button>
            </div>
            <div class="control-group">
                <a href="index.jsp">Iniciar Sesión</a>
            </div>
        </form>
    </div>
</div>
</body>

<script src="assets/js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="assets/js/main.js" type="text/javascript"></script>
</html>