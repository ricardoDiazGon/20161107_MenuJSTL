<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../INC/cabecera.jsp"/>
<jsp:useBean id="nombres" scope="page" class="es.albarregas.beans.ListaNombres" />
<table>
    <tr><th>Librería</th><th>Prefijo</th><th>URI</th></tr>
    <tr><td>core</td><td>c</td><td>http://java.sun.com/jsp/jstl/core</td></tr>
</table>

<table>
    <tr>
        <th>Significado</th><th>Etiqueta</th><th>Atributos</th><th>requerido</th><th>Ejemplo</th><th>Salida</th>
    </tr>
    <!-- ETIQUETA C:SET -->
    <tr>
        <td>Asigna un valor a una variable</td><td>c:set</td>
        <td>
            <ul>
                <li>var</li>
                <li>value</li>
                <li>target</li>
                <li>property</li>
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
            </ul>
        </td>
        <td>
            <pre>&lt;c:set var="variable1" value="Bienvenido" /></pre>
        </td>
        <td>
            No hay salida
        </td>
    </tr>
    <!-- ETIQUETA C:OUT -->    
    <tr>
        <td>Muestra el contenido de una variable</td>
        <td>c:out</td>
        <td>
            <ul>
                <li>value</li>
                <li>default</li>
                <li>escapeXML</li>
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
            <pre>&lt;c:set var="var1" value="Bienvenidos"/>
&lt;c:out value="\${var1}" default="No tiene valor" /></pre>
        </td>
        <td>
            <c:set var="var1" value="Bienvenidos"/>
            <c:out value="${var1}" default="No tiene valor" />            
        </td>
    </tr>
    <!-- ETIQUETA C:OUT -->  
    <tr>
        <td>Elimina una variable de ámbito</td>
        <td>c:remove</td>
        <td>
            <ul>
                <li>var</li>
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
            <pre>&lt;c:set var="var2" value="Valor de var2" />
&lt;c:remove scope="page" var="var2" />
&lt;c:out value="\${var2}" default="La variable ha sido eliminada" /></pre>
        </td>
        <td>
            <c:set var="var2" value="Valor de var2" />
            <c:remove scope="page" var="var2" />
            <c:out value="${var2}" default="La variable ha sido eliminada" />                
        </td>
    </tr>
    <!-- ETIQUETA C:IF -->  
    <tr>
        <td>Condición simple if</td>
        <td>c:if</td>
        <td>
            <ul>
                <li>test</li>
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
            <pre>&lt;c:set var="anio" value="2016" />
&lt;c:set var="salida" value="Ese año es del siglo XX" />
&lt;c:if test="\${anio > 1999}" >   
    &lt;c:set var="salida" value="Ese año es del siglo XXI" />
&lt;/c:if>
&lt;c:out value="\${salida}" /></pre>
        </td>
        <td>
            <c:set var="anio" value="2016" />
            <c:set var="salida" value="Ese año es del siglo XX" />
            <c:if test="${ anio > 1999}" >   
                <c:set var="salida" value="Ese año es del siglo XXI" />
            </c:if>
            <c:out value="${salida}" />
        </td>
    </tr>
    <!-- ETIQUETA C:CHOOSE -->  
    <tr>
        <td>Condición simple exclusiva choose</td>
        <td>c:choose</td>
        <td>
            Sin atributos
        </td>
        <td>
            Sin atributos
        </td>
        <td>
            <pre>&lt;c:set var="numero" value="5" />
&lt;c:choose>
    &lt;c:when test="\${numero < 10}">
            &lt;c:out value="La variable vale menos de 10" />
    &lt;/c:when>
    &lt;c:when test="\${numero == 10}">
            &lt;c:out value="La variable vale 10"/>
    &lt;/c:when>
&lt;c:otherwise>
    &lt;c:out value="La variable vale más de 10"/>
&lt;/c:otherwise>
&lt;/c:choose></pre>
        </td>
        <td>
            <c:set var="numero" value="5" />
            <c:choose>
                <c:when test="${numero < 10}">
                        <c:out value="La variable vale menos de 10" />
                </c:when>
                <c:when test="${numero == 10}">
                        <c:out value="La variable vale 10"/>
                </c:when>
            <c:otherwise>
                <c:out value="La variable vale más de 10"/>
            </c:otherwise>
            </c:choose>
        </td>
    </tr>
    <!-- ETIQUETA C:CATCH-->  
    <tr>
        <td>Crea excepciones</td>
        <td>c:catch</td>
        <td>
            <ul>
                <li>var</li>
            </ul>
        </td>
        <td>
            <ul>
                <li>No</li>
            </ul>
        </td>
        <td>
<pre>&lt;c:catch var="catchException">
    &lt;jsp:expression> 3/0 &lt;/jsp:expression>
&lt;/c:catch>         
&lt;c:choose>
    &lt;c:when test="\${ catchException != null }">
        &lt;c:out value="La excepcion es: \${catchException} "/>
        &lt;c:out value="Excepción: \${catchException.message}"/>
    &lt;/c:when>
    &lt;c:otherwise>
        &lt;c:out value="La operación es correcta" />
    &lt;/c:otherwise>
&lt;/c:choose></pre>
        </td>
        <td>
            <c:catch var="catchException">
                <jsp:expression> 3/0 </jsp:expression>
            </c:catch>         
            <c:choose>
                <c:when test="${ catchException != null }">
                    <c:out value="La excepcion es: ${catchException} "/>
                    <c:out value="Excepción: ${catchException.message}"/>
                </c:when>
                <c:otherwise>
                    <c:out value="La operación es correcta" />
                </c:otherwise>
            </c:choose>         
        </td>
    </tr>
    <!-- ETIQUETA C:FOREACH-->  
    <tr>
        <td>Bucle For Each</td>
        <td>c:forEach</td>
        <td>
            <ul>
                <li>items</li>
                <li>begin</li>
                <li>end</li>
                <li>step</li>
                <li>var</li>
                <li>varStatus</li>
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
            </ul>
        </td>
        <td>
<pre>&lt;c:forEach var="nombre" items="\${pageScope.nombres.nombres}">
    &lt;c:out value="\${nombre}" />
&lt;/c:forEach></pre>
        </td>
        <td>
            <ul>
            <c:forEach var="nombre" items="${pageScope.nombres.nombres}">
                <li><c:out value="${nombre}" /></li>
            </c:forEach>
            </ul>
        </td>
    </tr>
    <!-- ETIQUETA C:FOREACH CON varStatus-->  
    <tr>
        <td>Bucle For Each con varStatus</td>
        <td>c:forEach</td>
        <td>
            <ul>
                <li>items</li>
                <li>begin</li>
                <li>end</li>
                <li>step</li>
                <li>var</li>
                <li>varStatus</li>
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
            </ul>
        </td>
        <td>
<pre>&lt;c:forEach var="nombre" items="\${pageScope.nombres.nombres}" varStatus="i">
    &lt;c:choose>
        &lt;c:when test="\${i.count % 2 == 0}">
            &lt;li class="par">&lt;c:out value="\${nombre}" />&lt;/li>                     
        &lt;/c:when>
        &lt;c:otherwise>
            &lt;li class="impar">&lt;:out value="\${nombre}" />&lt;/li>
        &lt;/c:otherwise>                          
    &lt;/c:choose>
&lt;/c:forEach></pre>
        </td>
        <td>
            <ul>
                <c:forEach var="nombre" items="${pageScope.nombres.nombres}" varStatus="i">
                    <c:choose>
                        <c:when test="${i.count % 2 == 0}">
                            <li class="par"><c:out value="${nombre}" /></li>                     
                        </c:when>
                        <c:otherwise>
                            <li class="impar"><c:out value="${nombre}" /></li>
                        </c:otherwise>                          
                    </c:choose>
                </c:forEach>
            </ul>
        </td>
    </tr>
    
    <!-- ETIQUETA C:FOREACH CON begin, end y step-->  
    <tr>
        <td>Bucle For Each con begin, end y step</td>
        <td>c:forEach</td>
        <td>
            <ul>
                <li>items</li>
                <li>begin</li>
                <li>end</li>
                <li>step</li>
                <li>var</li>
                <li>varStatus</li>
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
            </ul>
        </td>
        <td>
<pre>&lt;c:forEach var="nombre" items="\${pageScope.nombres.nombres}" begin="2" end="7" step="2">
    &lt;c:out value="${nombre}" />
&lt;/c:forEach></pre>
        </td>
        <td>
            <ul>
                <c:forEach var="nombre" items="${pageScope.nombres.nombres}" begin="2" end="7" step="2">
                    <li><c:out value="${nombre}" /></li>
                </c:forEach>
            </ul>
        </td>
    </tr>
    <!-- ETIQUETA C:TOKENS-->  
    <tr>
        <td>Recorre listas con delimitador</td>
        <td>c:forTokens</td>
        <td>
            <ul>
                <li>items</li>
                <li>delims</li>
                <li>begin</li>
                <li>end</li>
                <li>step</li>
                <li>var</li>
                <li>varStatus</li>
            </ul>
        </td>
        <td>
            <ul>
                <li>Si</li>
                <li>Si</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
            </ul>
        </td>
        <td>
<pre>&lt;c:set var="diasSemana" value="Lunes,Martes,Miercoles,Jueves,Viernes,Sabado,Domingo" />            
&lt;c:forTokens var="dia" items="\${diasSemana}" delims=",">
    &lt;c:out value="\${dia}" />
&lt;/c:forTokens></pre>
        </td>
        <td>
            <ul>
                <c:set var="diasSemana" value="Lunes,Martes,Miercoles,Jueves,Viernes,Sabado,Domingo" />            
                <c:forTokens var="dia" items="${diasSemana}" delims=",">
                    <li><c:out value="${dia}" /></li>
                </c:forTokens>                
            </ul>
        </td>
    </tr>
    <!-- ETIQUETA C:IMPORT -->
    <tr>
        <td>Importa una página</td><td>c:import</td>
        <td>
            <ul>
                <li>url</li>
                <li>var</li>
                <li>scope</li>
                <li>varReader</li>
                <li>context</li>
                <li>charEncoding</li>
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
            </ul>
        </td>
        <td>
            <pre>&lt;c:import url="../INC/cabecera.jsp"/></pre>
        </td>
        <td>

        </td>
    </tr>
    <!-- ETIQUETA C:URL -->
    <tr>
        <td>Asigna una url</td><td>c:url</td>
        <td>
            <ul>
                <li>var</li>
                <li>scope</li>
                <li>value</li>
                <li>context</li>
            </ul>
        </td>
        <td>
            <ul>
                <li>No</li>
                <li>No</li>
                <li>No</li>
                <li>No</li>
            </ul>
        </td>
        <td>
            <pre>&lt;c:url value="www.google.es" /></pre>
        </td>
        <td>
        </td>
    </tr>
    <!-- ETIQUETA C:REDIRECT -->
    <tr>
        <td>Redirecciona a otra página</td><td>c:redirect</td>
        <td>
            <ul>
                <li>url</li>
                <li>context</li>
            </ul>
        </td>
        <td>
            <ul>
                <li>No</li>
                <li>No</li>
            </ul>
        </td>
        <td>
            <pre>&lt;c:redirect url="www.google.es" /></pre>
        </td>
        <td>
            
        </td>
    </tr>
</table>
        
<p class="enlace"><a href="${contextPath}/JSP/menuLibreriasJSTL.jsp" > ---> Volver al index <---</a></p>
            
<c:import url="../INC/pie.jsp"/>