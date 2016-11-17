<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="${contextPath}/INC/cabecera.jsp" />
<c:set var="nucleo" value="nucleo.jsp"/>
<c:set var="funciones" value="funciones.jsp"/>
<c:set var="inter" value="${contextPath}/internacionalizacion"/>
<c:set var="xml" value="xml.jsp"/>
<c:set var="sql" value="sql.jsp"/>

<ol>
    <li><a href="<c:out value="${nucleo}" />">Nucleo</a></li>
    <li><a href="<c:out value="${funciones}" />">Funciones</a></li>
    <li><a href="<c:out value="${inter}" />">Internacionalización</a></li>
    <li><a href="">XML</a></li>
    <li><a href="">SQL</a></li>
</ol>

    
    <p class="enlace"><a href="../index.jsp">--> Volver al index <--</a></p>
<c:import url="${contextPath}/INC/pie.jsp" />

