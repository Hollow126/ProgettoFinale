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

                <!-- Bootstrap CSS v5.2.1 -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
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
                <style>
                    label {
                        font-weight: bold;
                    }

                    /* Style for select elements */
                    select {
                        width: 100%;
                        padding: 8px;
                        margin-bottom: 10px;
                        border: 1px solid #ccc;
                        border-radius: 4px;
                    }

                    /* Style for submit button */
                    input[type="submit"] {
                        background-color: #007bff;
                        color: #fff;
                        padding: 10px 20px;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                    }

                    input[type="submit"]:hover {
                        background-color: #0056b3;
                    }

                    /* Style for form columns */
                    .col-sm-3 {
                        float: left;
                        width: 25%;
                        padding: 10px;
                    }

                    /* Clear floats after columns */
                    .row::after {
                        content: "";
                        clear: both;
                        display: table;
                    }

                    /* Optional: Add some spacing between form elements */
                    br {
                        margin-bottom: 10px;
                    }

                    .card {
                        max-height: max-content;
                    }

                    @media screen and (max-width: 500px) {

                        /* Stili da applicare quando la larghezza dello schermo è <= 500px */
                        #logo {
                            display: none;
                            /* Nasconde l'elemento impostando "display" a "none" */
                        }
                    }
                </style>
            </head>

            <body class="container bg-light">
                <jsp:include page="Navbar.jsp" />
                <div class="row">
                    <style></style>
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
                            <div class=" col-md-3 mb-3">
                                <div class="card text-center h-100 ">
                                    <img class="card-img-top mh-100" src="${prodotto.immagine}" alt="${prodotto.nome}">
                                    <div class="card-body">
                                        <h4 class="card-title">${prodotto.nome}</h4>
                                        <p class="card-text">
                                        <div class="row">
                                            <div class="col">${prodotto.prezzo}</div>
                                            <div class="col">${prodotto.rarita}</div>
                                            <div class="col"> ${prodotto.condizione} </div>
                                            <div class="col"> ${prodotto.gradazione} </div>
                                            <div class="col"> ${prodotto.lingua} </div>
                                        </div>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <jsp:include page="footer.jsp" />
            </body>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
                crossorigin="anonymous">
                </script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
                integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
                crossorigin="anonymous">
                </script>
            <script src="script.js">

            </script>

            </html>