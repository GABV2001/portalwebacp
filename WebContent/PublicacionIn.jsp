<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "entidades.Publicacion, datos.Dt_Publicacion, java.text.SimpleDateFormat,java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Arboreto Carmelo Palma - Publicación</title>
    
     <!-- Icon -->
	 <jsp:include page="imgShortIcon.jsp" />  
	

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
 <!-- Menu -->
 <jsp:include page="mainMenus.jsp" />
    <br>
    <br>
				<%											
				ArrayList<Publicacion> ListaPost = new ArrayList<Publicacion>();
              	Dt_Publicacion dta = new Dt_Publicacion();
              	ListaPost = dta.ListaPost();  
     		    
				%> 
		    <div class="row">
		    	<%
		    	String publicacionid = "";
				publicacionid = request.getParameter("publicacionid")==null?"0":request.getParameter("publicacionid");	
				int MostrarInfo = Integer.parseInt(publicacionid);
		    	for(Publicacion a: ListaPost){ 
		    	String fechaCreacion = new SimpleDateFormat("dd/MM/yyyy").format(a.getFcreacion());		            
		    	if(a.getPublicacionid()==MostrarInfo){%>
		        <div class="col-lg-10 col-xl-8 offset-lg-1 offset-xl-2">
		            <div class="intro">
		                <h2 class="text-center"><b><%=a.getTitulo() %></b></h2>
		                <br>
		                <p class="text-center"><span class="date">Publicado: <%=fechaCreacion %> </span></p>		                            
		                <p class="text-justify" ><%=a.getDescripcion()%></p>
		                <br>		            
		            </div>
		       <%if(a.getMultimedia1()!=null){ %>
		            <div>
		            <br>		        		        
		            <h3 class="text-center">Multimedia</h3>
		            <br>
		                <img class="img-fluid mx-auto d-block" src="<%=a.getMultimedia1()%>">		
		            <br>		            					
		            </div>
		        <%}%>		       
		          <%if(a.getMultimedia2()!=null){ %>
		          <h3 class="text-center">Documento</h3>		          
		           <div class="container mt-5" align="center">
		            <a href="<%=a.getMultimedia2()%>" target="_blank"><img id="PDf" class="img-fluid" src="img/pdf.svg"  alt="PDF"
						style="width: 300px; height: 200px; border-bottom-color: white; margin: 2px;" /></a>	
		            </div>
		         <%}%>
       		 </div>
       		 <%
		      }
       		 } 
       		 %>
       		 <div class="container" style="margin-top:300px;">
       		 </div>
    </div>
    <br>
    <br>

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