<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ page isELIgnored="false" %>

            <!DOCTYPE html>
            <html>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
                crossorigin="anonymous">

            <head>
                <meta charset="UTF-8">
                <title>Prodotti</title>
            </head>

            <body>
                <h1>Lista dei prodotti</h1>
                <!-- <table>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Prezzo</th>
                    </tr> -->
                <div class="row">


                    <c:forEach var="prodotto" items="${prodotti}">
                        <div class="col-4">
                            <div class="card text-start">
                                <img class="card-img-top" src="${prodotto.immagine}"  alt="${prodotto.nome}">
                                <div class="card-body">
                                    <h4 class="card-title">${prodotto.nome}</h4>
                                    <p class="card-text">${prodotto.prezzo} + ${prodotto.rarita} + ${prodotto.condizione}  + ${prodotto.gradazione}</p>
                                </div>
                            </div>
                        </div>
                
                </c:forEach>
            </div>
            <form action="/paginaRisultati" method="post">
                <label for="prezzo">Prezzo massimo:</label>
                <input type="text" id="prezzo" name="prezzo">
                <label for="rarita">Rarità:</label>
                <input type="text" id="rarita" name="rarita">
                <label for="condizione">Condizione:</label>
                <input type="text" id="condizione" name="condizione">
                <label for="gradazione">Gradazione:</label>
                <input type="text" id="gradazione" name="gradazione">
                <input type="submit" value="Filtra">
            </form>
                <!-- </table> -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
                    crossorigin="anonymous"></script>
            </body>


            </html>