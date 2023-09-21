import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager; // Importa DriverManager da java.sql
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class DettaglioProdottoServlet extends HttpServlet {

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
        String idDelProdottoDiCuiSiVuoleIlDettaglio = request.getParameter("id");
        System.out.println(idDelProdottoDiCuiSiVuoleIlDettaglio);
        int idDelProdottoDiCuiSiVuoleIlDettaglioInt = Integer.parseInt(idDelProdottoDiCuiSiVuoleIlDettaglio);
        Prodotto p = prodottoDAO.getProdottoById(idDelProdottoDiCuiSiVuoleIlDettaglioInt);
        request.setAttribute("prodotto", p);

        RequestDispatcher dispatcher = request.getRequestDispatcher("DettaglioProdotto.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idDaFrontEnd = Integer.parseInt(request.getParameter("id"));
        String nomeDaFrontEnd = request.getParameter("Nome");
        double prezzoDaFrontEnd = Double.parseDouble(request.getParameter("Prezzo"));
        boolean scambiabileDaModificareDaFrontEnd = Boolean.parseBoolean(request.getParameter("ScambiabileDaModificare"));
        String raritaDaFrontEnd = request.getParameter("Rarità");
        String condizioneDaFrontEnd = request.getParameter("Condizione");
        double gradazioneDaFrontEnd = Double.parseDouble(request.getParameter("Gradazione"));
        String linguaDaFrontEnd = request.getParameter("Lingua");

        Prodotto prodottoConNuoviDati = new Prodotto();
        prodottoConNuoviDati.setId(idDaFrontEnd);
        prodottoConNuoviDati.setNome(nomeDaFrontEnd);
        prodottoConNuoviDati.setPrezzo(prezzoDaFrontEnd);
        prodottoConNuoviDati.setScambiabile(scambiabileDaModificareDaFrontEnd);
        prodottoConNuoviDati.setRarita(raritaDaFrontEnd);
        prodottoConNuoviDati.setCondizione(condizioneDaFrontEnd);
        prodottoConNuoviDati.setGradazione(gradazioneDaFrontEnd);
        prodottoConNuoviDati.setLingua(linguaDaFrontEnd);
        prodottoDAO.modificaProdotto(prodottoConNuoviDati);

        response.sendRedirect("prodotti");
    }

}
