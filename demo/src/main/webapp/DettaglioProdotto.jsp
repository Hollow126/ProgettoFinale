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


                #image {
                    width: 200px;
                    /* Larghezza iniziale dell'immagine */
                    transition: transform 0.3s ease;
                    /* Animazione ingrandimento */
                }

                /* Stile quando si passa sopra con il mouse */
                #image:hover {
                    transform: scale(1.13) rotateX(0deg) rotateY(360deg);
                    /* Ingrandimento dell'immagine del 20% */
                    transition: transform 0.8s ease;
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

            <img src="${prodotto.immagine}" alt="">
            <p>${prodotto.nome}</p>