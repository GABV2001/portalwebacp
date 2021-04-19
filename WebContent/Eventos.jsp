<%@ page contentType="text/html; charset=UTF-8" import = "entidades.Evento, datos.Dt_Evento ,java.util.*;"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Arboreto Carmelo Palma - Eventos</title>

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

    

    <!-- Calendar CSS -->
    <link rel="stylesheet" href="css/evo-calendar.midnight-blue.min.css">
    <link rel="stylesheet" href="css/evo-calendar.min.css">
    <!-- Add jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js"></script>

</head>

<body>

    <!-- Menu -->
   <jsp:include page="mainMenus.jsp" />
  

    <!-- Contenido -->
    <div class="container">
    
    	
    	<%
    	  ArrayList<Evento> listEventos = new ArrayList<Evento>();
    	  Dt_Evento dth = new Dt_Evento();
          listEventos = dth.listarEventos();
        %> 	
 	 	 <%for(Evento ev: listEventos){ 
 	 	     StringBuilder fechaInicio = new StringBuilder(ev.getFechainicio());
         	 fechaInicio.setCharAt(4, '/');
       	     fechaInicio.setCharAt(7, '/');
      	     System.out.println(fechaInicio);
      	     
            StringBuilder fechaFin = new StringBuilder(ev.getFechafin());
            fechaFin.setCharAt(4, '/');
            fechaFin.setCharAt(7, '/');
 			%>
 			<input type="hidden" id="fechaInicio" value="<%=fechaInicio%>">			
           <input type="hidden" id="fechaFin" value="<%=fechaFin %>">  
 
        <%}%> 
        
      
   
    
    
     <!-- Header -->
            <h1 class="my-4 text-center">
                Eventos
            </h1>
            <hr class="bg-dark">
   		  <!-- End of Header -->
   		  
        <div class="card mt-4 mb-5">
            <div id="calendar" style="border: 3px;"></div>
        </div>
    </div>
    <!-- Fin Contenido -->


    <!-- footer -->
     <jsp:include page="mainFooter.jsp" />
   

    <!-- js Calendar -->
    <script src="js/evo-calendar.js"></script>
    <script src="js/evo-calendar.min.js"></script>

    <script>
    $("#calendar").evoCalendar({
    	
    	
    	
  /*  	var arrayString = $("#fechaInicio").val().split(",");
		Evento ev= new Evento();    	
    	for(i =0; i < arrayString.size() ;i++) {
    		event
    	} */	
    	
	 	  theme: "Midnight Blue",
      	  language: "es",
          calendarEvents: 
        	[  
        		  {
                      name: "Test", // Event name (required)
                      date: "2021/04/19",// Event date (required)
                      type: "event", // Event type (required)
  				    	description: "Acá me las pelas "
                  }
     	   ]
    }
    );

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