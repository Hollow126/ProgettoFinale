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
                <link rel="stylesheet" href="style.css">
            </head>

            <body class="container bg-light">
                <jsp:include page="Navbar.jsp" />

                <img src="${prodotto.immagine}" alt="">
                <p>${prodotto.rarita}</p>
                <p>${prodotto.nome}</p>

                <form action="DettaglioProdotto" method="post">
                    <input type="hidden" name="id" value="${prodotto.id}">
                    Nome: <input type="text" name="Nome" value="${prodotto.nome}"><br>

                    <label for="Rarità">Rarità:</label>
                    <select name="Rarità" id="Rarità">
                        <option value="${prodotto.rarita}">${prodotto.rarita}</option>
                        <option value="Comune">Comune</option>
                        <option value="Rara">Rara</option>
                        <option value="Leggendaria">Leggendaria</option>
                    </select>

                    <label for="Prezzo">Prezzo:</label>
                    <select name="Prezzo" id="Prezzo">
                        <option value="${prodotto.prezzo}">${prodotto.prezzo}</option>
                        <option value="9.99">9.99</option>
                        <option value="19.99">19.99</option>
                        <option value="29.99">29.99</option>

                    </select>


                    <label for="Condizione">Condizione:</label>
                    <select name="Condizione" id="Condizione">
                        <option value="${prodotto.condizione}">${prodotto.condizione}</option>
                        <option value="Played">Played</option>
                        <option value="Good">Good</option>
                        <option value="Near Mint">Near Mint</option>
                        <option value="Mint">Mint</option>
                    </select>
                    <br><br>


                    <label for="Gradazione">Gradazione:</label>
                    <select name="Gradazione" id="Gradazione">
                        <option value="${prodotto.gradazione}">${prodotto.gradazione}</option>
                        <option value="7.0">7</option>
                        <option value="7.5">7.5</option>
                        <option value="8.0">8</option>
                        <option value="8.5">8.5</option>
                        <option value="9.0">9</option>
                        <option value="9.5">9.5</option>
                        <option value="10.0">10</option>

                    </select>

                    <label for="Lingua">Lingua:</label>
                    <select name="Lingua" id="Lingua">
                        <option value="${prodotto.lingua}">${prodotto.lingua}</option>
                        <option value="ITA">ITA</option>
                        <option value="ENG">ENG</option>
                        <option value="ESP">ESP</option>
                        <option value="JPN">JPN</option>
                        <option value="GER">GER</option>
                    </select>
                    <br><br>
                    <input type="submit" value="Salva">
                </form>
                <jsp:include page="footer.jsp" />

            </body>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
                crossorigin="anonymous">
                </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                crossorigin="anonymous"></script>

            </html>