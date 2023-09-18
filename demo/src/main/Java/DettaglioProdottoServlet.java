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
    throws ServletException, IOException{
        String dettaglioProdotto = request.getParameter("id");
        System.out.println(dettaglioProdotto);
        int dettaglioProdottoInt = Integer.parseInt(dettaglioProdotto);
        Prodotto p = prodottoDAO2.getProdottoById(dettaglioProdottoInt);
        request.setAttribute("prodotto", p);

        RequestDispatcher dispatcher = request.getRequestDispatcher("DettaglioProdotto.jsp");
        dispatcher.forward(request, response);
    }
}
