<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:import url="${contextPath}/INC/cabecera.jsp"/>

<c:choose>
    <c:when test="${param.actualizar != null}">

        <sql:query dataSource="${ds}" var="clientes">
            SELECT * FROM clientes where id = "${param.id}";
        </sql:query>
        <h1>ACTUALIZAR CLIENTE</h1>
        <form method="post" action="${contextPath}/JSP/salidaCrud.jsp">
            <ul>
                <c:forEach items="${clientes.rows}" var="cliente">
                    <li><label>Id</label><br/><input type="text" size="10" value="${cliente.id}" disabled /><input type="hidden" name="id" value="${cliente.id}" /></li>
                    <li><label>Nombre</label><br/><input type="text" name="nombre" size="10" value="${cliente.nombre}" /></li>
                    <li><label>Apellidos</label><br/><input type="text" name="apellidos" size="20" value="${cliente.apellidos}" /></li>
                    <li><label>Dirección</label><br/><input type="text" name="direccion" size="20" value="${cliente.direccion}" /></li>
                    <li><label>Teléfono</label><br/><input type="text" name="telefono" size="9" maxlength="9" value="${cliente.telefono}"/></li>
                </c:forEach>
            </ul>     
            <p>
                <input type="submit" name="actualizar" value="Actualizar" />
                <input type="reset" name="limpiar" value="Limpiar" />
            </p>
        </form>
    </c:when>

    <c:otherwise>
        <h2>Ha habido un error. Ha accedido a esta página ilegalmente</h2>
    </c:otherwise>
</c:choose>

<p class="enlace"><a href="${contextPath}/JSP/menuCrud.jsp" >---> Volver al Menú CRUD <---</a></p>

<c:import url="../INC/pie.jsp"/>