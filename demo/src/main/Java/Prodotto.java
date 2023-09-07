public class Prodotto {
    private int id;
    private String nome_Prodotto;
    private double prezzo;
    private int quantita;

    private enum gioco {
        Yugioh,
        Pokemon,
        Magic
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome_Prodotto() {
        return nome_Prodotto;
    }

    public void setNome_Prodotto(String nome_Prodotto) {
        this.nome_Prodotto = nome_Prodotto;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    };

}
