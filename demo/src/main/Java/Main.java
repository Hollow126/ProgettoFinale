import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.println("ciaoZio");
        try (Connection conn = DriverManager.getConnection("jdbc:sqlite:orders.db")) {
            for (int i = 1; i <= 10; i++) {
                // Dati del prodotto
                String nomeProdotto = "Prodotto " + i;
                double prezzoProdotto = 10.0 * i;

                // Query di inserimento
                String insertSQL = "INSERT INTO prodotti (nome, prezzo) VALUES (?, ?)";

                // Prepara la dichiarazione SQL con parametri
                PreparedStatement preparedStatement = conn.prepareStatement(insertSQL);
                preparedStatement.setString(1, nomeProdotto);
                preparedStatement.setDouble(2, prezzoProdotto);

                // Esegui la query di inserimento
                preparedStatement.executeUpdate();

                System.out.println("Prodotto inserito con successo: " + nomeProdotto);
            }

            ProdottoDAO prodottoDAO = new ProdottoDAO(conn);

            // Stampa tutti i prodotti
            List<Prodotto> prodotti = prodottoDAO.getAllProdotti();
            System.out.println("Prodotti:");
            for (Prodotto p : prodotti) {
                System.out.println(p.getId() + ": " + p.getNome_Prodotto() + " (" + p.getPrezzo() + ")");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
