/* Controlador que carga el pais seleccionado y lo manda a la salida */
package es.albarregas.controladores;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo
 */
@WebServlet(name = "elegirPais", urlPatterns = {"/elegirPais"})
public class elegirPais extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = "JSP/menuPaises.jsp";
        Date fecha = new Date();
        Double numero = 4523.6536923;

        if (request.getParameter("enviar") != null) {

            String[] valorSelect = request.getParameter("pais").split("-");
            String locale = valorSelect[0];
            String pais = valorSelect[1];
            Boolean existe = false;
            String[] paises = {"España", "Estados Unidos", "Argentina", "Portugal", "Japón", "Noruega", "Rusia", "Italia"};

            for (String pais2 : paises) {
                if (pais.equals(pais2)) {
                    existe = true;
                    break;
                }
            }

            if (!existe) {
                //Si el país que queremos poner no está soportado, dejamos por defecto España
                locale = "es_ES";
                pais = "España";
            } else if (pais.contains("Esp")) {
                //Del value no se cogen los caracteres correctamente en UTF-8, así que ponemos España a pelo para que salga bien
                pais = "España";
            } else if(pais.equals("Estados Unidos")){
                pais = "Estados_Unidos";
            }

            request.setAttribute("locale", locale);
            request.setAttribute("pais", pais);
            request.setAttribute("fecha", fecha);
            request.setAttribute("numero", numero);
            request.setAttribute("existe", existe);

            url = "/JSP/salidaPaises.jsp";
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
