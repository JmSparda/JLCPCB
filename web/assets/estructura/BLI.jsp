<%-- 
    Document   : BLI
    Created on : 08/05/2016, 08:54:05 PM
    Author     : JMLOPEZ
--%>
<%@page import="Controlador.ControladorPerfil"%>
<%
    Controlador.ControladorPerfil cp = new ControladorPerfil();
%>
<div class="side-bar-wrapper collapse navbar-collapse navbar-ex1-collapse">
    <a href="#" class="logo hidden-sm hidden-xs">
        <i class="icon-cloud-download"></i>
        <span>USUARIO</span>
    </a>
    <div class="relative-w">
        <ul class="side-menu side-menu-blue">
            <%=cp.consultaPerfilMenu()%>
        </ul>
    </div>
</div>
