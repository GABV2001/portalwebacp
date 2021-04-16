<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "entidades.Home, datos.Dt_Home, entidades.Banner, datos.Dt_Banner, java.util.*;"
    %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
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
   
   								<%ArrayList<Home> listHome = new ArrayList<Home>();
									Dt_Home dth = new Dt_Home();
									listHome = dth.ListarHome();
										
									String Historia = null;
									String Vision = null;
									String Mision = null;
									String Img_historia =null;
									String Img_vision = null;
									String Img_mision = null;
									
									for(Home hm : listHome){
										Historia = hm.getHistoria();
										Vision = hm.getVision();
										Mision = hm.getMision();
										Img_historia = hm.getImg_historia();
										Img_vision = hm.getImg_vision();
										Img_mision= hm.getImg_mision();
									}
									 %>
									 
								   <%
                                	ArrayList<Banner> listBanner = new ArrayList<Banner>();
                                	Dt_Banner dtb = new Dt_Banner();
                                	listBanner = dtb.ListarBanner();                                	
                                    %>
                                                                      
   									

    <!-- Carousel -->
    <div id="mycarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            
            <button type="button" data-bs-target="#mycarousel" data-bs-slide-to="0" class="active" aria-current="true"
                aria-label="Slide 1"></button>
            
             <%
			 for (int counter = 1; counter < listBanner.size(); counter++) {
	  	 	%>
      	          <button type="button" data-bs-target="#mycarousel" data-bs-slide-to="<%=counter %>>" aria-label="Slide <%=counter %>"></button>
        	  <%
			 }
        	 %>    
    
        </div>
        <div class="carousel-inner ">
				
			<%
				String imagen1 = null;
				Banner bn1 = new Banner();
				bn1 = listBanner.get(0);
			%>

            <div class="carousel-item active">
                <img src="img/<%=bn1.getMultimedia() %>" class="d-block w-100 h-100 " alt="imagen 1">
                   <div class="carousel-caption d-none d-md-block">
			        <h5 class= "fw-light"><%=bn1.getTitulobanner() %></h5>
				   </div>
            </div>
        
            <%
				for (int counter = 1; counter < listBanner.size(); counter++) {
			    Banner bn = listBanner.get(counter);		   
            %>
             <div class="carousel-item ">
                <img src="img/<%=bn.getMultimedia() %>" class="d-block w-100 h-50" alt="imagen <%=counter %>>">
                 <div class="carousel-caption d-none d-md-block">
			        <h5 class= "fw-light"><%=bn.getTitulobanner() %></h5>
				  </div>
            </div>
            <% }
            %>
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
        <h1 class="display-4 mt-4"> Historia </h1>
        <hr class="bg-dark w-25 ml-0">
        <div class="row">

            <div class="col-md-5">
                <img class="img-fluid" src="img/<%=Img_historia%>"  alt="imagen Historia">
            </div>

            <div class="col-md-6">
                <p class= "lead"><%=Historia%></p>           
            </div>

        </div>
    </div>
    <br>
 
    <!-- Section Misión -->
    <div class="container mb-5">
        <div class="row">
            <div class="col-md-6">
                <h3 class="display-4">Misión</h3>
                <hr class="bg-dark w-25 ml-0">
                <p class="lead">
                    <%=Mision%>
                </p>
            </div>
            <div class="col-md-5 mt-7">
                <img class="img-fluid" src="img/<%=Img_mision%>" alt="imagen Mision">
            </div>
        </div>
    </div>
 
    <!-- Section Visión -->
    <div class="container mb-5">
        <div class="row ">

			  <div class="col-md-5 mt-7 ">
                <img class="img-fluid" src="img/<%=Img_vision%>" alt=" imagen Vision">
            </div>
            <div class="col-md-7">
                <h3 class="display-4">Visión</h3>
                <hr class="bg-dark w-25 ml-0">
                <p class="lead">
                 <%=Vision%>
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