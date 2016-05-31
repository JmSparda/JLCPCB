<%@page import="Controlador.ControladorUsuario"%>
<%@page import="include.Usuario"%>
<!DOCTYPE html>
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
  <title>Dashboard</title>
</head>
<body>
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
                    <h1><i class="icon-bar-chart"></i>Dashboard</h1>
                </div>
                <div class="main-content">
                    <div class="widget">
                        <div class="widget-controls pull-right">
                            <a href="#" class="widget-link-remove"><i class="icon-minus-sign"></i></a>
                            <a href="#" class="widget-link-remove"><i class="icon-remove-sign"></i></a>
                        </div>
                        <h3 class="section-title first-title"><i class="icon-tasks"></i> Estadisticas</h3>
                        <div class="row">
                          <div class="col-lg-3 col-md-4 col-sm-6 text-center">
                            <div class="widget-content-blue-wrapper changed-up">
                              <div class="widget-content-blue-inner padded">
                                <div class="pre-value-block"><i class="icon-dashboard"></i> Total Visits</div>
                                <div class="value-block">
                                  <div class="value-self">10,520</div>
                                  <div class="value-sub">This Week</div>
                                </div>
                                <span class="dynamicsparkline">Loading..</span>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <ul class="nav nav-tabs">
                              <li class="active"><a href="#tab_pie_chart" data-toggle="tab"><i class="icon-bullseye"></i> Pie Chart</a></li>
                              <li><a href="#tab_bar_chart" data-toggle="tab"><i class="icon-bar-chart"></i> Bar Alert</a></li>
                              <li class="hidden-md hidden-xs"><a href="#tab_table" data-toggle="tab"><i class="icon-table"></i> Table</a></li>
                            </ul>
                            <div class="tab-content bottom-margin">
                              <div class="tab-pane active" id="tab_pie_chart">
                                <div class="shadowed-bottom">
                                  <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-3 bordered">
                                      <div class="value-block padded-left text-center">
                                        <div class="value-self">520</div>
                                        <div class="value-sub">Total Sales</div>
                                      </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-3 bordered hidden-md">
                                      <div class="value-block text-center">
                                        <div class="value-self">1,120</div>
                                        <div class="value-sub">Total Visitors</div>
                                      </div>
                                    </div>
                                    <div class="col-lg-6 col-md-8 col-sm-6">
                                      <form class="form-inline form-period-selector">
                                        <label class="control-label">Time Period:</label><br>
                                        <input type="text" placeholder="01/12/2011" class="form-control input-sm">
                                        <input type="text" placeholder="01/12/2011" class="form-control input-sm">
                                      </form>
                                    </div>
                                  </div>
                                </div>
                                <div class="padded">
                                  <div id="piechart" style=""></div>
                                </div>
                              </div>
                              <div class="tab-pane" id="tab_bar_chart">
                                <div class="shadowed-bottom">
                                  <div class="row">
                                    <div class="col-md-3 bordered">
                                      <div class="value-block padded-left text-center">
                                        <div class="value-self">256</div>
                                        <div class="value-sub">Total Sales</div>
                                      </div>
                                    </div>
                                    <div class="col-lg-3 bordered hidden-md">
                                      <div class="value-block text-center">
                                        <div class="value-self">3,420</div>
                                        <div class="value-sub">Total Visitors</div>
                                      </div>
                                    </div>
                                    <div class="col-lg-6 col-md-9">
                                      <form class="form-inline form-period-selector">
                                        <label class="control-label">Time Period:</label><br>
                                        <input type="text" placeholder="01/12/2011" class="form-control input-sm">
                                        <input type="text" placeholder="01/12/2011" class="form-control input-sm">
                                      </form>
                                    </div>
                                  </div>
                                </div>
                                <div class="padded">
                                  <div class="alert alert-warning">
                                    <i class="icon-exclamation-sign"></i> <strong>Message example!</strong> This is an example of how to handle a case when there is no data to load for a chart.</div>
                                </div>
                              </div>
                              <div class="tab-pane" id="tab_table">
                                <div class="shadowed-bottom">
                                  <div class="row">
                                    <div class="col-md-3 bordered">
                                      <div class="value-block padded-left text-center">
                                        <div class="value-self">112</div>
                                        <div class="value-sub">Total Sales</div>
                                      </div>
                                    </div>
                                    <div class="col-lg-3 bordered hidden-md">
                                      <div class="value-block text-center">
                                        <div class="value-self">2,340</div>
                                        <div class="value-sub">Total Visitors</div>
                                      </div>
                                    </div>
                                    <div class="col-lg-6 col-md-9">
                                      <form class="form-inline form-period-selector">
                                        <label class="control-label">Time Period:</label><br>
                                        <input type="text" placeholder="01/12/2011" class="form-control input-sm">
                                        <input type="text" placeholder="01/12/2011" class="form-control input-sm">
                                      </form>
                                    </div>
                                  </div>
                                </div>
                                <div class="padded">
                                <table class="table">
                                  <thead>
                                    <tr>
                                      <th>Product</th>
                                      <th>Qty</th>
                                      <th>Price</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>Floor Lamp</td>
                                      <td>2</td>
                                      <td>3</td>
                                    </tr>
                                    <tr>
                                      <td>Coffee Mug</td>
                                      <td>4</td>
                                      <td>7</td>
                                    </tr>
                                    <tr>
                                      <td>Television</td>
                                      <td>1</td>
                                      <td>3</td>
                                    </tr>
                                    <tr>
                                      <td>Red Carpet</td>
                                      <td>6</td>
                                      <td>5</td>
                                    </tr>
                                    <tr>
                                      <td>Laptop</td>
                                      <td>3</td>
                                      <td>6</td>
                                    </tr>
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
    </div>
</div>
<script src="assets/ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="assets/ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src='assets/estilos5.js'></script>
<script src='assets/estilos2.js'></script>
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
<!-- Mirrored from mars.pinsupreme.com/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 07 May 2016 11:04:52 GMT -->
</html>