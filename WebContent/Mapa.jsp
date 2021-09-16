<%@ page contentType="text/html; charset=UTF-8" import = "entidades.*, datos.*,vistas.* ,java.util.*;"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Arboreto Carmelo Palma - Mapa Interactivo</title>
    
     <!-- Icon -->
	 <jsp:include page="imgShortIcon.jsp" />  
	

    <!-- CSS boostrap-->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/styles2.css">
    <link rel="stylesheet" href="css/styles4.css">
    <link rel="stylesheet" href="css/imageMapa.css">

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
    
  	  <%
    	  ArrayList<ViewCoordenadaArbol> listCoA = new ArrayList<ViewCoordenadaArbol>();
    	  Dt_CoordenadaArbol dth = new Dt_CoordenadaArbol();
    	  listCoA = dth.listarCoordenadaArbol();
        %> 	
 	 	 <%for(ViewCoordenadaArbol vcoa: listCoA){%>
 	 	   <input type="hidden" class="NombreComun"  value="<%=vcoa.getNombrecomun()%>">	
 		   		   
 		   <input type="hidden" class="NombreCientifico" value="<%=vcoa.getNombrecientifico()%>">	

		   <input type="hidden" class="Descripcion" value="<%=vcoa.getDescar()%>">	

		   <input type="hidden" class="Multimedia" value="<%=vcoa.getMultimedia()%>">	
		   
		   <input type="hidden" class="Latitud" value="<%=vcoa.getLatitud()%>">	
		   
		   <input type="hidden" class="Longitud" value="<%=vcoa.getLongitud()%>">	
		    			 	 		 
 	 	 <%}%>

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
        
        //test      
        var PhotoImg = '<img src="https://i.imgur.com/TBFb9zI.jpg" height="150px" width="150px" class="center" />';
        var PhotoImg1 = '<img src = "https://i.imgur.com/0grafib.jpg" height="150px" width="150px" class="center" />';
        var PhotoImg2 = '<img src = "https://i.imgur.com/WGGHrxW.jpg" height="150px" width="150px" class="center" />';
        var LeafIcon = L.Icon.extend({
            options: {
                shadowUrl: 'https://i.imgur.com/lsGlWbl.png',
                iconSize:     [38, 95],
                shadowSize:   [50, 64],
                iconAnchor:   [22, 94],
                shadowAnchor: [4, 62],
                popupAnchor:  [-3, -76]
            }
        });
        var greenIcon = new LeafIcon({iconUrl: 'https://i.imgur.com/kCbcOsA.png'}),
        	orangeIcon = new LeafIcon({iconUrl: 'https://i.imgur.com/ANYFjzm.png'});
        
       
        L.marker([12.127055947189353, -86.27032868564129], {icon: greenIcon}).addTo(map).bindPopup("<center><b>ABETO</b></center>" + PhotoImg + "<center><br>Abies alba, el abeto común o abeto blanco es una especie arbórea de la familia de las pináceas, originaria de las regiones montañosas de Europa.</center>");
        L.marker([12.12678256672591, -86.2705647200346], {icon: greenIcon}).addTo(map).bindPopup("<center><b>CEDRO</b></center>" + PhotoImg1 + "<center><br>Los cedros constituyen un género (Cedrus) de coníferas pináceas. Son árboles de gran tamaño, de madera olorosa y copa cónica o vertical, muy utilizados para ornamentación de parques.</center>" );
        L.marker([12.126837636194313, -86.27036154270172], {icon: orangeIcon}).addTo(map).bindPopup("<center><b>PEINE DE MICO</b></center>" + PhotoImg2 + "<center><br>Arbusto o árbol mediano, puede alcanzar entre 5 a 25 metros de altura y diámetros de 10 a 30 cm. El tronco irregular, se ramifica a poca altura. Su corteza externa es de color gris y se desprende fácilmente en tiras; la corteza interna amarillenta, exuda una savia mucilaginosa.</center>" );

        //end of the test

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