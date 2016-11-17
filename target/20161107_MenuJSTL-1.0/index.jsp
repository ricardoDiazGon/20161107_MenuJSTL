<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="INC/cabecera.jsp" />

<c:set var="librerias" value="JSP/menuLibreriasJSTL.jsp"/>
<c:set var="paises" value="cargarPaises"/>
<c:set var="universidad" value="JSP/universidad.jsp"/>
<c:set var="menuCrud" value="JSP/menuCrud.jsp"/>

<ol>
    <li><a href="${librerias}">Librerías JSTL</a></li>
    <li><a href="${paises}" >Menú de paises</a></li>
    <li><a href="${universidad}">Universidad XML</a></li>
    <li><a href="${menuCrud}">CRUD JSTL</a></li>
</ol>


<c:import url="INC/pie.jsp" />