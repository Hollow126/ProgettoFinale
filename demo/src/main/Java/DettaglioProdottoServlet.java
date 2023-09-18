import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager; // Importa DriverManager da java.sql
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class DettaglioProdottoServlet extends HttpServlet {

    private ProdottoDAO prodottoDAO2;

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
        prodottoDAO2 = new ProdottoDAO(conn);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idDelProdottoDiCuiSiVuoleIlDettaglio = request.getParameter("id");
        System.out.println(idDelProdottoDiCuiSiVuoleIlDettaglio);
        int idDelProdottoDiCuiSiVuoleIlDettaglioInt = Integer.parseInt(idDelProdottoDiCuiSiVuoleIlDettaglio);
        Prodotto p = prodottoDAO2.getProdottoById(idDelProdottoDiCuiSiVuoleIlDettaglioInt);
        request.setAttribute("prodotto", p);

        RequestDispatcher dispatcher = request.getRequestDispatcher("DettaglioProdotto.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idDaFrontEnd = Integer.parseInt(request.getParameter("id"));
        String nomeDaFrontEnd = request.getParameter("Nome");
        String raritaDaFrontEnd = request.getParameter("Rarità");
        double prezzoDaFrontEnd = Double.parseDouble(request.getParameter("Prezzo"));
        String condizioneDaFrontEnd = request.getParameter("Condizione");
        double gradazioneDaFrontEnd = Double.parseDouble(request.getParameter("Gradazione"));
        String linguaDaFrontEnd = request.getParameter("Lingua");

        Prodotto prodottoConNuoviDati = new Prodotto();
        prodottoConNuoviDati.setId(idDaFrontEnd);
        prodottoConNuoviDati.setNome(nomeDaFrontEnd);
        prodottoConNuoviDati.setRarita(raritaDaFrontEnd);
        prodottoConNuoviDati.setPrezzo(prezzoDaFrontEnd);
        prodottoConNuoviDati.setCondizione(condizioneDaFrontEnd);
        prodottoConNuoviDati.setGradazione(gradazioneDaFrontEnd);
        prodottoConNuoviDati.setLingua(linguaDaFrontEnd);

        // if (idDaFrontEnd == 0 || idDaFrontEnd.isEmpty()) {
        //     System.out.println("inserimento da fare");
        //     //clientiDAO.inserisciCliente(cliente);
        // } else {
            prodottoDAO2.modificaProdotto(prodottoConNuoviDati);
       // }

        response.sendRedirect("prodotti");
    }

}
