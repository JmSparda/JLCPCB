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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel='stylesheet' href='assets/estilos.css'>
  <link href='http://fonts.googleapis.com/css?family=Oswald:300,400,700|Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
  <link href="assets/favicon.ico" rel="shortcut icon">
  <script src="assets/ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src='assets/estilos2.js'></script>
  <script src="js/jquery.min.js" type="text/javascript"></script>
  <script src="js/main.js" type="text/javascript"></script>
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
          <div class="page-header">
<!--BOTONES PARA BARRA SUPERIOR DERECHA-->
<jsp:include page="assets/estructura/BSD.jsp" flush="true" />
<!--FIN DEBOTONES PARA BARRA SUPERIOR DERECHA-->
            <h1><i class="icon-bar-chart"></i>Registro Empleados</h1>
          </div>
          <div class="main-content">
           <form action="creartrabajador" name="frmnuevo" id="frm_nuevo" method="POST" enctype="multipart/form-data" class="form-horizontal">
            <div class="row">
              <div class="col-md-6">
                <div class="widget">
                  <div class="widget-content-white glossed">
                    <div class="padded">
                        <h3 class="form-title form-title-first"><i class="icon-th-list"></i> DATOS PERSONALES</h3>
                        <div class="row">
                          <div class="col-md-6">
                            <!--<input type="text" name="per_id" id="per_id">-->
                            <%//=ct.consultaIDTRABAJDOR()%>
                            <div class="form-group">
                              <label>Apellido Paterno</label>
                              <input type="text" class="form-control" name="per_apellidop" id="per_apellidop" placeholder="Apellido Paterno">
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <label>Apellido Materno</label>
                              <input type="text" class="form-control" name="per_apellidom" id="per_apellidom" placeholder="Apellido Materno">
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label>Nombre</label>
                          <input type="text" class="form-control" name="per_nombre" id="per_nombre" placeholder="Nombre">
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
                            <label>Fecha de Nacimiento</label>
                            <input type="date" class="form-control" name="per_fechanacimiento" id="per_fechanacimiento" placeholder="Password">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-6">
                            <label>Tipo Documento</label>
                            <select name="per_documentoID" id="per_documentoID" class="form-control">
                              <option value="">--SELECCIONAR--</option>
                              <%//= cc.consultaDocumento()%>
                            </select>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <label>Nro Documento</label>
                              <input type="text" class="form-control" name="per_numerodocumento" id="per_numerodocumento" placeholder="Numero Documento">
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                              <label>Direccion</label>
                              <input type="text" class="form-control" name="per_direccion" id="per_direccion"  placeholder="Direccion">
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <label>Telefono</label>
                              <input type="text" class="form-control" name="per_telefono" id="per_telefono"  placeholder="Telefono">
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label>Email</label>
                          <input type="email" class="form-control" name="per_email" id="per_email" placeholder="Email">
                        </div>
                        <div class="form-group">
                          <label>Foto</label>
                          <input type="file" class="form-control" name="per_foto[]" id="archivos" placeholder="Email">
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
                        <div class="row">
                           <div class="col-md-6">
                               <label>SUCURSAL</label>
                           </div>
                           <div class="col-md-6">
                                <select name="suc_id" id="suc_id" class="form-control">
                                    <option value="">--SELECCIONAR--</option>
                                    <//%= cc.consultaSucursal()%>
                                </select>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-md-6">
                               <label>ROL</label>
                           </div>
                           <div class="col-md-6">
                                <select name="rol_id" id="rol_id" class="form-control">
                                    <option value="">--SELECCIONAR--</option>
                                    <//%= cc.consultaRol()%>
                                </select>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-md-6">
                               <label>Inicio de Contrato</label>
                           </div>
                           <div class="col-md-6">
                               <input type="date" class="form-control" name="tra_iniciocontrato" id="tra_iniciocontrato">
                           </div>
                        </div>
                        <button class="btn btn-primary" id="btnregistro">Registrar</button>
                        <button class="btn btn-default" id="btncancelar">Cancelar</button>
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
</html>