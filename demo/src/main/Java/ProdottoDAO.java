import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProdottoDAO {

    private Connection conn;

    public ProdottoDAO(Connection conn) {
        this.conn = conn;
    }

    public List<Prodotto> getAllProdotti() {
        List<Prodotto> prodotti = new ArrayList<>();

        try (Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM prodotti")) {

            while (rs.next()) {
                Prodotto p = new Prodotto();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setPrezzo(rs.getDouble("prezzo"));
                p.setImmagine(rs.getString("immagine"));
                p.setRarita(rs.getString("rarita"));
                p.setCondizione(rs.getString("condizione"));
                p.setGradazione(rs.getDouble("gradazione"));
                p.setId_Categoria(rs.getInt("Id_Categoria"));
                prodotti.add(p);
            }

        } catch (SQLException e) {
            // gestisci l'eccezione
            e.printStackTrace();
        }

        return prodotti;
    }

    public Prodotto getProdottoById(int id) {
        Prodotto p = null;

        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM prodotti WHERE id = ?")) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {
                    p = new Prodotto();
                    p.setId(rs.getInt("id"));
                    p.setNome(rs.getString("nome"));
                    p.setPrezzo(rs.getDouble("prezzo"));
                }

            }

        } catch (SQLException e) {
            // gestisci l'eccezione
            e.printStackTrace();
        }

        return p;
    }

    public void insertProdotto(Prodotto p) {
        try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO prodotti (nome, prezzo) VALUES (?, ?)")) {

            stmt.setString(1, p.getNome());
            stmt.setDouble(2, p.getPrezzo());
            stmt.executeUpdate();

        } catch (SQLException e) {
            // gestisci l'eccezione
            e.printStackTrace();
        }
    }

    // public List<Prodotto> getProdottiByFilter(double gradazione) {

    // List<Prodotto> prodottiFiltrati = new ArrayList<>();
    // String sql = "SELECT * FROM prodotti WHERE gradazione = ?";

    // try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
    // pstmt.setDouble(1, gradazione);

    // try (ResultSet rs = pstmt.executeQuery()) {
    // while (rs.next()) {
    // Prodotto p = new Prodotto();
    // p.setId(rs.getInt("id"));
    // p.setNome(rs.getString("nome"));
    // p.setPrezzo(rs.getDouble("prezzo"));
    // p.setImmagine(rs.getString("immagine"));
    // p.setRarita(rs.getString("rarita"));
    // p.setCondizione(rs.getString("condizione"));
    // p.setGradazione(rs.getDouble("gradazione"));
    // p.setId_Categoria(rs.getInt("Id_Categoria"));

    // prodottiFiltrati.add(p);
    // }
    // }
    // } catch (Exception e) {
    // e.printStackTrace();
    // // Gestisci eccezioni
    // }
    // return prodottiFiltrati;
    // }
    public List<Prodotto> getProdottiByFilter(List<Prodotto> allProdotti, String rarita, String prezzo,
            String condizione, String gradazione) {

        List<Prodotto> prodottiFiltrati = new ArrayList<>();

        for (Prodotto prodotto : allProdotti) {

            String prezzoString = Double.toString(prodotto.getPrezzo());
            String gradazioneString = Double.toString(prodotto.getGradazione());
            System.out.println("id = " + prodotto.getId());
            System.out.println("valore da front = " + gradazione + " valore db = "
                    + Double.toString(prodotto.getGradazione()));
            System.out.println(
                    "valore da front = " + prezzo + " valore db = " + Double.toString(prodotto.getPrezzo()));
            System.out.println("valore da front = " + rarita + " valore db = " + prodotto.getRarita());
            System.out.println("valore da front = " + condizione + " valore db = " + prodotto.getCondizione() + "\n");

            if ((rarita == null || prodotto.getRarita().equals(rarita)) &&
                    (prezzo == null || prezzoString.equals(prezzo)) &&
                    (condizione == null || prodotto.getCondizione().equals(condizione)) &&
                    (gradazione == null || gradazioneString.equals(gradazione))) {
                        System.out.println("prodotto Aggiunto");
                prodottiFiltrati.add(prodotto);
            }
        }
        return prodottiFiltrati;
    }
}