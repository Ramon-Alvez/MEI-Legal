
package Config;
import java.sql.*;

/**
 * @author ramon
 */

public class ConectaBanco {
    public static Connection conectar() throws ClassNotFoundException {
        // Abre uma conexão
        Connection conn = null; 
        try{
            Class.forName("com.mysql.jdbc.Driver");     
            
            // DB, Usuário, Senha (N ri da minha senha >:c)           
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/meilegal",
                    "root", "SuricatoManco1."
            );
        }catch(SQLException err){
            System.out.println("Erro - SQL: " + err);
        }
        return conn;
    }
}
