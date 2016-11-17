<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:import url="${contextPath}/INC/cabecera.jsp"/>

<h2>Menú CRUD JSTL</h2>
<ul>
    <li><a href="crud.jsp?opt=1">Consultar</a></li>
    <li><a href="crud.jsp?opt=2">Insertar</a></li>
    <li><a href="crud.jsp?opt=3">Actualizar</a></li>
    <li><a href="crud.jsp?opt=4">Eliminar</a></li>
</ul>

<p class="enlace"><a href="${contextPath}/index.jsp" >---> Volver al index <---</a></p>

<c:import url="${contextPath}/INC/pie.jsp"/>