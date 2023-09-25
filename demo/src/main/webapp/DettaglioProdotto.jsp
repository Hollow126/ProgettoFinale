<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <link rel="icon" href="img/icons8-pokeball-48.png" type="img/img" />
        <title>HomePage</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <!-- Bootstrap CSS v5.2.1 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/all.css" />
        <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-solid.css" />
        <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-regular.css" />
        <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-light.css" />

        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Oswald&family=Roboto+Slab&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="style.css" />
      </head>

      <body class="container bg-light">
        <jsp:include page="Navbar.jsp" />
        <div class="row">
          <div class="col">
            <section class="category">

              <img src="${prodotto.immagine}" class="category_item" alt="" style="position: relative;margin-left: 5px;"/>
            </section>
          </div>
          <div class="col mt-4">
            <h1 style="color: #0056b3">
              ${prodotto.nome}-(${prodotto.lingua})-${prodotto.condizione}
            </h1>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="prodotti">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Prodotto</li>
              </ol>
            </nav>
            <h3 style="color: #77a464ff">${prodotto.prezzo}$</h3>
            <br />
            <table class="table table-striped">
              <thead></thead>
              <tbody>
                <tr>
                  <td>Rarita':</td>
                  <td>${prodotto.rarita}</td>
                </tr>
                <tr>
                  <td>Condizione:</td>
                  <td>${prodotto.condizione}</td>
                </tr>
                <tr>
                  <td>Gradazione:</td>
                  <td>${prodotto.gradazione}</td>
                </tr>
                <tr>
                  <td>Scambiabile:</td>
                  <td>${prodotto.scambiabile ? "si" : "no"}</td>
                </tr>
              </tbody>
            </table>


            <button data-bs-toggle="collapse" data-bs-target="#demo" class="modifica mb-3 d-block mx-auto text-light"
              style="background-color: #046db5;">Modifica</button>
            <div id="demo" class="collapse">
              <form action="DettaglioProdotto" method="post">
                <input type="hidden" name="id" value="${prodotto.id}" class="nome123">
                <label for="Nome">Nome</label>
                <input type="text" name="Nome" value="${prodotto.nome}" class="form-control">
                <label for="Rarità">Rarità:</label>
                <select name="Rarità" id="Rarità">
                  <option value="${prodotto.rarita}">${prodotto.rarita}</option>
                  <option value="Comune">Comune</option>
                  <option value="Rara">Rara</option>
                  <option value="Leggendaria">Leggendaria</option>
                  <option value="Rara Segreta">Rara Segreta</option>
                </select>
                <label for="Prezzo">Prezzo</label>
                <input type="number"  min="0" onkeyup="if(this.value<0){this.value= this.value * -1}" name="Prezzo" value="${prodotto.prezzo}" class="form-control">

                <label for="Condizione">Condizione:</label>
                <select name="Condizione" id="Condizione">
                  <option value="${prodotto.condizione}">${prodotto.condizione}</option>
                  <option value="Played">Played</option>
                  <option value="Good">Good</option>
                  <option value="Near Mint">Near Mint</option>
                  <option value="Mint">Mint</option>
                </select>
                <br>


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
                <label for="ScambiabileDaModificare">La carta è Scambiabile? :</label>
                <select name="ScambiabileDaModificare" id="ScambiabileDaModificare">
                  <option value="${prodotto.scambiabile}">${prodotto.scambiabile ? "si" : "no"} </option>
                  <option value="true">si</option>
                  <option value="false">no</option>
                </select>
                <br><br>
                <input type="submit" value="Salva" class="d-block mx-auto mb-5">
              </form>
            </div>
          </div>
        </div>

        <jsp:include page="footer.jsp" />
      </body>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.0/vanilla-tilt.min.js"></script>
      <script src="./script.js"></script>

      </html>