<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
 import="entidades.Servicio, datos.Dt_Servicio, java.util.*;" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="ISO-8859-1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Portal Arboreto Carmelo Palma - Servicios</title>
  
   <!-- Icon -->
   <jsp:include page="imgShortIcon.jsp" />  
	

  <!-- CSS boostrap-->
  <link rel="stylesheet" href="css/bootstrap.min.css">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/styles2.css">

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

 <!-- Contenido -->
      <div class="container mb-5">
        <br>
        <h2 class="text-center">Servicios</h2>
        <hr>

        <div class="row">
       				 <%
                      	ArrayList<Servicio> listServicio = new ArrayList<Servicio>();
                       	Dt_Servicio dts = new Dt_Servicio();
                       	listServicio = dts.listarServicio();                     	                         	
                      %> 
                       <%for(Servicio sr: listServicio){
                       if(sr.getEstadoservicio()!=2){%>
			          
			            <div class="col-md-4">
			                <figure class="card card-product">
			                    <div class="img-wrap"><img src="img/<%=sr.getMultimedia()%>"></div>
			                    <figcaption class="info-wrap">
			                        <h4 class="title"><%=sr.getNombre()%></h4>
			                        <p class="desc"><%=sr.getDescripcion()%></p>
			                    </figcaption>
			                    <div class="bottom-wrap">
			                        <a href="Contacto.jsp" class="btn btn-sm btn-primary float-right">Contactar</a>
			                    </div> <!-- bottom-wrap.// -->
			                </figure>
			            </div> <!-- col // -->				       
			           <%
                       }
			             }
			             %> 
			              </div>
			            
            </div> <!-- row.// -->
    </div>
    <!--container.//-->	

  <!-- footer -->
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