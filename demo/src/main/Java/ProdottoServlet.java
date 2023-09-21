
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager; // Importa DriverManager da java.sql
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.InputStream;
import java.nio.file.Paths;
import java.io.File;

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
        String idDaFrontEnd = request.getParameter("id");
        String azioneDaFrontEnd = request.getParameter("azione");
        String raritaDaFrontEnd = request.getParameter("Rarità");
        String prezzoDaFrontEnd = request.getParameter("Prezzo");
        String condizioneDaFrontEnd = request.getParameter("Condizione");
        String gradazioneDaFrontEnd = request.getParameter("Gradazione");
        String linguaDaFrontEnd = request.getParameter("Lingua");
        String ordineDaFrontEnd = request.getParameter("OrdinePrezzo");

        if ("elimina".equals(azioneDaFrontEnd) && idDaFrontEnd != null) {
            prodottoDAO.eliminaProdotto(Integer.parseInt(idDaFrontEnd));
        }

        List<Prodotto> prodottiFiltrati = prodottoDAO.getProdottiByFilter(prodotti2, raritaDaFrontEnd, prezzoDaFrontEnd,
                condizioneDaFrontEnd, gradazioneDaFrontEnd, linguaDaFrontEnd, ordineDaFrontEnd);
        request.setAttribute("prodotti", prodottiFiltrati);

        RequestDispatcher dispatcher = request.getRequestDispatcher("prodotti.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println(request.getPart("fileUpload"));
        System.out.println(request.getParameter("NomeDaInserire"));
        String nomeDaInserireDaFrontEnd = request.getParameter("NomeDaInserire");
        String raritaDaInserireDaFrontEnd = request.getParameter("RaritaDaInserire");
        String prezzoDaInserireDaFrontEnd = request.getParameter("PrezzoDaInserire");
        String condizioneDaInserireDaFrontEnd = request.getParameter("CondizioneDaInserire");
        String gradazioneDaInserireDaFrontEnd = request.getParameter("GradazioneDaInserire");
        String linguaDaInserireDaFrontEnd = request.getParameter("LinguaDaInserire");
        String cartaScambabileDaInserireDaFrontEnd = request.getParameter("scambiabileDaInserire");

        Double prezzoDaInserireDaFrontEndDouble = Double.parseDouble(prezzoDaInserireDaFrontEnd);
        Double gradazioneDaInserireDaFrontEndDouble = Double.parseDouble(gradazioneDaInserireDaFrontEnd);
        Boolean cartaScambabileDaInserireDaFrontEndBoolean = Boolean.parseBoolean(cartaScambabileDaInserireDaFrontEnd);

        Prodotto prodottoDaInserire = new Prodotto();
        prodottoDaInserire.setNome(nomeDaInserireDaFrontEnd);

        prodottoDaInserire.setRarita(raritaDaInserireDaFrontEnd);
        prodottoDaInserire.setPrezzo(prezzoDaInserireDaFrontEndDouble);
        prodottoDaInserire.setScambiabile(cartaScambabileDaInserireDaFrontEndBoolean);
        prodottoDaInserire.setCondizione(condizioneDaInserireDaFrontEnd);
        prodottoDaInserire.setGradazione(gradazioneDaInserireDaFrontEndDouble);
        prodottoDaInserire.setLingua(linguaDaInserireDaFrontEnd);

        // Directory in cui salvare le immagini
        String uploadDirectory = "C:\\Users\\Java\\Documents\\java-Local\\ProgettoFinale\\demo\\src\\main\\webapp\\ImmaginiProdotti";

        Part filePart = request.getPart("fileUpload"); // "file" è il nome del campo nel modulo HTML
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Crea un percorso per il file
        String filePath = uploadDirectory + File.separator + fileName;
        // String filePath = uploadDirectory + "/" + fileName;

        // Scrivi il file su disco
        try (InputStream fileContent = filePart.getInputStream();
                OutputStream os = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        }

        // Ora hai il percorso del file che puoi memorizzare nel database
        // String imagePath = "/uploaded/images/" + fileName; // Ad esempio, salva solo
        // il percorso relativo

        // String imagePath = filePath; // Ad esempio, salva solo il percorso relativo
        String percorsoRelativo = "ImmaginiProdotti" + "/" + fileName;

        // prodottoDaInserire.setImmagine("ciaoaoaoao");
        // Salva "imagePath" nel database
        // prodottoDaInserire.setImmagine(imagePath);

        prodottoDaInserire.setImmagine(percorsoRelativo);
        // Puoi anche restituire una conferma all'utente
        response.getWriter().write("Caricamento completato.");

        prodottoDAO.inserisciProdotto(prodottoDaInserire);

        response.sendRedirect("prodotti");
    }
}