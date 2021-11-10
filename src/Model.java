import static java.lang.System.exit;
import java.sql.*;

public class Model {
    public Connection seConnecter (String url, String user, String password) throws SQLException {
        Connection conn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
        }

        catch (ClassNotFoundException e){
            System.out.println("Erreur lors du chargement" + e.getMessage());
            exit(0);
        }

        return conn;
    }
    public ResultSet traiterRequete(String req) throws SQLException {
        Statement stmt = null;
        Connection connexion = null;
        ResultSet result = null;

        try{
            String url = "jdbc:mysql://lcalhost:3306/dbfret";
            String user = "root";
            String password = "";

            connexion = this.seConnecter(url, user, password);
            stmt = (Statement) connexion.createStatement();
            result = stmt.executeQuery(req);
        }

        catch (SQLException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }

        return result;
    }

}
