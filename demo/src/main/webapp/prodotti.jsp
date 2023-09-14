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
                        max-height:max-content;
                    }

                    
                    #image {
            width: 200px; /* Larghezza iniziale dell'immagine */
            transition: transform 0.3s ease; /* Animazione ingrandimento */
        }

        /* Stile quando si passa sopra con il mouse */
        #image:hover {
            transform: scale(1.13) rotateX(0deg) rotateY(360deg); /* Ingrandimento dell'immagine del 20% */
            transition: transform 0.8s ease;
        }
    

                    @media screen and (max-width: 500px) {
  /* Stili da applicare quando la larghezza dello schermo è <= 500px */
  #logo {
    display: none; /* Nasconde l'elemento impostando "display" a "none" */

  }
  #div-carte {

  }
}


                </style>
            </head>

            <body class="container bg-light">
                <jsp:include page="Navbar.jsp" />
                <div>
                  <form class="d-flex flex-shrink-1 mt-3">
                    
                    <input class="form-control me-2" type="text" placeholder="Search">
                    <button class="btn btn-light" type="button"><img src="img/icons8-pokeball-48.png"
                        class="bg-light;"></button>
                    
                  </form>
        
        
        
                
                </div>
                <div class="row">
                    <style></style>
                    <div class="col-sm-3">
                      <form action="/action_page.php">
                        <label for="cars">Rarità:</label>
                        <select name="cars" id="cars">
                          <option value="volvo">Comune</option>
                          <option value="saab">Rara</option>
                          <option value="Z">Leggendaria</option>
                        </select>
                        <br><br>
                        <input type="submit" value="Applica">
                    
                    </div>
                    <div class="col-sm-3">
                    
                        <label for="cars">Prezzo:</label>
                        <select name="cars" id="cars">
                          <option value="volvo">Più caro</option>
                          <option value="saab">meno caro</option>
                          
                        </select>
                        <br><br>
                    </div>
                    <div class="col-sm-3">
                    
                        <label for="cars">Condizione:</label>
                        <select name="cars" id="cars">
                          <option value="volvo">Played</option>
                          <option value="volvo">Good</option>
                          <option value="saab">Near Mint</option>
                          <option value="audi">Mint</option>
                        </select>
                        <br><br>
                      
                    </div>
                    <div class="col-sm-3">
                    
                        <label for="cars">Gradazione:</label>
                        <select name="cars" id="cars">
                          <option value="volvo">7</option>
                          <option value="saab">7.5</option>
                          <option value="audi">8</option>
                          <option value="volvo">8.5</option>
                          <option value="volvo">9</option>
                          <option value="volvo">9.5</option>
                          <option value="volvo">10</option>
                        
                        </select>
                        <br><br>
                    
                     
                    </div>
                    <div class="col-sm-3">
                    
                      <label for="cars">Lingua:</label>
                      <select name="cars" id="cars">
                        <option value="volvo">ITA</option>
                        <option value="volvo">ENG</option>
                        <option value="saab">JPN</option>
                        <option value="audi">ESP</option>
                      </select>
                      <br><br>
                    
                  </div>
                  </form>
                  </div>

                <h1 class="text-center " style="color: #046db5;">Lista dei prodotti</h1>
                <div class="row">


                    <c:forEach var="prodotto" items="${prodotti}">
                        <div class=" col-lg-3 col-md-4 col-sm-6 mb-3" id="div-carte">
                            <div class="card text-center h-100 bg-light border-0">
                              <div id="image-container">
                                <img class="card-img-top mh-100" id="image" src="${prodotto.immagine}" alt="${prodotto.nome}">
                              </div>
                                <div class="card-body">
                                    <h4 class="card-title">${prodotto.nome}</h4>
                                    <p class="card-text">
                                      <div class="row">
                                        <div class="col">${prodotto.prezzo}</div>
                                        <div class="col">${prodotto.rarita}</div>
                                        <div class="col"> ${prodotto.condizione} </div>
                                        <div class="col">  ${prodotto.gradazione} </div>
                                      </div>
                                      <button type="submit" value="COMPRA" style="background-color: #046db5; color: white;">ACQUISTA</button>
                                    </p>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                </div>
                

                <jsp:include page="footer.jsp" />


                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
                crossorigin="anonymous">
                </script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
                integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
                crossorigin="anonymous">
                </script>
            </script>

            

            <!-- <script>
              const imageContainer = document.getElementById("image-container");
              const image = document.getElementById("image");
              let rotation = 0; // Angolo di rotazione iniziale
      
              imageContainer.addEventListener("click", () => {
                  // Aggiungi 360 gradi per compiere una rotazione completa
                  rotation += 360;
      
                  // Applica la rotazione e l'ingrandimento all'immagine
                  image.style.transform = `rotate(${rotation}deg)`;
                  imageContainer.style.width = "200px"; // Larghezza ingrandita
              });
          </script> -->

            <!-- <script>
                document.addEventListener('DOMContentLoaded', function () {
                  // Seleziona il pulsante del menu ad hamburger e il menu stesso
                  var navbarToggle = document.querySelector('.navbar-toggler');
                  var navbarCollapse = document.querySelector('.navbar-collapse');
              
                  // Aggiungi un evento di click al pulsante del menu ad hamburger
                  navbarToggle.addEventListener('click', function () {
                    // Verifica se il menu è aperto o chiuso
                    if (navbarCollapse.classList.contains('show')) {
                      // Chiudi il menu se è aperto
                      navbarCollapse.classList.remove('show');
                    } else {
                      // Altrimenti, apri il menu
                      navbarCollapse.classList.add('show');
                    }
                  });
                });
              </script> -->
              
              


            </body>
           

            </html>