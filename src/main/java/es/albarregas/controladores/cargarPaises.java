/* Servlet que carga los paises y sus lenguajes*/
package es.albarregas.controladores;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "cargarPaises", urlPatterns = {"/cargarPaises"})
public class cargarPaises extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(true);
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = "JSP/menuPaises.jsp";

        if (sesion.getAttribute("paises") == null) {
            Locale locales[] = SimpleDateFormat.getAvailableLocales();
            TreeMap<String, String> mapa = new TreeMap();
            for (int i = 0; i < locales.length; i++) {
                mapa.put(locales[i].getDisplayCountry(), locales[i].toString());
            }

            TreeMap<String, String> mapaAuxiliar = (TreeMap<String, String>) mapa.clone();

            for (Map.Entry<String, String> entry : mapaAuxiliar.entrySet()) {
                if (entry.getValue().length() != 5) {
                    mapa.remove(entry.getKey());
                }
            }
/*  COMENTAMOS EL IMPRIMIR PAISES PORQUE NO NECESITAMOS QUE LOS IMPRIMA SIEMPRE, SOLO PARA HACER PRUEBAS
            for (Map.Entry<String, String> entry : mapa.entrySet()) {
                System.out.println(entry.getKey() + " : " + entry.getValue());
            }
*/
            sesion.setAttribute("paises", mapa);
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
