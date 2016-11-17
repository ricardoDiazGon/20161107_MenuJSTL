<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="${contextPath}/INC/cabecera.jsp"/>

<fmt:setLocale value="${requestScope.locale}"/>

<c:set var="pais" value="${requestScope.pais}" />

<!-- Declaramos los bundle con setBundle para tenerlos disponible durante todo el programa -->
<fmt:setBundle basename="gmt_paises" var="gmts" scope="session" />
<fmt:setBundle basename="${locale}" var="idioma" scope="session" />

<fmt:message bundle="${gmts}" key="${requestScope.pais}"  var="gmt"/>

<fmt:setTimeZone value="${gmt}" />

    <c:choose>
        <c:when test="${requestScope.existe}">
            <h2><c:out value="${pais}" />, y allí son las <fmt:formatDate type="time" dateStyle="medium" timeZone="${gmt}"  value="${requestScope.fecha}" /></h2>      
            <ul>   
                <li>Palabra "hola", su traducción "<fmt:message bundle="${idioma}" key="hola"/>"</li>
                <li>Palabra "adios", su traducción "<fmt:message bundle="${idioma}" key="adios" />"</li>    
            </ul>
            <br/>
        </c:when>
        <c:otherwise>
            <h2>El país elegido no está soportado</h2>
        </c:otherwise>
    </c:choose>    

    <h2>Formulario</h2>
    <form name="form-lang" action="" method="post">
        <ul>
            <li><label><fmt:message  bundle="${idioma}" key="nombre" /></label><input type="text" name="nombre"/></li>
            <li><label><fmt:message bundle="${idioma}" key="direccion" /></label><input type="text" name="direccion"/></li>
            <li><label><fmt:message bundle="${idioma}" key="sueldo" /></label><input type="text" name="sueldo" /></li>
        </ul>
        <p><input type="submit" name="enviar" value="<fmt:message  bundle="${idioma}" key='enviar'/>" /><input type="submit" name="limpiar" value="<fmt:message  bundle="${idioma}" key='limpiar'/>" /></p>
    </form>

<h2>Fecha</h2>
<ul>   
    <li>Fecha formato corto: <fmt:formatDate type="date" dateStyle="short" timeZone="${gmt}"  value="${requestScope.fecha}" /></li>
    <li>Fecha formato medio: <fmt:formatDate type="date" dateStyle="medium" timeZone="${gmt}"  value="${requestScope.fecha}" /></li>
    <li>Fecha formato largo: <fmt:formatDate type="date" dateStyle="long" timeZone="${gmt}"  value="${requestScope.fecha}" /></li>
    <li>Hora formato corto: <fmt:formatDate type="time" timeStyle="short" timeZone="${gmt}"  value="${requestScope.fecha}" /></li>
    <li>Hora formato medio: <fmt:formatDate type="time" timeStyle="medium" timeZone="${gmt}"  value="${requestScope.fecha}" /></li>
    <li>Hora formato largo: <fmt:formatDate type="time" timeStyle="long" timeZone="${gmt}"  value="${requestScope.fecha}" /></li>
</ul>
<br/>
<h2>Números</h2>
<ul>   
    <li><fmt:formatNumber type="currency" value="${numero}" /></li>
    <li><fmt:formatNumber type="number" groupingUsed="true" value="${requestScope.numero}" /></li>
    <li><fmt:formatNumber type="number" maxIntegerDigits="3" value="${requestScope.numero}" /></li>
    <li><fmt:formatNumber type="number" maxFractionDigits="6" value="${requestScope.numero}" /></li>
    <li><fmt:formatNumber type="percent" maxIntegerDigits="4" value="${requestScope.numero}" /></li>
    <li><fmt:formatNumber type="number" pattern="####.###" value="${requestScope.numero}" /></li>
</ul>

<p class="enlace"><a href="${contextPath}/cargarPaises">---> Volver al menú de paises <---</a></p>


<c:import url="${contextPath}/INC/pie.jsp"/>