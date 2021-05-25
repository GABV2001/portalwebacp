<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="entidades.Banner, datos.Dt_Banner, entidades.Rol,vistas.ViewRolUsuario, vistas.ViewRolOpcion, datos.Dt_Rol,datos.Dt_RolOpcion, java.util.*;"%>
<%
	response.setHeader( "Pragma", "no-cache" );
	response.setHeader( "Cache-Control", "no-store" );
	response.setDateHeader( "Expires", 0 );
	response.setDateHeader( "Expires", -1 );
	
	ViewRolUsuario vru = new ViewRolUsuario();
	Dt_RolOpcion dtro = new Dt_RolOpcion();
	ArrayList<ViewRolOpcion> listOpc = new ArrayList<ViewRolOpcion>();
	
	//OBTENEMOS LA SESION
	vru = (ViewRolUsuario)session.getAttribute("acceso");
	if(vru==null){
		response.sendRedirect("login.jsp?msj=401");
	}
	else{
		//OBTENEMOS LA LISTA DE OPCIONES ASIGNADAS AL ROL
		listOpc = dtro.listaRolOpc(vru.getRolid());
		
		//RECUPERAMOS LA URL = MI OPCION ACTUAL
		int index = request.getRequestURL().lastIndexOf("/");
		String miPagina = request.getRequestURL().substring(index+1);
		boolean permiso = false; //VARIABLE DE CONTROL
		
		//VALIDAR SI EL ROL CONTIENE LA OPCION ACTUAL DENTRO DE LA MATRIZ DE OPCIONES
		for(ViewRolOpcion vrop : listOpc){
			if(vrop.getOpcion().trim().equals(miPagina.trim())){
				permiso = true; //ACCESO CONCEDIDO
				break;
			}
		}
		
		if(!permiso){
			response.sendRedirect("401.jsp");
		}	
	}
	ViewRolUsuario vrgu = new ViewRolUsuario();
	vrgu =(ViewRolUsuario) session.getAttribute("acceso");
	
	//Control Usuario
	int usuarioid =0;
	
	if((ViewRolUsuario) session.getAttribute("acceso") == null){
		
	}else{
		vrgu =(ViewRolUsuario) session.getAttribute("acceso");
		usuarioid = vrgu.getUsuarioid();
	}
%>
<!DOCTYPE html>
<%
	//Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");
%>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Portal ACP - Formulario Banner </title>
    
     <!-- Icon -->
	<jsp:include page="imgShortIcon.jsp" />  
	

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    <!-- jAlert css  -->
	<link rel="stylesheet" href="jAlert/dist/jAlert.css" />
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Menu -->
        <jsp:include page="adminMenus.jsp" />    
        

                <!-- Begin Page Content -->
                <div class="container-fluid">
 						<%
                            	String pos = "";
								pos = request.getParameter("posicion")==null?"0":request.getParameter("posicion");                           															
                         %>
                    <!--Formulario-->
                    <div class="container">
                        <header class="text-center text-white">
                            <script src="https://kit.fontawesome.com/a41f4b8198.js" crossorigin="anonymous"></script>
                        </header>
                        <div class="row">
                            <div class="col-lg-10 mx-auto m-auto">
                                <div class="card rounded shadow border-0">

                                    <div class="card-header">
                                        <h3 class="card-title text-left">Banner</h3>
                                    </div>
                                    <div class="card-body">
                                        <form class = "Banner"  method="post" action="./Sl_GuardarBanner" enctype="multipart/form-data" > 
                                     	<input name="usuarioid"  type = "hidden" value="<%=usuarioid%>" />                                                                      	              
                                    	<input name="posicion"  type = "hidden" value="<%=pos%>" />
                                    	<input name="opcion" type="hidden" value="1" />              
                                   	     <div class="form-group">
                                                <label for="formGroupExampleInput">Titulo:</label>
                                                <input type="text" class="form-control" name= "txtTituloBanner" id="tituloBanner" minlength="5" maxlength="80" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="nombreCP" class="form-label fw-bolder">Descripción:</label>
                                                <textarea rows="4" class="form-control" name = "txtDescripcionBanner" id="descripcionBanner" minlength="5" maxlength="200" required></textarea>
                                            </div>
                                             <div class="form-group">
                                                <label for="custom-file">Imagen:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Archivo</span>
                                                    </div>
                                                   <div class="custom-file">
													    <label class="custom-file-label text-left" for="customFile" id="filmultBanner">Seleccionar archivo</label>
													    <input type="file" class="custom-file-input" id="multBanner" name="multBanner" onchange="Test.UpdatePreview(this)" accept="image/jpeg" required>
													</div>
                                                </div>
                                            </div>                                           
		                                  <div class="m-3" align="center">
												<img id="preview" src="img/Defecto.jpeg" name="preview"  alt="Imagen Banner"
													class="img-fluid" alt="Responsive image" style="width: 400px; height: 324px; border-bottom-color: white; margin: 2px;" />
											</div>
                                         	  	<div class="mb-2 text-center">
					                                <input class="btn btn-primary btn-user btn-block" type="submit" value="Guardar" />
					                            </div>
					                            <div class="mb-2 text-center">
					                                <input class="btn btn-google btn-user btn-block" type="reset" value="Cancelar" />
					                            </div>
				                            <br>
				                         
                                            <div style="text-align:center;"><a href="GestionBanner.jsp"><i
                                                        class="fas fa-arrow-circle-left"></i>&nbsp;Volver a la tabla</a></div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                            <!--termina formulario-->
                        </div>
                    </div>
                    <!-- Termina Formulario -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
         	<jsp:include page="adminFooter.jsp" />    

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
   	<jsp:include page="adminLogOutModal.jsp" />    
		   

    <!-- JAVASCRIPTS -->
    <link rel="stylesheet" href="vendor/datatables/jquery.dataTables.js">

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

	<!-- jAlert js -->
	<script src="jAlert/dist/jAlert.min.js"></script>
	<script src="jAlert/dist/jAlert-functions.min.js"></script>
	
	<script>		
	    $(document).ready(function() 
		{
	    	/////////// VARIABLE DE CONTROL MSJ ///////////
	        var mensaje = "";
	        mensaje = "<%=varMsj%>";

	        if(mensaje == "existe")
	        {
	            errorAlert('Error', 'El Titulo que esta intentando registrar ya existe en la base de datos!');
	        }
	    	
			//Función para previsualizar la imagen del banner
	    	Test = {
	    	        UpdatePreview: function(obj)
	    	        {
	    	          // if IE < 10 doesn't support FileReader
	    	          if(!window.FileReader)
	    	          {
	    	             
	    	          } 
	    	          else 
	    	          {
	    	             var reader = new FileReader();
	    	             var target = null;
	    	             
	    	             reader.onload = function(e) 
	    	             {
	    	              target =  e.target || e.srcElement;
	    	               $("#preview").prop("src", target.result);
	    	             };
	    	              reader.readAsDataURL(obj.files[0]);
	    	          }
	    	        }
	    	    };
		});
	    
	    $('#multBanner').on("change",function() {
		     var i = $(this).prev('label').clone();
		      var file = $('#multBanner')[0].files[0].name;
		      $(this).prev('label').text(file);

		    });
	</script>
</body>
</html>