<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ page isELIgnored="false" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Acquisti</title>
            </head>

            <body>
                <h1>Lista degli acquisti</h1>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>ID Prodotto</th>
                        <th>ID Cliente</th>
                        <th>Data Acquisto</th>
                    </tr>
                    <c:forEach var="acquisto" items="${acquisti}">
                        <tr>
                            <td>${acquisto.id}</td>
                            <td>${acquisto.idProdotto}</td>
                            <td>${acquisto.idCliente}</td>
                            <td>${acquisto.dataAcquisto}</td>
                        </tr>
                    </c:forEach>
                </table>
            </body>

            </html>