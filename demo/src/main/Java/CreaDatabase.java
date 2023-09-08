import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CreaDatabase {
    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Nome del database non fornito. Uso 'database_collegato'come nome di default.");
            args = new String[] { "database_collegato" };
        }

        Connection conn = null;
        try {
            // Carico il driver JDBC di SQLite
            Class.forName("org.sqlite.JDBC");

            // Creo una connessione al database
            String url = "jdbc:sqlite:prova.db";
            // String url = "database.db";
            conn = DriverManager.getConnection(url);

            System.out.println("Connessione a SQLite stabilita.");

            // Creo le tabelle
            String sqlCreaTabellaProdotti = "CREATE TABLE IF NOT EXISTS prodotti (" +
                    "id INTEGER PRIMARY KEY," +
                    "nome TEXT NOT NULL," +
                    "quantita INTEGER NOT NULL," +
                    "prezzo REAL NOT NULL," +
                    "id_categoria INTEGER NOT NULL" +
                    ");";

            String sqlCreaTabellaCategorie = "CREATE TABLE IF NOT EXISTS categorie (" +
                    "id INTEGER PRIMARY KEY," +
                    "nome TEXT NOT NULL" +
                    ");";

            String sqlCreaTabellaAcquisti = "CREATE TABLE IF NOT EXISTS acquisti (" +
                    "id INTEGER PRIMARY KEY," +
                    "id_prodotto INTEGER NOT NULL," +
                    "id_cliente INTEGER NOT NULL," +
                    "data_acquisto TEXT NOT NULL," +
                    "FOREIGN KEY(id_prodotto) REFERENCES prodotti(id)," +
                    "FOREIGN KEY(id_cliente) REFERENCES clienti(id)" +
                    ");";

            Statement stmt = conn.createStatement();
            stmt.execute(sqlCreaTabellaProdotti);
            stmt.execute(sqlCreaTabellaCategorie);
            stmt.execute(sqlCreaTabellaAcquisti);

            System.out.println("Tabelle create con successo.");

        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
    }
}