
public class Prodotto {
    private int id;
    private String nome;
    private double prezzo;
    private String immagine;
    private boolean scambiabile;
    private String rarita;
    private String condizione;
    private double gradazione;
    private int id_categoria;
    private String lingua;

    public Prodotto() {

    }

    public Prodotto(int id, String nome, double prezzo, String immagine, boolean isScambiabile, String rarita,
            String condizione,
            double gradazione, String lingua, int id_categoria) {
        this.id = id;
        this.nome = nome;
        this.prezzo = prezzo;
        this.immagine = immagine;
        this.scambiabile = isScambiabile;
        this.rarita = rarita;
        this.condizione = condizione;
        this.gradazione = gradazione;
        this.lingua = lingua;
        this.id_categoria = id_categoria;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public String getImmagine() {
        return immagine;
    }

    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }

    public boolean isScambiabile() {
        return scambiabile;
    }

    public void setScambiabile(boolean isScambiabile) {
        this.scambiabile = isScambiabile;
    }

    public String getRarita() {
        return rarita;
    }

    public void setRarita(String rarita) {
        this.rarita = rarita;
    }

    public String getCondizione() {
        return condizione;
    }

    public void setCondizione(String condizione) {
        this.condizione = condizione;
    }

    public double getGradazione() {
        return gradazione;
    }

    public void setGradazione(double gradazione) {
        this.gradazione = gradazione;
    }

    public int getId_Categoria() {
        return id_categoria;
    }

    public void setId_Categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getLingua() {
        return lingua;
    }

    public void setLingua(String lingua) {
        this.lingua = lingua;
    }
}