<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Risultati della ricerca</title>
</head>
<body>
    <h1>Risultati della ricerca</h1>
     <c:forEach var="prodotto" items="${risultatiFiltrati}">
        <!-- Mostra i risultati filtrati qui  -->
    </c:forEach> 
</body>
</html>