<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../INC/cabecera.jsp"/>
<!-- LOS FICHEROS DE PROPIEDADES VAN EN OTRAS FUENTES, PORQUE SINO HAY QUE INDICARLO -->
<table>
    <tr><th>Librería</th><th>Prefijo</th><th>URI</th></tr>
    <tr><td>Internacionalización</td><td>fmt</td><td>http://java.sun.com/jsp/jstl/fmt</td></tr>
</table>


<c:set var="fecha" value="${requestScope.fecha}" />

<table>
    <tr>
        <th>Significado</th><th>Etiqueta</th><th>Atributos</th><th>requerido</th><th>Ejemplo</th><th>Salida</th>
    </tr>

    <!-- setLocale -->
    <tr>
        <td>Elegir idioma</td><td>setLocale</td>
        <td>
            <ul>
                <li>value></li>
                <li>scope</li>
            </ul>
        </td>
        <td>
            <ul>
                <li>Si</li>
                <li>No</li>
            </ul>
        </td>
        <td>
            <pre>
 &lt;fmt:setLocale value="es_ES" scope="session" />
            </pre>
        </td>
        <td>
            <fmt:setLocale value="es_ES" scope="session" />
        </td>
    </tr>

    <!-- setTimeZone -->
    <tr>
        <td>Almacena la configuración</td><td>setTimeZone</td>
        <td>
            <ul>
                <li>value</li>
                <li>var</li>
                <li>scope</li>
            </ul>
        </td>
        <td>
            <ul>
                <li>Si</li>
                <li>No</li>
                <li>No</li>
            </ul>
        </td>
        <td>
            <pre>
&lt;fmt:setTimeZone value="UTF-8" />
            </pre>
        </td>
        <td>
            <fmt:setTimeZone value="${pais}" />
        </td>
    </tr>

    <!-- formatDate -->
    <tr>
        <td>Formatea fechas</td><td>formatNumber</td>
        <td>
            <ul>
                <li>value</li>
                <li>type</li>
                <li>dateStyle</li>
                <li>timeStyle</li>
                <li>pattern</li>
                <li>timeZone</li>
                <li>var</li>
                <li>scope</li>
            </ul>
        </td>
        <td>
            <ul>
                <li>Si</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>                
            </ul>
        </td>
        <td>
            <pre>

            </pre>
        </td>
        <td>
            <ul>
                <li>Hora, formato corto: <fmt:formatDate type="time" timeStyle="short" value="${fecha}" /></li>
                <li>Hora, formato normal: <fmt:formatDate type="time" timeStyle="medium" value="${fecha}" /></li>
                <li>Hora, formato largo: <fmt:formatDate type="time" timeStyle="long" value="${fecha}" /></li>
                <li>Fecha, formato corto: <fmt:formatDate type="time" dateStyle="short" value="${fecha}" /></li>
                <li>Fecha, formato normal: <fmt:formatDate type="time" dateStyle="medium" timeZone="${gtm}"  value="${fecha}" /></li>
                <li>Fecha, formato largo: <fmt:formatDate type="time" dateStyle="long" timeZone="${gtm}"  value="${fecha}" /></li>
            </ul>
        </td>
    </tr>

    <!-- formatNumber -->
    <tr>
        <td>Formatea números</td><td>formatNumber</td>
        <td>
            <ul>
                <li>value></li>
                <li>type</li>
                <li>pattern</li>
                <li>currencyCode</li>
                <li>currencySymbol</li>
                <li>groupingUsed</li>
                <li>maxIntegerDigits</li>
                <li>minIntegerDigits</li>
                <li>maxFractionDigits</li>
                <li>minFractionDigits</li>
                <li>var</li>
                <li>scope</li>
            </ul>
        </td>
        <td>
            <ul>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
            </ul>
        </td>
        <td>
            <pre>
&lt;c:set var="valor" value="4523.347149" />
&lt;c:out value="${valor}" />
&lt;fmt:formatNumber type="currency" value="${valor}" />
&lt;fmt:formatNumber type="number" groupingUsed="true" value="${valor}" />
&lt;fmt:formatNumber type="number" maxIntegerDigits="3" value="${valor}" />
&lt;fmt:formatNumber type="number" maxFractionDigits="6" value="${valor}" />
&lt;fmt:formatNumber type="percent" maxIntegerDigits="4" value="${valor}" />
&lt;fmt:formatNumber type="number" pattern="####.###" value="${valor}" />
            </pre>
        </td>
        <td>
            <ul>
                <li><c:set var="valor" value="4523.347149" /></li>
                <li><c:out value="${valor}" /></li>
                <li><fmt:formatNumber type="currency" value="${valor}" /></li>
                <li><fmt:formatNumber type="number" groupingUsed="true" value="${valor}" /></li>
                <li><fmt:formatNumber type="number" maxIntegerDigits="3" value="${valor}" /></li>
                <li><fmt:formatNumber type="number" maxFractionDigits="6" value="${valor}" /></li>
                <li><fmt:formatNumber type="percent" maxIntegerDigits="4" value="${valor}" /></li>
                <li><fmt:formatNumber type="number" pattern="####.###" value="${valor}" /></li>
            </ul>
        </td>
    </tr>

    <!-- bundle -->
    <tr>
        <td>Carga un fichero de recursos</td><td>bundle</td>
        <td>
            <ul>
                <li>basename</li>
                <li>prefix</li>
            </ul>
        </td>
        <td>
            <ul>
                <li>Si</li>
                <li>No</li>
            </ul>
        </td>
        <td>
            <pre>
&lt;c:set var="pais" value="Italia" />
&lt;fmt:bundle basename="paises">
	Argentina: &lt;fmt:message key="Argentina" />
	&lt;fmt:message var="gmt" key="\${pais}" />
&lt;/fmt:bundle>
Italia:&lt;c:out value="\${gmt}" />
            </pre>
        </td>
        <td>
            <c:set var="pais" value="Italia" />
            <fmt:bundle basename="paises">
                Argentina: <fmt:message key="Argentina" />
                <fmt:message var="gmt" key="${pais}" />
            </fmt:bundle>
            Italia:<c:out value="${gmt}" />
        </td>
    </tr>
</table>
<p class="enlace"><a href="${contextPath}/JSP/menuLibreriasJSTL.jsp" > ---> Volver al index <---</a></p>

<c:import url="../INC/pie.jsp"/>