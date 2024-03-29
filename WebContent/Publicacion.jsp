<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Arboreto Carmelo Palma - Publicación</title>

    <!-- CSS boostrap-->
    <link rel="stylesheet" href="./css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="./css/styles2.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <!-- BOOTSTRAP V.4 CSS-->
    <link rel="stylesheet" href="./style/style.css">

    <!-- FONT AWESOME -->
    <script src="https://kit.fontawesome.com/78a455df4c.js" crossorigin="anonymous"></script>

</head>

<body>
 <!-- Menu -->
  <jsp:include page="mainMenus.jsp" />

    <!-- Contenedor -->
    <div class="container">

        <!-- Cabecera de la pagina -->
        <h1 class="my-4">Publicaciones
            <hr class="bg-dark w-25 ml-0">
            <small></small>
        </h1>

        <div class="row">
            <div class="col-lg-6 mb-4">
                <div class="card h-100">
                    <a href="PublicacionIn.html"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="PublicacionIn.jsp">Publicación 1</a>
                        </h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra
                            euismod odio, gravida pellentesque urna varius vitae.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mb-4">
                <div class="card h-100">
                    <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="PublicacionIn.jsp">Publicación 2</a>
                        </h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit aliquam
                            aperiam nulla perferendis dolor nobis numquam, rem expedita, aliquid optio, alias illum
                            eaque. Non magni, voluptates quae, necessitatibus unde temporibus.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mb-4">
                <div class="card h-100">
                    <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="PublicacionIn.jsp">Publicación 3</a>
                        </h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra
                            euismod odio, gravida pellentesque urna varius vitae.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mb-4">
                <div class="card h-100">
                    <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="PublicacionIn.jsp">Publicación 4</a>
                        </h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit aliquam
                            aperiam nulla perferendis dolor nobis numquam, rem expedita, aliquid optio, alias illum
                            eaque. Non magni, voluptates quae, necessitatibus unde temporibus.</p>
                    </div>
                </div>
            </div>
         
        </div>
        <!-- /.row -->

        <!-- Paginación -->
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">1</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">2</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">3</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>
        </ul>

    </div>
    <!-- /.container -->

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