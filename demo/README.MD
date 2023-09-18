## The  black Market 

## Scopo Progetto 
Lo scopo iniziale del progetto consisteva nel creare un sito di trading di carte online, dove i vari utenti potevano caricare e vendere le loro carte. 
dividendo il sito in 2 principali parti, la prima consisteva nella visualizzazione del catalogo delle carte da oarte di un utente non loggato; 
la seconda, la visualizzazione da parte di un utente loggato, il quale poteva aggiungere, eliminare e modificare i dettagli delle carte

## La pagina prodotti
la pagina prodotti.jsp rappresenta l'index del nostro sito, al suo interno sono contenute la navBar ed il footer, che sono stati presi da degli altri file, chiamati rispettivamente 
NavBar.jsp e Footer.jsp che vengono inclusi nel file. 
sotto la Navbar vi sono contenuti la barra dei filtri per i prodotti e la lista dei prodotti, che compongono la parte principale della pagina: 

i prodotti vengono visualizzati tramite un ciclo, per il quale per ogni elemento del Database, crea una carta con annesse caratteristiche prese dal Database 

                  <div class="row">
                        <c:forEach var="prodotto" items="${prodotti}">
                            <div class=" col-lg-3 col-md-4 col-sm-6 mb-3" id="div-carte">
                                <div class="card text-center h-100 bg-light border-0">
                                    <c:url var="urlGenerato" value="/DettaglioProdotto">
                                        <c:param name="id" value="${prodotto.id}" />
                                    </c:url>
                                    <div id="image-container">
                                        <a href="${urlGenerato}">
                                            <img class="card-img-top mh-100" id="image" src="${prodotto.immagine} "
                                                alt="${prodotto.nome}">
                                        </a>
                                    </div>
                                    <div class="card-body">
                                        <h4 class="card-title">${prodotto.nome}</h4>
                                        <p class="card-text">
                                        <div class="row">

                                            <div class="col">${prodotto.prezzo}</div>
                                            <div class="col">${prodotto.rarita}</div>
                                            <div class="col"> ${prodotto.condizione} </div>
                                            <div class="col"> ${prodotto.gradazione} </div>
                                            <div class="col"> ${prodotto.lingua} </div>
                                            <a href="${urlGenerato}">Vai alla pagina</a>
                                        </div>
                                        </p>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                    </div>
                    
Oltre ciò, viene fatto in modo che tramite l'incapsulamento dell'immaggine all'interno del Tag A, quando essa viene cliccata, porta alla pagina del dettaglio del prodotto che viene cliccato (grazie al tag c:url)


Al momento ci stiamo concentrando Sulla Tabella Prodotti è stata modificata; adesso contiene i campi
- id : Id univoco del prodotto 
- nome : Il nome della carta
- prezzo : il prezzo del prodotto 
- immagine : l'immagine della carta 
- rarita : la rarita della carta (es: comune, rara, ultra, leggendaria ecc ecc)
- condizione  : la condizione di utilizzo della carta (es : mint, near mint, good ecc ecc)
- Gradazione : la valutazione di Gradazione rilasciata da Psa, min 1 max 10 
- ID-Categoria : il gioco al quale appartiene la carta (es Yu-Gi-Oh, Pokemon, Magic ECC ECC  )

al momento le tabelle clienti e acquisti non sono state toccate, ma verranno modificate in futuro