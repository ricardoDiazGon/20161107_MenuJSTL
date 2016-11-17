<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<c:import url="${contextPath}/INC/cabecera.jsp"/>

<c:import url="${contextPath}/XML/universidad.xml" var="archivo" />
<x:parse xml="${archivo}" var="doc" />

<table>
    <!-- cabecera -->
    <tr>
        <th>Pregunta</th><th>Salida</th>
    </tr>

    <!-- contenido -->
    <tr>
        <td>Nombre de la universidad</td>
        <td><x:out select="$doc/universidad/nombre"/></td>
    </tr>
    <tr>
        <td>País de la universidad</td>
        <td><x:out select="$doc/universidad/pais"/></td>
    </tr>    
    <tr>
        <td>Nombre de las carreras</td>
        <td>
            <ul>
                <x:forEach select="$doc/universidad/carreras/carrera" var="carrera">
                    <li>
                        <x:out select="$carrera/nombre"/>
                    </li>
                </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Años del plan de estudio de las carreras</td>
        <td>
            <ul>
                <x:forEach select="$doc/universidad/carreras/carrera" var="carrera">
                    <li>
                        <x:out select="$carrera/plan"/>
                    </li>
                </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Nombre de todos los alumnos</td>
        <td>
            <ul>
                <x:forEach select="$doc/universidad/alumnos/alumno" var="alumno">
                    <li>
                        <x:out select="$alumno/nombre"/>
                    </li>
                </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Identificadores de las carreras</td>
        <td>
            <ul>
                <x:forEach select="$doc//alumno//carrera" var="carrera">
                    <li>
                        <x:out select="$carrera/@codigo"/>
                    </li>
                </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Datos de la carrera con id = c01</td>
        <td>
            <ul>
                <x:forEach select="$doc//carreras/carrera[@id='c01']/*" var="carrera">
                    <li>
                        <x:out select="$carrera" />
                    </li>
                </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Centro en el que se estudia la carrera con id = c02</td>
        <td>
                    <x:out select="$doc//carreras/carrera[@id='c02']/centro"/>
        </td>
    </tr>
    <tr>
        <td>Nombre de los alumnos que estén haciendo proyecto</td>
        <td>
            <ul>
            <x:forEach select="$doc//estudios/proyecto" var="alumnos">
                <li><x:out select="$alumnos/../../nombre"/></li>
            </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Código de las carreras donde hay algún alumno matriculado</td>
        <td>
            <ul>
            <x:forEach select="$doc//alumno/estudios/carrera" var="carrera">
                <li><x:out select="$carrera/@codigo"/></li>
            </x:forEach>
            </ul>
        </td>
    </tr>

    <tr>
        <td>Nombre y apellidos de los alumnos con beca</td>
        <td>
            <ul>
                <x:forEach select="$doc//alumno" var="alumno">
                    <li>
                        <x:out select="$alumno[@beca]/nombre"/>
                        <x:out select="$alumno[@beca]/apellido"/>
                    </li>
                </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Nombre de las asignaturas de la titulación c04</td>
        <td>
            <ul>
            <x:forEach select="$doc//asignaturas/asignatura[@titulacion='c04']" var="asignatura">
                <li><x:out select="$asignatura/nombre"/></li>
            </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Nombre de las asignaturas del segundo trimestre</td>
        <td>
            <ul>
            <x:forEach select="$doc//asignaturas/asignatura[trimestre='2']" var="asignatura">
                <li><x:out select="$asignatura/nombre"/></li>
            </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Nombre de las asignaturas que no tienen 4 créditos teóricos</td>
        <td>
            <ul>
            <x:forEach select="$doc//asignaturas/asignatura[creditos_teoricos!='4']" var="asignatura">
                <li><x:out select="$asignatura/nombre"/></li>
            </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Código de la carrera que estudia el último alumno</td>
        <td>
            <x:out select="$doc//alumnos//carrera/@codigo[last()]"/>
        </td>
    </tr>
    <tr>
        <td>Nombre de los alumnos matriculados en la asignatura a02</td>
        <td>
            <ul>
            <x:forEach select="$doc//alumno//asignatura[@codigo='a02']" var="asignatura">
                <li><x:out select="$asignatura/../../../nombre" /></li>
            </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Código de las carreras que estudian los alumnos matriculados en alguna asignatura</td>
        <td>
            <ul>
            <x:forEach select="$doc//alumno//asignaturas[asignatura]" var="asignatura">
                <li><x:out select="$asignatura/../carrera/@codigo" /></li>
            </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Apellidos de todos los hombres</td>
        <td>
            <ul>
            <x:forEach select="$doc//alumno[sexo='Hombre']" var="hombre">
                <li>
                    <x:forEach select="$hombre/apellido" var="apellido">
                        <x:out select="$apellido" />
                    </x:forEach>
                </li>
            </x:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Nombre de la carrera que estudia Victor Manuel</td>
        <td>
            <x:set select="$doc//alumno[nombre='Víctor Manuel']//carrera/@codigo" var="codigo"/>
            <x:out select="$doc//carreras/carrera[@id=$codigo]/nombre" />
        </td>
    </tr>
    <tr>
        <td>Nombre de los alumnos matriculados en carreras que no tienen subdirector</td>
        <td>
            <ul>
            <x:forEach select="$doc//carreras/carrera[not(subdirector)]/@id" var="carrera" >
                <li><x:out select="$doc//alumno//carrera[@codigo=$carrera]/../../nombre" /></li>
            </x:forEach>
            </ul>
        </td>
    </tr>
</table>


<c:import url="${contextPath}/INC/pie.jsp"/>
