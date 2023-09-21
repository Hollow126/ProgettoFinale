import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.imageio.ImageIO;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

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
            String url = "jdbc:sqlite:prova2.db";
            // String url = "database.db";
            conn = DriverManager.getConnection(url);

            System.out.println("Connessione a SQLite stabilita.");
            // Creo le tabelle
            String sqlCreaTabellaProdotti = "CREATE TABLE IF NOT EXISTS prodotti (" +
                    "id INTEGER PRIMARY KEY," +
                    "nome TEXT NOT NULL," +
                    "prezzo REAL NOT NULL," +
                    "immagine STRING NOT NULL," +
                    "scambiabile BOOLEAN NOT NULL," +
                    "rarita STRING NOT NULL," +
                    "condizione String NOT NULL," +
                    "gradazione tinydouble CONSTRAINT gradazione_CheckLimit CHECK (gradazione BETWEEN 1 AND 10)," +
                    "lingua String NOT NULL," +
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

            // Sample data
            String[] nomi = { "Prodotto 1", "Prodotto 2", "Prodotto 3", "Prodotto 4" };
            double[] prezzi = { 9.99, 14.99, 19.99, 24.99 };
            String[] immagini = { "ImmaginiProdotti/images1.jpg", "ImmaginiProdotti/images1.jpg",
                    "ImmaginiProdotti/images1.jpg", "ImmaginiProdotti/images1.jpg" };
            boolean[] scambiabili = { true, false, true, false };
            String[] rarita = { "Comune", "Rara", "Leggendaria", "Rara" };
            String[] condizioni = { "Played", "Good", "Near Mint", "Mint" };
            double[] gradazioni = { 8.5, 8.0, 9.5, 9.0 };
            String[] lingue = { "ITA", "JPN", "ENG", "GER" };

            int[] idCategorie2 = { 1, 2, 1, 3 };

            try {

                // SQL INSERT statement
                String insertSQL = "INSERT INTO prodotti (nome, prezzo, immagine, scambiabile, rarita, condizione, gradazione, lingua,id_categoria) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";

                // Create a PreparedStatement
                PreparedStatement preparedStatement = conn.prepareStatement(insertSQL);

                // Loop through the sample data and execute the INSERT statement
                for (int i = 0; i < nomi.length; i++) {
                    preparedStatement.setString(1, nomi[i]);
                    preparedStatement.setDouble(2, prezzi[i]);
                    preparedStatement.setString(3, immagini[i]);
                    preparedStatement.setBoolean(4, scambiabili[i]);
                    preparedStatement.setString(5, rarita[i]);
                    preparedStatement.setString(6, condizioni[i]);
                    preparedStatement.setDouble(7, gradazioni[i]);
                    preparedStatement.setString(8, lingue[i]);
                    preparedStatement.setInt(9, idCategorie2[i]);

                    // Execute the INSERT statement
                    preparedStatement.executeUpdate();
                }

                // Close the PreparedStatement and the database connection
                preparedStatement.close();

                System.out.println("Sample data inserted successfully!");

            } catch (SQLException e) {
                e.printStackTrace();
            }

            try (Connection conn2 = DriverManager.getConnection(url)) {
                if (conn2 != null) {
                    System.out.println("Connessione al database stabilita.");

                    // Dati di esempio
                    String[] nomiProdotti = {
                            "Prodotto1",
                            "Prodotto2",
                            "Prodotto3",
                            "Prodotto4",
                            "Prodotto5",
                            "Prodotto6",
                            "Prodotto7",
                            "Prodotto8",
                            "Prodotto9",
                            "Prodotto10"
                    };
                    double[] prezziProdotti = {
                            19.99,
                            29.99,
                            9.99,
                            14.99,
                            39.99,
                            49.99,
                            24.99,
                            7.99,
                            15.99,
                            12.99
                    };
                    // TODO modificare mettendo url relativo e non assoluto, modificare anche nel
                    // metodo.
                    String directoryPath = "C:\\Users\\Java\\Documents\\java-Local\\ProgettoFinale\\demo\\src\\main\\webapp\\ImmaginiProdotti";
                    String[] percorsiImmagini = ottieniPercorsiDeiFile(directoryPath);
                    boolean[] scambiabilitaProdotti = {
                        true,
                        false,
                        true,
                        false,
                        true,
                        true,
                        false,
                        true,
                        false,
                        true
                    };
                    String[] raritaProdotti = {
                            "Comune",
                            "Rara",
                            "Comune",
                            "Rara",
                            "Leggendaria",
                            "Comune",
                            "Rara",
                            "Comune",
                            "Comune",
                            "Rara"
                    };
                    String[] condizioneProdotti = {
                            "Played",
                            "Good",
                            "Mint",
                            "Mint",
                            "Near Mint",
                            "Mint",
                            "Played",
                            "Good",
                            "Mint",
                            "Near Mint"
                    };
                    double[] gradazioneProdotti = {
                            7.5,
                            9.0,
                            9.5,
                            8.0,
                            10.0,
                            9.5,
                            8.0,
                            9.5,
                            9.5,
                            10.0
                    };
                    int[] idCategorie = {
                            1,
                            2,
                            1,
                            3,
                            2,
                            3,
                            1,
                            2,
                            3,
                            1
                    };
                    String[] lingueProdotti = {
                            "ITA",
                            "JPN",
                            "ENG",
                            "GER",
                            "ITA",
                            "JPN",
                            "ENG",
                            "GER",
                            "JPN",
                            "JPN"
                    };

                    // Prepara l'istruzione SQL per l'inserimento
                    String sqlInserimento2 = "INSERT INTO prodotti (nome, prezzo, immagine, scambiabile, rarita, condizione, gradazione,lingua, id_categoria) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement pstmt2 = conn.prepareStatement(sqlInserimento2);

                    for (int i = 0; i < nomiProdotti.length; i++) {
                        pstmt2.setString(1, nomiProdotti[i]);
                        pstmt2.setDouble(2, prezziProdotti[i]);
                        pstmt2.setString(3, percorsiImmagini[i]);
                        pstmt2.setBoolean(4, scambiabilitaProdotti[i]);
                        pstmt2.setString(5, raritaProdotti[i]);
                        pstmt2.setString(6, condizioneProdotti[i]);
                        pstmt2.setDouble(7, gradazioneProdotti[i]);
                        pstmt2.setString(8, lingueProdotti[i]);
                        pstmt2.setInt(9, idCategorie[i]);
                        pstmt2.executeUpdate();
                    }

                    System.out.println("Dati di esempio inseriti con successo.");
                    conn.close();
                }
            } catch (SQLException e) {
                System.err.println("Errore durante l'inserimento dei dati di esempio: " + e.getMessage());
            }

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

    public static String[] ottieniPercorsiDeiFile(String directoryPath) {
        File directory = new File(directoryPath);

        if (!directory.isDirectory()) {
            System.err.println("Il percorso specificato non è una cartella.");
            return null;
        }

        File[] elencoFile = directory.listFiles();
        if (elencoFile == null || elencoFile.length == 0) {
            System.out.println("La cartella è vuota.");
            return null;
        }

        String[] percorsiDeiFile = new String[elencoFile.length];
        for (int i = 0; i < elencoFile.length; i++) {
            percorsiDeiFile[i] = elencoFile[i].getPath();

            // Sostituisci ogni "\\" con "/"
            percorsiDeiFile[i] = percorsiDeiFile[i]
                    .replace("C:\\Users\\Java\\Documents\\java-Local\\ProgettoFinale\\demo\\src\\main\\webapp\\", "");
        }

        return percorsiDeiFile;
    }
}