
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TuoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recupera i valori dei campi di input
        String prezzoStr = request.getParameter("prezzo");
        String rarita = request.getParameter("rarita");
        String condizione = request.getParameter("condizione");
        String gradazioneStr = request.getParameter("gradazione");

        // Converte i valori in tipi appropriati (double per prezzo e gradazione)
        double prezzo = Double.parseDouble(prezzoStr);
        double gradazione = Double.parseDouble(gradazioneStr);

        // Esegui la query nel database con i criteri di filtro
        // Utilizza i valori prezzo, rarita, condizione e gradazione nella query
        // ...

        // Dopo aver ottenuto i risultati, puoi passarli alla nuova pagina JSP
        int risultatiFiltrati = 0;
        request.setAttribute("risultatiFiltrati", risultatiFiltrati); // Usa un nome appropriato per l'attributo
        RequestDispatcher dispatcher = request.getRequestDispatcher("/paginaRisultati.jsp");
        dispatcher.forward(request, response);
    }
}
