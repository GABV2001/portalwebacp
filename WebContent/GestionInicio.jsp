<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "entidades.Home, datos.Dt_Home, java.util.*;"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Portal ACP - Gestión Inicio</title>
    
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
     <title>Portal ACP - Gestión Inicio</title>
    
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
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

    <!-- Menus -->
	<jsp:include page="adminMenus.jsp" />      
	
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Formulario -->
                    <div class="container">
                        <header class="text-center text-white">
                            <script src="https://kit.fontawesome.com/a41f4b8198.js" crossorigin="anonymous"></script>
                        </header>
                        <div class="row ">
                            <div class="col-lg-10 m-auto">
                                <div class="card rounded shadow border-0">
                                    <div class="card-header">
                                        <h2 class="card-title text-center">Inicio</h2>
                                    </div>
                                    <div class="card-body">
                                    
									<%
									ArrayList<Home> listHome = new ArrayList<Home>();
									Dt_Home dth = new Dt_Home();
									listHome = dth.ListarHome();									
									Home hm = new Home();
									hm = listHome.get(0);
																		
								    String Img_historia =null;
								 	String Img_vision = null;
									String Img_mision = null;
								
								    Img_historia = hm.getImg_historia();
									Img_vision = hm.getImg_vision();
									Img_mision= hm.getImg_mision();
									
									 %>
                                        <form class="Inicio" method="post" action="./Sl_GestionInicio" enctype="multipart/form-data">
                						<!-- El valor de estos input es para el Servlet opcion editar -->                			
                                        	<input name="idInicio" type="hidden" value="<%=hm.getHomeID()%>" />
                                        	<input name="idUsuario" type="hidden" value="<%= hm.getUsuarioID()%>" />                                        	
                            				<input name="opcion" type="hidden" value="1" />
                                            <h3>Historia</h3>
                                            <hr class="bg-dark w-auto">
                                            <div class="form-group">
                                            <div class="form-group">
                                                <label for="custom-file">Imagen:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Archivo</span>
                                                    </div>
                                                   <div class="custom-file">
													    <label class="custom-file-label text-left" for="customFile" id="filmultHistoria">Historia.jpg</label>
													    <input type="file" class="custom-file-input" id="multHistoria" name="multHistoria"  accept="image/jpeg" title="Historia.jpg">
													   <input type="hidden" name="urlfotoHistoria" value="<%=Img_historia%>">									
													</div>
                                                </div>
                                            </div> 
                                            <div class="mb-3">
                                                <label for="nombreCP" class="form-label fw-bolder">Descripción:</label>
                                                <textarea id="descripcionHis" name = "descripcionHis"  rows="10" class="form-control"><%=hm.getHistoria() %></textarea>
                                            </div>
                                            <h3>Misión</h3>
                                            <hr class="bg-dark w-auto">
                                           <div class="form-group">
                                                <label for="custom-file">Imagen:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Archivo</span>
                                                    </div>
                                                   <div class="custom-file">
													    <label class="custom-file-label text-left" for="customFile" id="filmultMision">Mision.jpg</label>
													    <input type="file" class="custom-file-input" id="multMision" name="multMision"  accept="image/jpeg" title="Mision.jpg">
													    <input type="hidden" name="urlfotoMision" value="<%=Img_mision%>">																		
													</div>
                                                </div>
                                            </div> 
                                            <div class="mb-3">
                                                <label for="nombreCP" class="form-label fw-bolder">Descripción:</label>
                                                <textarea id="descripcionMis" 	name = "descripcionMis" rows="4" class="form-control"><%=hm.getMision() %></textarea>
                                            </div>

                                            <h3>Visión</h3>
                                            <hr class="bg-dark w-auto">
                                            <div class="form-group">
                                                <label for="custom-file">Imagen:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Archivo</span>
                                                    </div>
                                                   <div class="custom-file">
													    <label class="custom-file-label text-left" for="customFile" id="filmultVision">Vision.jpg</label>
													    <input type="file" class="custom-file-input" id="multVision" name="multVision"  accept="image/jpeg" title="Vision.jpg">
													    <input type="hidden" name="urlfotoVision" value="<%=Img_vision%>">																												
													</div>
                                                </div>
                                            </div> 
                                            <div class="mb-3">
                                                <label for="nombreCP" class="form-label fw-bolder">Descripción:</label>
                                                <textarea id="descripcionVis" name = "descripcionVis" rows="4" class="form-control"><%=hm.getVision() %></textarea>
                                            </div>
                                      	 	<div class="text-center">
				                                <input class="btn btn-primary btn-user btn-block" type="submit" value="Guardar" />
				                            </div>  				                            
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
	
    <script>
   
    $('#multHistoria').on("change",function() {
	     var i = $(this).prev('label').clone();
	      var file = $('#multHistoria')[0].files[0].name;
	      $(this).prev('label').text(file);

	    });
    $('#multMision').on("change",function() {
	     var i = $(this).prev('label').clone();
	      var file = $('#multMision')[0].files[0].name;
	      $(this).prev('label').text(file);

	    });
    $('#multVision').on("change",function() {
	     var i = $(this).prev('label').clone();
	      var file = $('#multVision')[0].files[0].name;
	      $(this).prev('label').text(file);

	    });
   
</script>
</script>
</body>

</html>