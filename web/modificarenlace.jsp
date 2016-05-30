<%-- 
    Document   : modificarenlace
    Created on : 30/05/2016, 12:13:24 AM
    Author     : FAST
--%>

<%@page import="Controlador.ControladorEnlace"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Controlador.ControladorEnlace ce = new ControladorEnlace();
    int idEnlace = Integer.parseInt(request.getParameter("id"));
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
        <h1>Modificar Enlace</h1>
        <%=ce.getEditViewEnlace(idEnlace)%>
    </body>
<script src="assets/js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="assets/js/admUsuario.js" type="text/javascript"></script>
</html>
