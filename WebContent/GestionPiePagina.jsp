<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "entidades.Footer, datos.Dt_Footer, java.util.*;"
    %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Portal ACP - Gestión Pie De Página</title>

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
                        <div class="row ">
                            <div class="col-lg-11 m-auto">
                                <div class="card rounded shadow border-0">

									<%ArrayList<Footer> listFooter = new ArrayList<Footer>();
									Dt_Footer dtf = new Dt_Footer();
									listFooter = dtf.listFooter();
										
									String Descripcion = null;
									String Correo = null;
									String Telefono = null;
									String Extension =null ;
									String Logo = null;
									int idFooter =0;
									int idUsuario =0;
									
										Footer ft = new Footer();
										ft = listFooter.get(0);
										idFooter = ft.getFooterID();
										idUsuario = ft.getUsuarioID();
										Descripcion = ft.getDescripcion();
										Correo = ft.getCorreo();
										Telefono = ft.getTelefono();
									    Extension = ft.getExtencion();
										Logo = ft.getLogo();
									
									 %>
									 
						 			  <div class="card-header">
                                        <h2>
                                            Pie de Página
                                        </h2>
                                    </div>
                                    <div class="card-body bg-white rounded">
                                        <form class="PiePagina" method="post" action="./Sl_GestionPiePagina">
                                        	<!-- El valor de estos input es para el Servlet opcion editar -->                			
                                        	<input name="idFooter" type="hidden" value="<%=idFooter%>" />
                                        	<input name="idUsuario" type="hidden" value="<%=idUsuario%>" />  
                                        	<input name="opcion" type="hidden" value="1" />
                                        	                                      	
                                            <div class="form-group">
                                                <label>Dirección:</label>
                                                <input class="form-control" id="direccionFooter" name = "direccionFooter" value="<%=Descripcion%>" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Correo:</label>
                                                <input class="form-control" id = "correoFooter" name = "correoFooter" value="<%=Correo%>" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Telefono:</label>
                                                <input class="form-control" id="telefonoFooter" name = "telefonoFooter" value="<%=Telefono%>" required  >
                                            </div>
                                            <div class="form-group">
                                                <label>Extensión:</label>
                                                <input class="form-control" id= "extensionFooter" name = "extensionFooter" value="<%=Extension%>" required>
                                            </div>
                                           <div class="form-group">
                                                <label for="custom-file">Multimedia:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Archivo</span>
                                                    </div>
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input text-truncate" id="multiFooter" name="multiFooter" accept="image/* ">
                                                        <label class="custom-file-label text-truncate" for="multVision"
                                                            id="labelmulFooter"><%=Logo %></label>
                                                    </div>
                                                </div>
                                            </div>
                                      	 <div class="text-center">
				                                <input class="btn btn-primary btn-user btn-block" type="submit" value="Guardar" />
				                            </div>                             
                                        </form>
                                    </div>
                                </div>
                            </div>
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

	<!--File Custom JS -->
	   <script>
	    const inputbtn = document.getElementById("multiFooter");
        const customTxt = document.getElementById("labelmulFooter");

        inputbtn.addEventListener("change", function () {
            if (inputbtn.value) {
                customTxt.innerHTML = inputbtn.value.match(
                    /[\/\\]([\w\d\s\.\-\(\)]+)$/
                )[1];
            } else {
                customTxt.innerHTML = "Ningún archivo seleccionado";
            }
        });

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