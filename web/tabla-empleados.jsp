<%-- 
    Document   : tabla-empleados
    Created on : 12/05/2016, 08:25:35 PM
    Author     : FAST
--%>
<%@page import="Modelo.ModeloTrabajador"%>
<%@page import="Controlador.ControladorTrabajador"%>
<%
    ControladorTrabajador ct = new ControladorTrabajador();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='stylesheet' href='assets/estilos.css'>
    <link href='http://fonts.googleapis.com/css?family=Oswald:300,400,700|Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/favicon.ico" rel="shortcut icon">
    <link href="assets/apple-touch-icon.png" rel="apple-touch-icon">
    <title>Tabla de Trabajadores</title>
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
                                <h1><i class="icon-bar-chart"></i>Registro de Trabajadores</h1>
                            </div>
                                <div class="main-content">
                                    <div class="widget">
                                        <h3 class="section-title first-title"><i class="icon-table"></i>Tabla Trabajadores</h3>
                                        <div class="text-right row">
                                            <div class="col-md-10">
                                                <form action="crearempleado.jsp">
                                                    <button type="submit" class="btn btn-primary btn-round right">Registrar</button>
                                                </form>
                                            </div>
                                            <div class="col-md-1">
                                                <button type="button" class="btn btn-success btn-round" data-toggle="modal" data-target="#myModalRegistro" data-backdrop="static" data-keyboard="false">Nuevo Usuario</button>
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
                                                            <th>Nombre</th>
                                                            <th>Puesto</th>
                                                            <th>Sucursal</th>
                                                            <th>Fecha de Inicio</th>
                                                            <!--<th>Status</th>-->
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%=ct.consultaTRABAJADOR()%>
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
    <div class="modal-content ">
        <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">Registro de Usuario</h4>
        </div>
        <%
            //int docu=12345678;
            //int docu=71484498;
           // Datos t = new ModeloTrabajador().consultaDocumentoTrabajador(docu);
        //for (Datos t : motra.consultaDocumentoTrabajador(71484498)) {
            //System.out.println(t.getValor6());
        %>  
        
        <div class="modal-body">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Documento</label>
                        <input type="text"  class="form-control" name="per_numerodocumento" id="per_numerodocumento"  onkeydown="search(this)" placeholder="Documento">
                        <span class="help-block"></span>
                        
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" class="form-control" value="<%//t.getValor1()%>" name="per_nombre" id="per_nombre" disabled="true">
                        <span class="help-block"></span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>ROL</label>
                        <input type="text" class="form-control" value="<%//t.getValor2()%>" name="tra_rol" id="tra_rol" disabled="true">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>SUCURSAL</label>
                        <input type="text" class="form-control" value="<%//t.getValor3()%>" name="tra_sucu" id="tra_sucu" disabled="true">
                        <span class="help-block"></span>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label>Usuario</label>
                <input type="text" class="form-control" name="user_usuario" id="user_usuario" placeholder="Usuario" disabled="true">
                <span class="help-block"></span>
            </div>
            <div class="form-group">
                <label>Contraseña</label>
                <input type="password" class="form-control" name="user_password" id="user_password" placeholder="Password" disabled="true">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary" disabled="true">Guardar</button>
        </div>
    </div>
  </div>
</div>                                             
</body>
<script src="assets/ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="assets/ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<script src="assets/js/modalUsuario.js" type="text/javascript"></script>
<script src="assets/js/admTrabajador.js" type="text/javascript"></script>
<script src='assets/estilos4.js'></script>
<script src='assets/estilos3.js'></script>
</html>