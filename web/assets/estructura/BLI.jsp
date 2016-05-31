<%-- 
    Document   : BLI
    Created on : 08/05/2016, 08:54:05 PM
    Author     : JMLOPEZ
--%>
<%@page import="Controlador.ControladorPerfil"%>
<%
    Controlador.ControladorPerfil cp = new ControladorPerfil();
%>

    <div class="relative-w">
        <ul class="side-menu side-menu-blue">
            <%=cp.consultaPerfilMenu()%>
        </ul>
    </div>
</div>
