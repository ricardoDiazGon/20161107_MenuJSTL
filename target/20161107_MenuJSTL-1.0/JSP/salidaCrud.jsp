<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:import url="../INC/cabecera.jsp"/>

<c:choose>
    <c:when test="${param.insertar != null}" >
        <c:catch var="ex">
            <sql:update dataSource="${ds}" sql="INSERT INTO clientes VALUES(0,?,?,?,?)">
                <sql:param value="${param.nombre}"/>
                <sql:param value="${param.apellidos}"/>
                <sql:param value="${param.direccion}"/>
                <sql:param value="${param.telefono}"/>
            </sql:update>  
        </c:catch>
        <c:if test="${ex != null}">
            <h2>"Ha ocurrido un error al insertar"</h2>
        </c:if>
        <c:if test="${ex == null}">
            <h2>El usuario ${param.nombre} ${param.apellidos} ha sido insertado correctamente</h2>
        </c:if>        
    </c:when>

    <c:when test="${param.eliminar != null}" >
        <c:catch var="ex">
            <c:forEach items="${paramValues.id}" var="cliente">
                <sql:update dataSource="${ds}" sql="DELETE FROM clientes WHERE id = ?">
                    <sql:param value="${cliente}"/>
                </sql:update>
            </c:forEach>
        </c:catch>
        <c:if test="${ex == null}">
        <h2>Se han eliminado correctamente los siguientes clientes</h2>
        <table>
            <tr><th>Id</th></tr>
            <c:forEach items="${paramValues.id}" var="clientes">
                <tr><td><c:out value="${clientes}"/></td></tr>
            </c:forEach>           
        </table>
        </c:if>
        <c:if test="${ex != null}">
            <h2>Ha habido un error al eliminar los datos. I'm Sorry, baby.</h2>
        </c:if>
    </c:when>

    <c:when test="${param.actualizar != null}" >
        <c:catch var="ex">
            <sql:update dataSource="${ds}" 
                        sql="UPDATE clientes SET nombre=?, apellidos=?, direccion=?, telefono=? WHERE id=?">
                <sql:param value="${param.nombre}"/>
                <sql:param value="${param.apellidos}"/>
                <sql:param value="${param.direccion}"/>
                <sql:param value="${param.telefono}"/>
                <sql:param value="${param.id}"/>
            </sql:update>
        </c:catch>
        <c:if test="${ex == null}">
            <h2>Se ha actualizado correctamente el cliente con los siguientes datos</h2>
            <ul>
                <li><b>Id: </b> <c:out value="${param.id}"/></li>
                <li><b>Nombre: </b> <c:out value="${param.nombre}"/></li>
                <li><b>Apellidos: </b> <c:out value="${param.apellidos}"/></li>
                <li><b>Dirección: </b> <c:out value="${param.direccion}"/></li>
                <li><b>Teléfono: </b> <c:out value="${param.telefono}"/></li>
            </ul>
        </c:if>
        <c:if test="${ex != null}">
            <h2>Ha habido un error al actualizar los datos. I'm Sorry, baby.</h2>
        </c:if>
    </c:when>

    <c:otherwise>
        <h1>CONSULTA</h1>
        <table>
            <sql:query dataSource="${ds}" var="clientes">
                SELECT * FROM clientes;
            </sql:query>
            <tr><th>Id</th><th>Nombre</th><th>Apellidos</th><th>Dirección</th><th>Teléfono</th></tr>   
                    <c:forEach var="cliente" items="${clientes.rows}" >
                <tr>
                    <td><c:out value="${cliente.id}"/></td>
                    <td><c:out value="${cliente.nombre}"/></td>
                    <td><c:out value="${cliente.apellidos}"/></td>
                    <td><c:out value="${cliente.direccion}"/></td>
                    <td><c:out value="${cliente.telefono}"/></td>
                </tr>
            </c:forEach>        
        </table>

    </c:otherwise>
</c:choose>

<p class="enlace"><a href="${contextPath}/JSP/menuCrud.jsp" >---> Volver al Menú CRUD <---</a></p>

<c:import url="../INC/pie.jsp"/>
