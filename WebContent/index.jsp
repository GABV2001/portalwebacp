<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Arboreto Carmelo Palma</title>

    <!-- CSS boostrap-->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/styles2.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <!-- FONT AWESOME -->
    <script src="https://kit.fontawesome.com/78a455df4c.js" crossorigin="anonymous"></script>

</head>

<body>
   <jsp:include page="mainMenus.jsp" />

    <!-- Carousel -->
    <div id="mycarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#mycarousel" data-bs-slide-to="0" class="active" aria-current="true"
                aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#mycarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#mycarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/1.jpg" class="d-block w-100 h-50" alt="...">
            </div>
            <div class="carousel-item">
                <img src="img/2.jpg" class="d-block w-100 h-50" alt="...">
            </div>
            <div class="carousel-item">
                <img src="img/3.jpg" class="d-block w-100 h-50" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev " type="button" data-bs-target="#mycarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="false"></span>
            <span class="visually-hidden">Anterior</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#mycarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon position" aria-hidden="false"></span>
            <span class="visually-hidden">Siguiente</span>
        </button>
    </div>

    <!-- Section historia -->
    <div class="container">

        <!-- Titulo de la historia -->
        <h1 class="my-4"> Historia </h1>
        <hr class="bg-dark w-25 ml-0">
        <div class="row">

            <div class="col-md-8">
                <img class="img-fluid" src="http://placehold.it/750x500" alt="">
            </div>

            <div class="col-md-4">
                <h3 class="my-3">Example</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida
                    pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus.
                    Mauris ultricies, justo eu convallis placerat, felis enim.</p>
                <h3 class="my-3">Examples 1</h3>
                <ul>
                    <li>Lorem Ipsum</li>
                    <li>Dolor Sit Amet</li>
                    <li>Consectetur</li>
                    <li>Adipiscing Elit</li>
                </ul>
            </div>

        </div>
    </div>
    <br>
 
    <!-- Section Misión -->
    <div class="container mb-5">
        <div class="row">
            <div class="col-md-8">
                <h3 class="display-4">Misión</h3>
                <hr class="bg-dark w-25 ml-0">
                <p class="lead">
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                    industry's standard dummy text ever since the 1500s
                </p>
                <p>
                    When an unknown printer took a galley of type and scrambled it to make a type specimen book. It has
                    survived not only five centuries, but also the leap into electronic typesetting, remaining
                    essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets
                    containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus
                    PageMaker including versions of Lorem Ipsum.
                </p>
                <ul class="list-unstyled pl-4">
                    <li><i class="fa fa-check"></i> Lorem Ipsum is simply dummy text</li>
                    <li><i class="fa fa-check"></i> Lorem Ipsum is simply dummy text</li>
                    <li><i class="fa fa-check"></i> Lorem Ipsum is simply dummy text</li>
                </ul>
            </div>
            <div class="col-md-4 mt-7">
                <img class="card-img-top" src="https://dummyimage.com/300x300/c7c7c7/000.png" alt="Card image cap">
            </div>
        </div>
    </div>

    <!-- Section Visión -->
    <div class="container mb-5">
        <div class="row">

            <div class="col-md-4 mt-7">
                <img class="card-img-top" src="https://dummyimage.com/300x300/c7c7c7/000.png" alt="Card image cap">
            </div>
            <div class="col-md-8">
                <h3 class="display-4">Visión</h3>
                <hr class="bg-dark w-25 ml-0">
                <p class="lead">
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                    industry's standard dummy text ever since the 1500s
                </p>
                <p>
                    When an unknown printer took a galley of type and scrambled it to make a type specimen book. It has
                    survived not only five centuries, but also the leap into electronic typesetting, remaining
                    essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets
                    containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus
                    PageMaker including versions of Lorem Ipsum.
                </p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="mainFooter.jsp" />


    <!-- Javascript -->
    <link rel="stylesheet" href="js/bootstrap.min.js">
    <script defer src="./js/index.js"></script>

    <!-- BOOTSTRAP V.4 -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
        integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
        integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
        crossorigin="anonymous"></script>


</body>

</html>