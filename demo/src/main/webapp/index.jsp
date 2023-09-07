<html>

<body>
    <c:forEach var="prodotto" items="${prodotti}">
        <tr>
            <td>${prodotto.id}</td>
            <td>${prodotto.nome_Prodotto}</td>
            <td>${prodotto.prezzo}</td>
        </tr>
    </c:forEach>
</body>

</html>