<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ page isELIgnored="false" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Clienti</title>
            </head>

            <body>
                <h1>Lista dei clienti</h1>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Email</th>
                    </tr>
                    <c:forEach var="cliente" items="${clienti}">
                        <tr>
                            <td>${cliente.id}</td>
                            <td>${cliente.nome}</td>
                            <td>${cliente.email}</td>
                        </tr>
                    </c:forEach>
                </table>
            </body>

            </html>