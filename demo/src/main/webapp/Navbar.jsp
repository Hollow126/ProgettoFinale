<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>



      <header>
        <!-- place navbar here -->
        <nav class="navbar navbar-expand-sm bg-light text-bg-light d-flex flex-sm-column">
          <div class="container-fluid">
            <a class="navbar-brand " href="javascript:void(0)"><img src="img/prova-logo.png"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="mynavbar">
              <ul class="navbar-nav me-auto">
                <li class="nav-item">
                  <form class="border ms-5 d-flex">
                    <div class="row">
                      <div class="col">
                        <input type="text" class="form-control" placeholder="Enter email" name="email">
                      </div>
                      <div class="col">
                        <input type="password" class="form-control" placeholder="Enter password" name="pswd">
                      </div>
                    </div>
                    <button class="mx-3" style="background-color: #046db5; color: white;">SIGN IN</button>
                    <button style="background-color: #046db5; color: white;">SIGN UP</button>
                  </form>

                </li>
                <i class="fa-regular fa-cart-shopping fa-bounce fa-3x ms-5" style="color: #046db5;"></i>
              </ul>

            </div>
          </div>
        </nav>
        <div>
          <form class="d-flex flex-shrink-1">
            
            <input class="form-control me-2" type="text" placeholder="Search">
            <button class="btn btn-light" type="button"><img src="img/icons8-pokeball-48.png"
                class="bg-light;"></button>
            
          </form>



        
        </div>
      </header>
      <main>
        <!-- <img width="48" height="48" src="https://img.icons8.com/color/48/pokeball--v1.png" alt="pokeball--v1"/> -->
        <br>
        <!-- Carousel -->
        <div id="demo" class="carousel slide" data-bs-ride="carousel">

          <!-- Indicators/dots -->
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
          </div>

          <!-- The slideshow/carousel -->
          <div class="carousel-inner" style="height: 50%; width: 100%;">
            <div class="carousel-item active">
              <img src="img/pikachuSlide1.jpg" alt="Los Angeles" class="d-block w-100">
            </div>
            <div class="carousel-item">
              <img src="img/CharizardSlide2.jpg" alt="Chicago" class="d-block w-100">
            </div>
            <div class="carousel-item">
              <img src="img/MeowSlide3.jpg" alt="New York" class="d-block w-100">
            </div>
          </div>

          <!-- Left and right controls/icons -->
          <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
          </button>
        </div>
      </main>
