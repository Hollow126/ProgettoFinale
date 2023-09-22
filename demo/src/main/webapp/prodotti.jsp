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
                            <option value="">qualsiasi</option>
                            <option value="9.99">9.99</option>
                            <option value="19.99">19.99</option>
                            <option value="29.99">29.99</option>

                        </select>
                        <br><br>
                    </div>
                    <div class="col-sm-2">

                        <label for="Condizione">Condizione:</label>
                        <select name="Condizione" id="Condizione">
                            <option value="">qualsiasi</option>
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
                            <option value="">qualsiasi</option>
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
                            <option value="">qualsiasi</option>
                            <option value="ITA">ITA</option>
                            <option value="ENG">ENG</option>
                            <option value="ESP">ESP</option>
                            <option value="JPN">JPN</option>
                            <option value="GER">GER</option>
                        </select>
                        <br><br>


                    </div>
                    <div class="col-sm-2">
                        <!-- qui messo i numeri invece delle stringhe per comodità nei dati per Backend -->
                        <label for="OrdinePrezzo:">Ordina per:</label>
                        <select name="OrdinePrezzo" id="OrdinePrezzo">
                            <option value="">qualsiasi</option>
                            <option value="1">Dal più caro al Più meno Basso</option>
                            <option value="2">dal meno caro al Più caro</option>
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
                                    <c:url var="urlGenerato" value="/DettaglioProdotto">
                                        <c:param name="id" value="${prodotto.id}" />
                                    </c:url>
                                    <div id="image-container">
                                        <a href="${urlGenerato}">
                                            <img class="card-img-top mh-100 category category_item" id="image"
                                                src="${prodotto.immagine}" alt="${prodotto.nome}"> </a>
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
                                            <div class="col">${prodotto.scambiabile ? "Carta scambiabile" : "Carta non
                                                scambiabile"}</div>
                                            <div class="d-flex">
                                                <button class="flex-grow-1 border-0 border-end"
                                                    style="background-color: #046db5;"><a href="${urlGenerato}"
                                                        class="text-light" style="text-decoration: none;">Vai alla
                                                        pagina</a></button>
                                                <button class="flex-grow-1 border-0"
                                                    style="background-color: #046db5;"><a
                                                        href="prodotti?azione=elimina&id=${prodotto.id}"
                                                        class="text-light"
                                                        style="text-decoration: none;">Elimina</a></button>
                                            </div>
                                        </div>
                                        </p>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                    </div>
                    <div class="d-flex justify-content-center mb-5">
                        <div>
                            <a href="prodotti?azione=esporta_csv" style="text-decoration: none;">
                                <button
                                    class=" mx-auto bg-success text-light mb-1 rounded-4 btn btn-lg me-3 border-black"
                                    id="exportButton">Esporta in CSV</button>
                            </a>
                        </div>
                        <div>
                            <button data-bs-toggle="collapse" data-bs-target="#demo"
                                class=" mx-auto bg-white text-primary mb-1 rounded-4 btn btn-lg ms-3 border-primary"
                                style="background-color: #046db5;">Inserisci prodotto</button>
                        </div>
                    </div>
                    <!--  quando metto encytype e carico una immagine da frontEnd, tutti i valori da frontEnd diventano null  -->
                    <div id="demo" class="collapse">
                        <form action="/prodotti" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="">>
                            <label for="NomeDaInserire">Nome Carta</label>
                            <input type="text" name="NomeDaInserire" id="NomeDaInserire" value="Prova"
                                class="form-control">
                            <br>
                            <label for="RaritaDaInserire">Rarita Carta</label>
                            <select name="RaritaDaInserire" id="RaritaDaInserire">
                                <option value="Comune">Comune</option>
                                <option value="Rara">Rara</option>
                                <option value="Leggendaria">Leggendaria</option>
                                <option value="Rara Segreta">Rara Segreta</option>
                            </select>
                            <br>
                            <label for="PrezzoDaInserire">Prezzo carta</label>
                            <input type="text" name="PrezzoDaInserire" id="PrezzoDaInserire" value="5"
                                class="form-control"><br>
                            <label for="CondizioneDaInserire">Condizione Carta</label>
                            <select name="CondizioneDaInserire" id="CondizioneDaInserire">
                                <option value="Good">Good</option>
                                <option value="Played">Played</option>
                                <option value="Near Mint">Near Mint</option>
                                <option value="Mint">Mint</option>
                            </select>
                            <br>
                            <label for="GradazioneDaInserire">Gradazione Carta</label>
                            <select name="GradazioneDaInserire" id="GradazioneDaInserire">
                                <option value="7">7</option>
                                <option value="7.5">7.5</option>
                                <option value="8">8</option>
                                <option value="8.5">8.5</option>
                                <option value="9">9</option>
                                <option value="9.5">9.5</option>
                                <option value="10">10</option>
                            </select>
                            <br>
                            <label for="LinguaDaInserire"> Lingua Carta</label>
                            <select name="LinguaDaInserire" id="LinguaDaInserire">
                                <option value="ITA">ITA</option>
                                <option value="ENG">ENG</option>
                                <option value="ESP">ESP</option>
                                <option value="JPN">JPN</option>
                                <option value="GER">GER</option>
                            </select>
                            <label for="scambiabileDaInserire">La carta è Scambiabile?</label>
                            <select name="scambiabileDaInserire" id="scambiabileDaInserire">
                                <option value="true">si</option>
                                <option value="false">no</option>
                            </select>
                            <br>
                            <div class="text-center">
                                <p class="fw-bold" class="text-center">Immagine</p>
                                <div class="d-bock mx-auto">
                                 <input type="file" name="fileUpload" id="fileUpload"  >
                              </div>
                          </div>
                          <br><br>
                            <input type="submit" value="Salva" class="d-block mx-auto mb-5">
                        </form>
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

            </html>