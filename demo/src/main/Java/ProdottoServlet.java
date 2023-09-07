import java.sql.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;

public class ProdottoServlet extends HttpServlet {
    private ProdottoDAO prodottoDAO;

    public void init() {
        String url = "jdbc:sqlite:orders.db";
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Prodotto> prodotti = prodottoDAO.getAllProdotti();
        request.setAttribute("prodotti", prodotti);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}