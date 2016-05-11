package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author JMLOPEZ
 */
public class Conexion {
    
    private String USERNAME = "root";
    private String PASSWORD = "";
    private String HOST = "127.0.0.1";
    private String PORT = "3306";
    private String DATABASE = "restweb";
    private String CLASSNAME = "com.mysql.jdbc.Driver";
    private String URL = "jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE;
    private Connection con;
    
    public Conexion(){
        try {
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("ERROR"+e);
        } catch(SQLException e){
            System.out.println("ERROR"+e);
        }
    }
    
    public Connection getConnection(){
        return con;
    }
    
    public static void main(String[] args) {
        Conexion con = new Conexion();
    }
}
