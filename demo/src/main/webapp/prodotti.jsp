<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ page isELIgnored="false" %>

            <!doctype html>
            <html lang="en">

            <head>
                <link rel="icon" href="img/icons8-pokeball-48.png" type="img/img" />
                <title>HomePage
                </title>
                <!-- Required meta tags -->
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                    crossorigin="anonymous">
                <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/all.css" />
                <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-solid.css" />
                <link rel="stylesheet"
                    href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-regular.css" />
                <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-light.css" />

                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Oswald&family=Roboto+Slab&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="style.css">

            </head>

            <body class="container bg-light">
                <jsp:include page="Navbar.jsp" />
                <div class="row">
                    <form class="d-flex flex-shrink-1 mt-3">
                    
                        <input class="form-control me-2" type="text" placeholder="Search">
                        <button class="btn btn-light" type="button"><img src="img/icons8-pokeball-48.png"
                            class="bg-light;"></button>
                        
                      </form>
                    <div class="col-sm-2">
                        <form action="/prodotti" method="get">
                            <label for="Rarità">Rarità:</label>
                            <select name="Rarità" id="Rarità">
                                <option value="">qualsiasi</option>
                                <option value="Comune">Comune</option>
                                <option value="Rara">Rara</option>
                                <option value="Leggendaria">Leggendaria</option>
                            </select>
                            <br><br>

                    </div>
                    <div class="col-sm-2">

                        <label for="Prezzo">Prezzo:</label>
                        <select name="Prezzo" id="Prezzo">
                            <option value=""></option>
                            <option value="9.99">9.99</option>
                            <option value="19.99">19.99</option>
                            <option value="29.99">29.99</option>

                        </select>
                        <br><br>
                    </div>
                    <div class="col-sm-2">

                        <label for="Condizione">Condizione:</label>
                        <select name="Condizione" id="Condizione">
                            <option value=""></option>
                            <option value="Played">Played</option>
                            <option value="Good">Good</option>
                            <option value="Near Mint">Near Mint</option>
                            <option value="Mint">Mint</option>
                        </select>
                        <br><br>

                    </div>
                    <div class="col-sm-2">

                        <label for="Gradazione">Gradazione:</label>
                        <select name="Gradazione" id="Gradazione">
                            <option value=""></option>
                            <option value="7.0">7</option>
                            <option value="7.5">7.5</option>
                            <option value="8.0">8</option>
                            <option value="8.5">8.5</option>
                            <option value="9.0">9</option>
                            <option value="9.5">9.5</option>
                            <option value="10.0">10</option>

                        </select>
                        <br><br>

                    </div>
                    <div class="col-sm-2">

                        <label for="Lingua">Lingua:</label>
                        <select name="Lingua" id="Lingua">
                            <option value=""></option>
                            <option value="ITA">ITA</option>
                            <option value="ENG">ENG</option>
                            <option value="ESP">ESP</option>
                            <option value="JPN">JPN</option>
                            <option value="GER">GER</option>
                        </select>
                        <br><br>


                    </div>
                    <div class="col-sm-2">

                        <label for="OrdinePrezzo:">Ordina per:</label>
                        <select name="OrdinePrezzo" id="OrdinePrezzo">
                            <option value=""></option>
                            <option value="PiuCaro">Dal più caro al Più Basso</option>
                            <option value="MenoCaro">dal meno caro al Più caro</option>
                        </select>
                        <br><br>



                    </div>
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-4 ">
                        <input type="submit" class="w-100" value="Applica">
                    </div>

                    <div class="col-sm-4">

                    </div>
                    </form>

                    <h1 class="text-center " style="color: #046db5;">Lista dei prodotti</h1>
                    <div class="row">


                        <c:forEach var="prodotto" items="${prodotti}">
                            <div class=" col-lg-3 col-md-4 col-sm-6 mb-3" id="div-carte">
                                <div class="card text-center h-100 bg-light border-0">
                                    <div id="image-container">
                                        <img class="card-img-top mh-100 category category_item" id="image" src="${prodotto.immagine}"
                                            alt="${prodotto.nome}">
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
                                            <!-- <a href="DettaglioProdotto?id=${prodotto.id}" action="/DettaglioProdotto"
                                                method="get" value="${prodotto.id}">Visualizza
                                                Dettagli</a><br> -->
                                            <c:url var="urlGenerato" value="/DettaglioProdotto">
                                                <c:param name="id" value="${prodotto.id}" />
                                            </c:url>
                                            <a href="${urlGenerato}">Vai alla pagina</a>
                                            <!-- <a href="DettaglioProdotto?id=${prodotto.id}">
                                                <button type="submit" value="${prodotto.id}" id="DettaglioProdotto"
                                                    style="background-color: #046db5; color: white;">visualizza
                                                    dettagli</button>
                                            </a> -->
                                        </div>
                                        <!-- <button type="submit" value="COMPRA"
                                            style="background-color: #046db5; color: white;">ACQUISTA</button> -->
                                        </p>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                    </div>
                    <div>
                      <button class="d-block mx-auto bg-success text-light mb-1 rounded-5 btn btn-lg" id="exportButton">Esporta in CSV</button>
                    </div>
                    <jsp:include page="footer.jsp" />
            </body>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
                crossorigin="anonymous">
                </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                crossorigin="anonymous"></script>

                <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.0/vanilla-tilt.min.js"></script>
                <script src="./script.js"></script>
            
                <script>
                  document.getElementById('exportButton').addEventListener('click', function() {
                    // Raccogli i dati dalle card Bootstrap
                    const cards = document.querySelectorAll('.card');
                    const data = [];
                    cards.forEach(function(card) {
                      const title = card.querySelector('.card-title').textContent;
                      //const description = card.querySelector('.card-text').textContent;
                      const description = card.querySelector('.card-text').textContent;

                      data.push([title, description]);
                    });
                
                    // Crea il contenuto CSV
                    const csvContent = 'Titolo, Prezzo, Rarità, Condizione, Gradazione, Lingua \n' + data.map(row => row.join(',')).join('\n');
                
                    // Crea un oggetto Blob per il file CSV
                    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
                
                    // Crea un link per scaricare il file CSV
                    const link = document.createElement('a');
                    if (link.download !== undefined) {
                      const url = URL.createObjectURL(blob);
                      link.setAttribute('href', url);
                      link.setAttribute('download', 'dati.csv');
                      link.style.visibility = 'hidden';
                      document.body.appendChild(link);
                      link.click();
                      document.body.removeChild(link);
                    }
                  });
                </script>
                
            </html>