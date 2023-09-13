import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // try (Connection conn = DriverManager.getConnection("jdbc:sqlite:.db")) {
        try (Connection conn = DriverManager.getConnection("jdbc:sqlite:prova2.db")) {
            ProdottoDAO prodottoDAO = new ProdottoDAO(conn);
            ClienteDAO clienteDAO = new ClienteDAO(conn);
            AcquistoDAO acquistoDAO = new AcquistoDAO(conn);

            // Stampa tutti i prodotti
            List<Prodotto> prodotti = prodottoDAO.getAllProdotti();
            // System.out.println("Prodotti:");
            // for (Prodotto p : prodotti) {
            //     System.out.println(p.getId() + ": " + p.getNome() + " (" + p.getPrezzo() + ")");
            // }

            String rarita = "Rara";
            String prezzo = "29.99";
            String condizione = "Good";
            String gradazione = "9.0";
            System.out.println(prodotti);

            List<Prodotto> prodottiFiltrati = prodottoDAO.getProdottiByFilter(prodotti, rarita, prezzo, condizione,
                    gradazione);
                    System.out.println("i prodotti filtrati sono " + prodottiFiltrati);
            // Stampa tutti i clienti
            // List<Cliente> clienti = clienteDAO.getAllClienti();
            // System.out.println("\nClienti:");
            // for (Cliente c : clienti) {
            // System.out.println(c.getId() + ": " + c.getNome() + " (" + c.getEmail() +
            // ")");
            // }

            // // Stampa tutti gli acquisti
            // List<Acquisto> acquisti = acquistoDAO.getAllAcquisti();
            // System.out.println("\nAcquisti:");
            // for (Acquisto a : acquisti) {
            // System.out.println(a.getId() + ": Prodotto " + a.getIdProdotto() + ", Cliente
            // " + a.getIdCliente()
            // + ", Data " + a.getDataAcquisto());
            // }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}