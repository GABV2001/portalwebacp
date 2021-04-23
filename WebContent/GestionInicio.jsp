<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "entidades.Home, datos.Dt_Home, java.util.*;"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Portal ACP - Gestión Inicio</title>

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
									<%ArrayList<Home> listHome = new ArrayList<Home>();
									Dt_Home dth = new Dt_Home();
									listHome = dth.ListarHome();
									
									int idinicio = 0;
									int idUsuario = 0;
									String Historia = null;
									String Mision = null;
									String Vision = null;
									String Img_historia =null;
									String Img_vision = null;
									String Img_mision = null;
									
									Home hm = new Home();
									hm = listHome.get(0);
									idinicio = hm.getHomeID();
									idUsuario = hm.getUsuarioID();
									Historia = hm.getHistoria();
									Mision = hm.getMision();
									Vision = hm.getVision();
									Img_historia = hm.getImg_historia();
									Img_vision = hm.getImg_vision();
									Img_mision= hm.getImg_mision();
									
									 %>
                                        <form class="Inicio" method="post" action="./Sl_GestionInicio">
                						<!-- El valor de estos input es para el Servlet opcion editar -->                			
                                        	<input name="idInicio" type="hidden" value="<%=idinicio%>" />
                                        	<input name="idUsuario" type="hidden" value="<%=idUsuario%>" />                                        	
                            				<input name="opcion" type="hidden" value="1" />
                                            <h3>Historia</h3>
                                            <hr class="bg-dark w-auto">
                                            <div class="form-group">
                                                <label for="custom-file">Imagen:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Archivo</span>
                                                    </div>
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="multHistoria" name= "multHistoria"accept="image/*">
                                                        <label class="custom-file-label text-truncate" for="multHistoria"
                                                            id="labelmulHistoria"><%=Img_historia%></label>
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
                                                        <input type="file" class="custom-file-input" id="multMision" name= "multMision" accept="image/*">
                                                        <label class="custom-file-label text-truncate" for="multMision"
                                                            id="labelmulMision"><%=Img_mision%></label>
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
                                                        <input type="file" class="custom-file-input" id="multVision" name="multVision" accept="image/*">
                                                        <label class="custom-file-label text-truncate" for="multVision"
                                                            id="labelmulVision"><%=Img_vision%></label>
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


	<script>

	var inputbtn = document.getElementById("multHistoria");
    var customTxt = document.getElementById("labelmulHistoria");
    
	fileChange(inputbtn, customTxt);
    
	var inputbtn = document.getElementById("multMision");
    var customTxt = document.getElementById("labelmulMision");
    
	fileChange(inputbtn, customTxt);
    
    var inputbtn = document.getElementById("multVision");
    var customTxt = document.getElementById("labelmulVision");
            
	fileChange(inputbtn, customTxt);
    
	function fileChange(p1, p2){
		var inputbtn = p1 
	      var customTxt = p2
	            
	      inputbtn.addEventListener("change", function () {
	          if (inputbtn.value) {
	              customTxt.innerHTML = inputbtn.value.match(
	                  /[\/\\]([\w\d\s\.\-\(\)]+)$/
	              )[1];
	          } 
	      });
	}
 </script>
	
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


</body>

</html>