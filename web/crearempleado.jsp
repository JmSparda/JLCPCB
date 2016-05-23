<%-- 
    Document   : crearempleado
    Created on : 07/05/2016, 08:29:33 AM
    Author     : JMLOPEZ
--%>

<%@page import="Controlador.ControladorTrabajador"%>
<%@page import="Controlador.ControladorConsultas"%>
<%
    ControladorConsultas cc = new ControladorConsultas();
    ControladorTrabajador ct = new ControladorTrabajador();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=0">
  <link rel='stylesheet' href='assets/estilos.css'>
  <link href='http://fonts.googleapis.com/css?family=Oswald:300,400,700|Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
  <link href="assets/favicon.ico" rel="shortcut icon">
  <!--<script src="js/main.js" type="text/javascript"></script>-->
  <title>REGISTRO EMPLEADOS</title>
</head>
<body>
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
        <div class="content-inner">
          <div class="page-header page-header-dark-blue">
<!--BOTONES PARA BARRA SUPERIOR DERECHA-->
<jsp:include page="assets/estructura/BSD.jsp" flush="true" />
<!--FIN DEBOTONES PARA BARRA SUPERIOR DERECHA-->
            <h1><i class="icon-bar-chart"></i>Registro Empleados</h1>
          </div>
          <div class="main-content">
            <!--action="creartrabajador" method="POST" name="frmnuevo" id="frm_nuevo"  enctype="multipart/form-data" class="form-horizontal"--> 
            <form action="creartrabajador" method="POST" name="frm_nuevo" id="frm_nuevo"  enctype="multipart/form-data"  class="form-horizontal">
                <div class="alert alert-danger text-center" style="display:none;" id="error">
                     <strong>Adventencia: </strong>Debe completar todos los campos
                </div>
                <div class="alert alert-success text-center" style="display:none;" id="exito">
                     <strong>Felicidades: </strong>Su registro ha sido guardado
                </div>
            <div class="row">
              <div class="col-md-6">
                <div class="widget">                    
                  <div class="widget-content-white glossed">
                    <div class="padded">
                        <h3 class="form-title form-title-first"><i class="icon-th-list"></i> DATOS PERSONALES</h3>
                        <div class="row">
                          <div class="col-md-6">
                            <%=ct.consultaIDPERSONA()%>
                            <div class="form-group">
                              <label>Apellido Paterno</label>
                              <input type="text" class="form-control" name="per_apellidop" id="per_apellidop" onkeyup="validar('per_apellidop');"  aria-describedby="inputSuccess2Status" placeholder="Apellido Paterno">
                              <span class="help-block"></span>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <label>Apellido Materno</label>
                              <input type="text" class="form-control" name="per_apellidom" id="per_apellidom" onkeyup="validar('per_apellidom');" placeholder="Apellido Materno">
                              <span class="help-block"></span>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label>Nombre</label>
                          <input type="text" class="form-control" name="per_nombre" id="per_nombre"  onkeyup="validar('per_nombre');" placeholder="Nombre">
                          <span class="help-block"></span>
                        </div>
                        <div class="row">
                          <div class="col-md-6">
                            <label>Sexo</label><br>
                            <div class="radio">
                              <label>
                                <input type="radio" name="per_sexo" id="per_sexo"  value="Masculino" checked>
                                Masculino
                              </label>
                            </div>
                            <div class="radio">
                              <label>
                                <input type="radio" name="per_sexo" id="per_sexo" value="Femenino">
                                Femenino
                              </label>
                            </div>
                          </div>
                          <div class="col-md-6">  
                            <div class="form-group">
                              <label>Fecha de Nacimiento</label>
                              <input type="date" class="form-control" name="per_fechanacimiento" id="per_fechanacimiento" onkeyup="validar('per_fechanacimiento');" onchange="validar('per_fechanacimiento');" placeholder="Password">
                              <span class="help-block"></span>
                            </div>
                          </div>  
                        </div>
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                                <label>Tipo Documento</label>
                                <select name="per_documentoID" id="per_documentoID" class="form-control" onchange="validar('per_documentoID');">
                                  <option value="">--SELECCIONAR--</option>
                                  <%= cc.consultaDocumento()%>
                                </select>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <label>Nro Documento</label>
                              <input type="text" class="form-control" name="per_numerodocumento" id="per_numerodocumento" onkeyup="validar('per_numerodocumento');" placeholder="Numero Documento">
                              <span class="help-block"></span>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                              <label>Direccion</label>
                              <input type="text" class="form-control" name="per_direccion" id="per_direccion" onkeyup="validar('per_direccion');" placeholder="Direccion">
                              <span class="help-block"></span>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <label>Telefono</label>
                              <input type="text" class="form-control" name="per_telefono" id="per_telefono" onkeyup="validar('per_telefono');" placeholder="Telefono">
                              <span class="help-block"></span>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label>Email</label>
                          <input type="email" class="form-control" name="per_email" id="per_email" onkeyup="validar('per_email');" placeholder="Email">
                          <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                          <label>Foto</label>
                          <input type="file" class="form-control" name="per_foto[]" id="archivos" onchange="validar('archivos');"  placeholder="Email">
                          <span class="help-block"></span>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="widget">
                  <div class="widget-content-white glossed">
                    <div class="padded">
                       <h3 class="form-title form-title-first"><i class="icon-th-list"></i> DATOS LABORALES</h3>
                       
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>SUCURSAL</label>
                                <select name="suc_id" id="suc_id" class="form-control" onchange="validar('suc_id');">
                                    <option value="">--SELECCIONAR--</option>
                                    <%= cc.consultaSucursal()%>
                                </select>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Puesto</label>
                                <input type="text" class="form-control" name="tra_puesto" id="tra_puesto" onkeyup="validar('tra_puesto');" placeholder="Puesto">
                                <span class="help-block"></span>
                                
                            </div>
                        </div>
                                
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                  <label>Inicio de Contrato</label>
                                  <input type="date" class="form-control" name="tra_iniciocontrato" id="tra_iniciocontrato"  onchange="validar('tra_iniciocontrato');" onkeyup="validar('tra_iniciocontrato');">
                                  <span class="help-block"></span>
                                </div>
                            </div>
                        </div>
                       <button type="button" class="btn btn-primary" id="btnregistro" name="btnregistro" onclick="verificar();return false;">Registrar</button>
                       <button type="button" class="btn btn-success" id="btnnuevo" name="btnnuevo" onclick="nuevo();" >Nuevo</button>
                    </div>
                  </div>
                </div>
              </div>                             
            </div>
           </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
<script src="assets/ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src='assets/estilos2.js'></script>
<script src="assets/js/validacion.js" type="text/javascript"></script>
</html>