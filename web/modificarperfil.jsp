<%-- 
    Document   : modificarperfil
    Created on : 22/05/2016, 12:46:10 PM
    Author     : FAST
--%>

<%@page import="Controlador.ControladorPerfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Controlador.ControladorPerfil cp = new ControladorPerfil(); 
    int idPerfil = Integer.parseInt(request.getParameter("id"));
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
    </head>
    <body>
        <h1>Modificar Perfil</h1>
        <%=cp.getEditViewPerfil(idPerfil)%>
    </body>
    <script src="assets/ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="assets/ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    <script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="assets/js/admPerfil.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script src='assets/estilos4.js'></script>pt src='assets/estilos3.js'></script>
</html>
