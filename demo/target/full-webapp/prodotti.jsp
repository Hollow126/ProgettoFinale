<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ page isELIgnored="false" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Prodotti</title>
            </head>

            <body>
                <h1>Lista dei prodotti</h1>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Prezzo</th>
                    </tr>
                    <c:forEach var="prodotto" items="${prodotti}">
                        <div class="card text-start">
                          <img class="card-img-top" src="holder.js/100px180/" alt="Title">
                          <div class="card-body">
                            <h4 class="card-title">${prodotto.nome}</h4>
                            <p class="card-text">${prodotto.prezzo}</p>
                          </div>
                        </div>
                        <!-- <tr>
                            <td>${prodotto.id}</td>
                            <td>${prodotto.nome}</td>
                            <td>${prodotto.prezzo}</td>
                        </tr> -->
                    </c:forEach>
                </table>
            </body>

            </html>