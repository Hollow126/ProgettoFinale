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

        // ottiene i dati dei parametri dei filtri
        List<Prodotto> prodotti2 = prodottoDAO.getAllProdotti();
        String raritaDaFrontEnd = request.getParameter("Rarità");
        String prezzoDaFrontEnd = request.getParameter("Prezzo");
        String condizioneDaFrontEnd = request.getParameter("Condizione");
        String gradazioneDaFrontEnd = request.getParameter("Gradazione");
        String linguaDaFrontEnd = request.getParameter("Lingua");

        // double gradazioneDaFrontEndDouble = Double.parseDouble(gradazioneDaFrontEnd);
        List<Prodotto> prodottiFiltrati = prodottoDAO.getProdottiByFilter(prodotti2, raritaDaFrontEnd, prezzoDaFrontEnd,
                condizioneDaFrontEnd, gradazioneDaFrontEnd,linguaDaFrontEnd);
        request.setAttribute("prodotti", prodottiFiltrati);

        // if (prezzoDaFrontEnd != "noPrezzo" || raritaDaFrontEnd != "noRarita" ||
        // condizioneDaFrontEnd != "noCondizione" || gradazioneDaFrontEnd !=
        // "noGradazione") {
        // double gradazioneDaFrontEndDouble = Double.parseDouble(gradazioneDaFrontEnd);
        // List<Prodotto> prodottiFiltrati = prodottoDAO.getProdottiByFilter(prodotti,
        // raritaDaFrontEnd,prezzoDaFrontEnd,condizioneDaFrontEnd,gradazioneDaFrontEndDouble);
        // request.setAttribute("prodotti", prodottiFiltrati);
        // }

        RequestDispatcher dispatcher = request.getRequestDispatcher("prodotti.jsp");
        dispatcher.forward(request, response);
    }
}