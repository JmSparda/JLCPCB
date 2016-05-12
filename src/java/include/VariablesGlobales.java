package include;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author JMLOPEZ
 */
public class VariablesGlobales {
    
    public static String hora_actual;
    public static String fecha_actual;
    public static String fechahora_actual;
    
    
    public static void main(String[] args) {
        Date date = new Date();
        DateFormat hourFormat = new SimpleDateFormat("HH:mm:ss");
        VariablesGlobales.hora_actual = hourFormat.format(date);
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        VariablesGlobales.fecha_actual = sdf.format(date);

        DateFormat hourdateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        VariablesGlobales.fechahora_actual = hourdateFormat.format(date);
        
        //System.out.println(""+fechahora_actual);
        
    }
}
