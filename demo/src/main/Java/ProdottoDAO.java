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

    public List<Prodotto> getProdottiByFilter(List<Prodotto> allProdotti, String rarita, String prezzo,
            String condizione, String gradazione) {

        List<Prodotto> prodottiFiltrati = new ArrayList<>();
        String sql = "SELECT * FROM prodotti ";
        System.out.println("il valore della rarita ; " + rarita);
        int indice = 0;
        if (rarita != null && !rarita.isEmpty() && indice <= 4) {
            if (indice >= 1) {
                sql = sql + " AND rarita = " + "'" + rarita + "'";
            } else {
                sql = sql + " WHERE rarita = " + "'" + rarita + "'";
            }
            indice++;
        }
        if (prezzo != null && !prezzo.isEmpty() && indice <= 4) {
            if (indice >= 1) {
                sql = sql + " AND prezzo = " + prezzo;
            } else {
                sql = sql + " WHERE prezzo = " + prezzo;
            }
            indice++;

        }
        if (condizione != null && !condizione.isEmpty() && indice <= 4) {
            if (indice >= 1) {
                sql = sql + " AND condizione = " + "'" + condizione + "'";
            } else {
                sql = sql + " WHERE condizione = " + "'" + condizione + "'";
            }
            indice++;

        }
        if (gradazione != null && !gradazione.isEmpty() && indice <= 4) {
            if (indice >= 1) {
                sql = sql + " AND gradazione = " + gradazione;
            } else {
                sql = sql + " WHERE gradazione = " + gradazione;
            }
            indice++;

        }
        System.out.println(sql);
        try (Statement stmt = conn.createStatement();) {

            // for (String stringa : arrayDiStringhe) {
            // sql = sql + stringa;
            // System.out.println(sql);
            // }
            // sql = sql + ";";

            ResultSet rs = stmt.executeQuery(sql);
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
                prodottiFiltrati.add(p);
            }

        } catch (SQLException e) {
            // gestisci l'eccezione
            e.printStackTrace();
        }
        return prodottiFiltrati;
    }
}