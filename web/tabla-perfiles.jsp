<%-- 
    Document   : perfiles
    Created on : 21/05/2016, 12:11:49 PM
    Author     : FAST
--%>
<%@page import="Controlador.ControladorPerfil"%>
<!DOCTYPE html>
<%Controlador.ControladorPerfil cp = new ControladorPerfil();%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='stylesheet' href='assets/estilos.css'>
    <link href='http://fonts.googleapis.com/css?family=Oswald:300,400,700|Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/favicon.ico" rel="shortcut icon">
    <link href="assets/apple-touch-icon.png" rel="apple-touch-icon">
    <link href="assets/css/form.css" rel="stylesheet" type="text/css"/>
    
    <title>Tabla de Perfiles</title>
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
                                <h1><i class="icon-bar-chart"></i>Registro de Perfiles</h1>
                            </div>
                                <div class="main-content">
                                    <div class="widget">
                                        <h3 class="section-title first-title"><i class="icon-table"></i>Tabla Perfiles</h3>
                                        <div class="text-right row">
                                            <div class="col-md-1">
                                                <button type="button" class="btn btn-primary btn-round" data-toggle="modal" data-target="#myModalRegistro" data-backdrop="static" data-keyboard="false">Nuevo Perfil</button>
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
                                                            <th>CODIGO</th>
                                                            <th>NOMBRE</th>
                                                            <th>DESCRIPCION</th>
                                                            <th>Estado</th>
                                                            <!--<th>Status</th>-->
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <!-- DATOS DE LA BD EN LA TABLA-->
                                                        <%=cp.consultaPERFIL()%>
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
        <form action="addPerfil" class="form-horizontal" id="frmregistroperfil" name="frmregistroperfil" method="POST">
        <div class="modal-content ">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Registro de Perfiles</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>CODIGO</label>
                            <input type="text"  class="form-control" name="prof_codigo" id="prof_codigo" placeholder="CODIGO">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="form-group">
                            <label>NOMBRE</label>
                            <input type="text" class="form-control" name="prof_nombre" id="prof_nombre" placeholder="NOMBRE">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </div>
                            <label class="control-label" >DESCRIPCION</label>
                            <div class="form-group">
                                <textarea class="form-control" rows="5" name="prof_descripcion" id="prof_descripcion" placeholder="DESCRIPCION"></textarea>
                                <span class="help-block"></span>
                            </div>
                            <div class="control-group">
                                <label class="control-label">ESTADO</label><br>
                                <div class="controls">
                                    <div class="radio input-append bootstrap-timepicker-component">
                                        <label>
                                            <input type="radio" name="prof_estado" id="prof_estado"  value="A" checked>
                                            Activo
                                        </label>
                                    </div>
                                    <div class="radio input-append bootstrap-timepicker-component">
                                        <label>
                                            <input type="radio" name="prof_estado" id="prof_estado" value="D">
                                            No Activo
                                        </label>
                                    </div>
                                </div>
                            </div>
            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <button type="button submit" class="btn btn-primary" >Guardar</button>
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
<script src="assets/js/admPerfil.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<script src='assets/estilos4.js'></script>
<script src='assets/estilos3.js'></script>
</html>