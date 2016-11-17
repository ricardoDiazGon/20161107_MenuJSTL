<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="nombres" scope="page" class="es.albarregas.beans.ListaNombres" />
<c:import url="../INC/cabecera.jsp" />

<table>
    <tr><th>Librería</th><th>Prefijo</th><th>URI</th></tr>
    <tr><td>funciones</td><td>fn</td><td>http://java.sun.com/jsp/jstl/functions</td></tr>
</table>

<c:set var="original" value="Esto es una prueba de funciones JSTL" />


<table>
    <tr>
        <th>Significado</th><th>Función</th><th>Sintaxis</th><th>Ejemplo</th><th>Salida</th>
    </tr>
    <!-- CADENA ORIGINAL -->
    <tr>
        <td>Cadena original</td><td></td><td></td>
        <td>
            
<pre>&lt;c:out value="\${original}"></pre>                
            
        </td>
        <td>
            <c:out value="${original}"/>
        </td>
    </tr> 
    
    <!-- LENGHT -->
    <tr>
        <td>Longitud de la cadena</td>
        <td>length</td>
        <td>
            int length(Object)
        </td>
        <td>
            
<pre>&lt;c:out value="La variable original tiene \${fn:length(original)} caracteres" /></pre>                  
            
        </td>
        <td>
    <c:out value="La variable original tiene ${fn:length(original)} caracteres" />            
        </td>
    </tr>

    <!-- ToLowerCase -->
    <tr>
        <td>Pasar a minúsculas</td>
        <td>toLowerCase</td>
        <td>
             String toLowerCase(String)
        </td>
        <td>
            
<pre>&lt;c:out value="\${fn:toLowerCase(original)}" /> </pre>                 
            
        </td>
        <td>
    <c:out value="${fn:toLowerCase(original)}" />                 
        </td>
    </tr>
    
    <!-- ToUpperCase -->
    <tr>
        <td>Pasar a mayúsculas</td>
        <td>toUpperCase</td>
        <td>
             String toUpperCase(String)
        </td>
        <td>
            
<pre>&lt;c:out value="\${fn:toUpperCase(original)}" /></pre>                  
            
        </td>
        <td>
    <c:out value="${fn:toUpperCase(original)}" />                 
        </td>
    </tr>
    <!-- substring -->
    <tr>
        <td>Obtener una subcadena</td>
        <td>substring</td>
        <td>
             String substring(String, int, int)
        </td>
        <td>
            
<pre>&lt;c:out value="\${fn:substring(original, 8, 17)}" /> </pre>                  
            
        </td>
        <td>
    <c:out value="${fn:substring(original, 8, 18)}" />                 
        </td>
    </tr>
    <!-- substringAfter -->
    <tr>
        <td>Obtener subcadena después de</td>
        <td>substringAfter</td>
        <td>
             String substringAfter(String, String)
        </td>
        <td>
            
<pre>&lt;c:out value="\${fn:substringAfter(original, 'una')}" /> </pre>                  
            
        </td>
        <td>
    <c:out value="${fn:substringAfter(original, 'una')}" />                 
        </td>
    </tr>
    <!-- substringBefore -->
    <tr>
        <td>Obtener subcadena antes de</td>
        <td>substringBefore</td>
        <td>
            String substringBefore(String, String)
        </td>
        <td>
            
<pre>&lt;c:out value="\${fn:substringBefore(original, 'una')}" /> </pre>                  
            
        </td>
        <td>
    <c:out value="${fn:substringBefore(original, 'una')}" />                 
        </td>
    </tr>
    <!-- replace -->
    <tr>
        <td>Reemplazar cadena</td>
        <td>replace</td>
        <td>
            String replace(String, String, String)
        </td>
        <td>
            
<pre>&lt;c:out value="\${fn:replace(original, ' ', '-')}" /> </pre>                  
            
        </td>
        <td>
    <c:out value="${fn:replace(original, ' ', '-')}" />                 
        </td>
    </tr>
    <!-- split -->
    <tr>
        <td>Dividir cadena en tokens</td>
        <td>split</td>
        <td>
            String[] split(String, String)
        </td>
        <td>
            
<pre>
&lt;c:set var="palabras" value="\${fn:split(original, ' ')}" />
&lt;c:forEach items="\${palabras}" var="palabra" begin="2" end="8">
    &lt;c:out value="\${palabra}" />  
&lt;/c:forEach>
</pre>                  
            
        </td>
        <td>
            <c:set var="palabras" value="${fn:split(original, ' ')}" />
            <c:forEach items="${palabras}" var="palabra" begin="2" end="8">
                <c:out value="${palabra}" />  
            </c:forEach>                  
        </td>
    </tr>
    <!-- contains -->
    <tr>
        <td>Compara si tiene un fragmento de cadena en la cadena</td>
        <td>contains</td>
        <td>
            	boolean contains(String, String)
        </td>
        <td>
            
<pre>
&lt;c:if test="\${fn:contains(original, 'una prueba')}">
    &lt;c:out value="\"una prueba\" está contenida en: ${original}" />  
&lt;/c:if>
</pre>                  
            
        </td>
        <td>
            <c:if test="${fn:contains(original, 'una prueba')}">
                <c:out value="\"una prueba\" está contenida en: ${original}" />  
            </c:if>                  
        </td>
    </tr>
    <!-- containsIgnoreCase -->
    <tr>
        <td>Compara si una cadena contiene otra, pero es case-insensitive</td>
        <td>containsIgnoreCase</td>
        <td>
            	boolean containsIgnoreCase(String, String)
        </td>
        <td>
            
<pre>
&lt;c:if test="\${fn:containsIgnoreCase(original, 'Una PrUebA')}">
    &lt;c:out value="\"Una PrUebA\" está contenida en: ${original}" />  
&lt;/c:if>
</pre>                  
            
        </td>
        <td>
            <c:if test="${fn:containsIgnoreCase(original, 'Una PrUebA')}">
                <c:out value="\"Una PrUebA\" está contenida en: ${original}" />  
            </c:if>                  
        </td>
    </tr>
    <!-- indexOf -->
    <tr>
        <td>Posición de la primera ocurrencia</td>
        <td>indexOf</td>
        <td>
            int indexOf(String, String)
        </td>
        <td>
            
<pre>
&lt;c:out value="La posición de la primera 'o' es: \${fn:indexOf(original, 'o')}"  />
</pre>                  
            
        </td>
        <td>
            <c:out value="La posición de la primera 'o' es: ${fn:indexOf(original, 'o')}"  />              
        </td>
    </tr>
    <!-- join -->
    <tr>
        <td>Unión de los elementos de un array en un String</td>
        <td>join</td>
        <td>
            String join(String[], String)
        </td>
        <td>
            
<pre>
&lt;c:set var="arraynombres" value="${nombres.nombres1}"  />
&lt;c:out value="Array de nombres: ${fn:join(arraynombres, ':')}"  />    
</pre>                  
            
        </td>
        <td>
            <c:set var="arraynombres" value="${nombres.nombres1}"  />
            <c:out value="Array de nombres: ${fn:join(arraynombres, ':')}"  />              
        </td>
    </tr>

    <!-- startsWith -->
    <tr>
        <td>Compara con el inicio de la cadena</td>
        <td>startsWith</td>
        <td>
            boolean startsWith(String, String)
        </td>
        <td>          
<pre>
&lt;c:if test="\${fn:startsWith(original, 'Esto es')}">
    &lt;c:out value="La cadena empieza por 'Esto es'"/>
&lt;/c:if>   
</pre>                           
        </td>
        <td>
            <c:if test="${fn:startsWith(original, 'Esto es')}">
                <c:out value="La cadena empieza por 'Esto es'"/>
            </c:if>
        </td>
    </tr>
    <!-- startsWith -->
    <tr>
        <td>Compara con el final de la cadena</td>
        <td>endsWith</td>
        <td>
            boolean endsWith(String, String)
        </td>
        <td>          
<pre>
&lt;c:if test="\${fn:endsWith(original, 'funciones JSTL')}">
    &lt;c:out value="La cadena termina en 'funciones JSTL'"/>
&lt;/c:if>   
</pre>                           
        </td>
        <td>
            <c:if test="${fn:endsWith(original, 'funciones JSTL')}">
                <c:out value="La cadena termina en 'funciones JSTL'"/>
            </c:if>
        </td>
    </tr>
    <!-- startsWith -->
    <tr>
        <td>Compara con el inicio de la cadena</td>
        <td>startsWith</td>
        <td>
            boolean startsWith(String, String)
        </td>
        <td>          
<pre>
&lt;c:if test="\${fn:startsWith(original, 'Esto es')}">
    &lt;c:out value="La cadena empieza por 'Esto es'"/>
&lt;/c:if>   
</pre>                           
        </td>
        <td>
            <c:if test="${fn:startsWith(original, 'Esto es')}">
                <c:out value="La cadena empieza por 'Esto es'"/>
            </c:if>
        </td>
    </tr>
    <!-- TRIM -->
    <tr>
        <td>Elimina los espacios de los lados</td>
        <td>trim</td>
        <td>
            String trim(String)
        </td>
        <td>          
<pre>
&lt;c:out value="\${fn:trim('      Frase con espacios alrededor        ')}" />  
</pre>                           
        </td>
        <td>
            <c:out value="${fn:trim('      Frase con espacios alrededor        ')}" />
        </td>
    </tr>
</table>
        
<p class="enlace"><a href="${contextPath}/JSP/menuLibreriasJSTL.jsp" > ---> Volver al index <---</a></p>
            
<c:import url="../INC/pie.jsp"/>
