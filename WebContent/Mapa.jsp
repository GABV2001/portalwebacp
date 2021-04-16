<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Arboreto Carmelo Palma - Mapa Interactivo</title>

    <!-- CSS boostrap-->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/styles2.css">
    <link rel="stylesheet" href="css/styles4.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <!-- BOOTSTRAP V.4 CSS-->
    <link rel="stylesheet" href="./style/style.css">

    <!-- FONT AWESOME -->
    <script src="https://kit.fontawesome.com/78a455df4c.js" crossorigin="anonymous"></script>

    <!-- CSS MAP -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/leaflet.css" />
    <link rel="stylesheet" href="css/leaflet.groupedlayercontrol.css" />

</head>

<body class="bg-faded">

    <!-- Menu -->
    <jsp:include page="mainMenus.jsp" />
    
  

    <!--Maps-->
    <div class="container mt-5 mb-5">
     		 <!-- Header -->
            <h1 class="my-4 text-center">
                Mapa interactivo
            </h1>
            <hr class="bg-dark">
   		  <!-- End of Header -->
   		  
            <div class="card p-2 rounded-3 border-dark">
            <div id="map" style="height: 610px; padding: 0; margin: 0; "></div>
        </div>
    </div>

    <!-- footer -->
     <jsp:include page="mainFooter.jsp" />
   

    <!-- Js Mapa Source -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/leaflet.js"></script>
    <script src="js/leaflet.groupedlayercontrol.js"></script>
    <script src="js/Mapa.js"></script>

    <!-- Js Mapa Custom -->
    <script>
        var map = L.map('map', {
            center: [12.126932040970864, -86.27038300037383],
            zoom: 19,
            layers: [Mapa.Basemaps.Calles, Mapa.LayerGroups.Arboles]
        });

        // Capas de Arboles y Sectores
        var groupedOverlays = {
            "Capas": {
                "Árboles": Mapa.LayerGroups.Arboles,
                "Sectores": Mapa.LayerGroups.Sectores
            }
        };

        //Controlador de groudLayers"
        L.control.groupedLayers(Mapa.Basemaps, groupedOverlays).addTo(map);
    </script>

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