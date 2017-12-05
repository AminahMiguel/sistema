package bolsas.repositorio;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexaoUtil {
    
    
    
    public static Connection getConnection() {
        try {
            Class.forName("org.hsqldb.jdbcDriver");
            return DriverManager.getConnection(
                    "jdbc:hsqldb:hsql://127.0.0.1/data", 
                    "sa", ""
            );
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
}
