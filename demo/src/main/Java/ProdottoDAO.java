import java.util.List;
import java.util.ArrayList;
import java.sql.*;


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
                prodotti.add(p);
            }
        } catch (SQLException e) {
            // gestisci l'eccezione
            e.printStackTrace();
        }

        return prodotti;
    }
}