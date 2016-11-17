//Bean con un listado de nombres...
package es.albarregas.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ListaNombres implements Serializable{
    
    List<String> nombres = new ArrayList<String>();
    String[] nombres1;
    
    public ListaNombres(){
        nombres.add("Ricardo");
        nombres.add("Adrián");
        nombres.add("Jesus");
        nombres.add("Fran");
        nombres.add("Manuel");
        nombres.add("Luis");
        nombres.add("Oscar");
        nombres.add("Mario");
        
        nombres1 = new String[4];
        nombres1[0] = "Ricardo1";
        nombres1[1] = "Adrian1";
        nombres1[2] = "Jesus1";
        nombres1[3] = "Fran1";
    }

    public String[] getNombres1() {
        return nombres1;
    }

    public void setNombres1(String[] nombres1) {
        this.nombres1 = nombres1;
    }

    public List<String> getNombres() {
        return nombres;
    }

    public void setNombres(List<String> nombres) {
        this.nombres = nombres;
    }
    
    
}
