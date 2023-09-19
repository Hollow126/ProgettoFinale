import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Collections;

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
                p.setLingua(rs.getString("lingua"));
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
                    p.setImmagine(rs.getString("immagine"));
                    p.setRarita(rs.getString("rarita"));
                    p.setCondizione(rs.getString("condizione"));
                    p.setGradazione(rs.getDouble("gradazione"));
                    p.setLingua(rs.getString("lingua"));
                    p.setId_Categoria(rs.getInt("Id_Categoria"));
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
            String condizione, String gradazione, String lingua, String ordinePrezzo) {

        List<Prodotto> prodottiFiltrati = new ArrayList<>();
        String sql = "SELECT * FROM prodotti ";
        System.out.println("L'ORDINE PREZZO e " + ordinePrezzo);
        int indice = 0;
        if (rarita != null && !rarita.isEmpty()) {
            if (indice >= 1) {
                sql = sql + " AND rarita = " + "'" + rarita + "'";
            } else {
                sql = sql + " WHERE rarita = " + "'" + rarita + "'";
            }
            indice++;
        }
        if (prezzo != null && !prezzo.isEmpty()) {
            if (indice >= 1) {
                sql = sql + " AND prezzo =" + prezzo;
            } else {
                sql = sql + " WHERE prezzo = " + prezzo;
            }
            indice++;

        }
        if (condizione != null && !condizione.isEmpty()) {
            if (indice >= 1) {
                sql = sql + " AND condizione = " + "'" + condizione + "'";
            } else {
                sql = sql + " WHERE condizione = " + "'" + condizione + "'";
            }
            indice++;

        }
        if (gradazione != null && !gradazione.isEmpty()) {
            if (indice >= 1) {
                sql = sql + " AND gradazione = " + gradazione;
            } else {
                sql = sql + " WHERE gradazione = " + gradazione;
            }
            indice++;

        }
        if (lingua != null && !lingua.isEmpty()) {
            if (indice >= 1) {
                sql = sql + " AND lingua = " + "'" + lingua + "'";
            } else {
                sql = sql + " WHERE lingua = " + "'" + lingua + "'";
            }
            indice++;
        }
        if (ordinePrezzo != null && !ordinePrezzo.isEmpty()) {
            // dal più caro al meno caro
            if (ordinePrezzo.equals("1")) {
                sql = sql + " ORDER BY prezzo DESC";
                for (Prodotto prodotto : prodottiFiltrati) {
                    System.out.println(prodotto);
                }
            }
            // dal meno caro al più caro
            else if (ordinePrezzo.equals("2")) {
                sql = sql + " ORDER BY prezzo ASC";
                for (Prodotto prodotto : prodottiFiltrati) {
                    System.out.println(prodotto);
                }
            }
        }
        System.out.println(sql);
        try (Statement stmt = conn.createStatement();) {
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
                p.setLingua(rs.getString("lingua"));
                p.setId_Categoria(rs.getInt("Id_Categoria"));
                prodottiFiltrati.add(p);
            }

        } catch (SQLException e) {
            // gestisci l'eccezione
            e.printStackTrace();
        }
        return prodottiFiltrati;
    }

    public void modificaProdotto(Prodotto prodotto) {
        String sql = "UPDATE prodotti SET nome = ?,  prezzo = ?, rarita = ?, condizione = ?, gradazione = ?, lingua = ? WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, prodotto.getNome());
            pstmt.setDouble(2, prodotto.getPrezzo());
            pstmt.setString(3, prodotto.getRarita());
            pstmt.setString(4, prodotto.getCondizione());
            pstmt.setDouble(5, prodotto.getGradazione());
            pstmt.setString(6, prodotto.getLingua());
            pstmt.setInt(7, prodotto.getId());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void eliminaProdotto(int id) {
        String sql = "DELETE FROM prodotti WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}