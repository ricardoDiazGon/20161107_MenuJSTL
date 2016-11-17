<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:import url="../INC/cabecera.jsp"/>

<form action="${contextPath}/elegirPais" method="post">
    <ul>
        <li>
            <label>Paises: </label>
            <select name="pais" size="1">
                <c:forEach var="pais" items="${sessionScope.paises}">
                    <option value="${pais.value}-${pais.key}">${pais.key}</option>
                </c:forEach>             
            </select>
        </li>
    </ul>

    <p><input type="submit" name="enviar" value="Enviar" /></p>
</form>

<p class="enlace"><a href="${contextPath}/index.jsp" >---> Volver al index <---</a></p>

<c:import url="../INC/pie.jsp"/>