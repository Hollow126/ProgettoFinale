import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager; // Importa DriverManager da java.sql
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

public class ProdottoServlet extends HttpServlet {
    private ProdottoDAO prodottoDAO;

    public void init() {
        // String url = "jdbc:sqlite:database.db";
        String url = "jdbc:sqlite:prova2.db";

        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Errore durante la connessione al database.", e);
        }
        prodottoDAO = new ProdottoDAO(conn);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Prodotto> prodotti = prodottoDAO.getAllProdotti();
        request.setAttribute("prodotti", prodotti);

        // Gestisci i filtri se sono stati applicati
        String prezzoStr = request.getParameter("prezzo");
        if (prezzoStr != null && !prezzoStr.isEmpty()) {
            double prezzoDouble = Double.parseDouble(prezzoStr);
            List<Prodotto> prodottiFiltrati = prodottoDAO.getProdottiByPrezzo(prezzoDouble);
            request.setAttribute("prodotti", prodottiFiltrati);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("prodotti.jsp");
        dispatcher.forward(request, response);
    }
}