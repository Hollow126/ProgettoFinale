import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager; // Importa DriverManager da java.sql
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

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
                String azione = request.getParameter("azione");

                if ("esporta_csv".equals(azione)) {
                    esportaProdottiInCSV(response);
                    return;
                }
            

                
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

        List<Prodotto> prodottiFiltrati = prodottoDAO.getProdottiByFilter(prodotti2, raritaDaFrontEnd, prezzoDaFrontEnd,
                condizioneDaFrontEnd, gradazioneDaFrontEnd,linguaDaFrontEnd);
        request.setAttribute("prodotti", prodottiFiltrati);

        RequestDispatcher dispatcher = request.getRequestDispatcher("prodotti.jsp");
        dispatcher.forward(request, response);
    }

    private void esportaProdottiInCSV(HttpServletResponse response) {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment;filename=prodotti.csv");
    
        try (PrintWriter writer = response.getWriter()) {
            writer.println("Titolo,Prezzo,Rarità,Condizione,Gradazione,Lingua");
    
            List<Prodotto> listaProdotti = prodottoDAO.getAllProdotti();
            for (Prodotto prodotto : listaProdotti) {
                writer.println(prodotto.getNome() + "," + prodotto.getPrezzo() + "," + prodotto.getRarita() + "," + prodotto.getCondizione() + "," + prodotto.getGradazione() + "," + prodotto.getLingua());
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}