<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:import url="../INC/cabecera.jsp"/>

<!-- Establecemos la conexión con la base de datos -->
<c:if test="${ds == null}">
    <sql:setDataSource var="ds" dataSource="jdbc/JSTL" scope="session" />
</c:if>

<c:set var="opcion" value="${param.opt}" />

<c:choose>
    <c:when test="${opcion == 1}">
        <c:redirect url="${contextPath}/JSP/salidaCrud.jsp"/>
    </c:when>
    <c:when test="${opcion == 2}">
        <h1>INSERCIÓN</h1>
        <form method="post" action="${contextPath}/JSP/salidaCrud.jsp">
            <table>
                <ul>
                    <li>
                        <label>Nombre</label><br/><input type="text" name="nombre" size="10" />
                    </li>
                    <li>
                        <label>Apellidos</label><br/><input type="text" name="apellidos" size="10" />
                    </li>
                    <li>
                        <label>Dirección</label><br/><input type="text" name="direccion" size="10" />
                    </li>
                    <li>
                        <label>Teléfono</label><br/><input type="text" name="telefono" size="9" maxlength="9" />
                    </li>
                </ul>
                <p>
                    <input type="submit" name="insertar" value="Insertar" />
                    <input type="reset" name="limpiar" value="Limpiar" />
                </p>
            </table> 
        </form>
    </c:when>
    <c:when test="${opcion == 3}">
        <h1>ACTUALIZACIÓN</h1>
        <sql:query dataSource="${ds}" var="clientes">
            SELECT * FROM clientes;
        </sql:query>       
        <form method="post" action="${contextPath}/JSP/formUpdate.jsp">
            <table>
                <tr>
                    <th>Nombre</th><th>Apellidos</th><th>Dirección</th><th>Teléfono</th><th></th>
                </tr>
                <c:forEach items="${clientes.rows}" var="cliente" >
                    <tr>
                        <td><c:out value="${cliente.id}"/></td>
                        <td><c:out value="${cliente.nombre}"/></td>
                        <td><c:out value="${cliente.apellidos}"/></td>
                        <td><c:out value="${cliente.direccion}"/></td>
                        <td><c:out value="${cliente.telefono}"/></td>
                        <td><input type="radio" name="id" value="${cliente.id}" /></td>
                    </tr>
                </c:forEach>
            </table>
                
            <p>
                <input type="submit" name="actualizar" value="Actualizar" />
            </p>

        </form>
    </c:when>
    <c:when test="${opcion == 4}">
        <h1>ELIMINACIÓN</h1>
        <sql:query dataSource="${ds}" var="clientes">
            SELECT * FROM clientes;
        </sql:query>       
        <form method="post" action="${contextPath}/JSP/salidaCrud.jsp">
            <table>
                <tr>
                    <th>Nombre</th><th>Apellidos</th><th>Dirección</th><th>Teléfono</th><th></th>
                </tr>
                <c:forEach items="${clientes.rows}" var="cliente" >
                    <tr>
                        <td><c:out value="${cliente.id}"/></td>
                        <td><c:out value="${cliente.nombre}"/></td>
                        <td><c:out value="${cliente.apellidos}"/></td>
                        <td><c:out value="${cliente.direccion}"/></td>
                        <td><c:out value="${cliente.telefono}"/></td>
                        <td><input type="checkbox" name="id" value="${cliente.id}" /></td>
                    </tr>
                </c:forEach>
            </table>
                
            <p>
                <input type="submit" name="eliminar" value="eliminar" />
            </p>

        </form>

    </c:when>
    <c:when test="${param.insertar != null}">

    </c:when>

    <c:otherwise>
        <h1>No sé como has llegado a aquí pero, no vas a ver nada por entrar ilegalmente</h1>
    </c:otherwise>           
</c:choose>

<p class="enlace"><a href="${contextPath}/JSP/menuCrud.jsp" >---> Volver al Menú CRUD <---</a></p>

<c:import url="../INC/pie.jsp"/>
