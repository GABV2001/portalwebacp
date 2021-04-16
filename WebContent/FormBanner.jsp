<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="entidades.Banner, datos.Dt_Banner, java.util.*;"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Portal ACP - Formulario Banner </title>

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
                                        <form class = "Banner"  method="post" action="./Sl_GestionBanner"> 
                                         <input name="opcion" type="hidden" value="1" />
                                    	<input name="posicion"  type = "hidden" value="<%=pos%>" />
                                         <div class="form-group">
                                                <label for="formGroupExampleInput">Titulo:</label>
                                                <input type="text" class="form-control" name= "txtTituloBanner" id="tituloBanner" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="nombreCP" class="form-label fw-bolder">Descripción:</label>
                                                <textarea rows="4" class="form-control" name = "txtDescripcionBanner" id="descripciónBanner" required></textarea>
                                            </div>
                                             <div class="form-group">
                                                <label for="custom-file">Imagen:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Archivo</span>
                                                    </div>
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="multBanner" accept="image/*" >
                                                        <label class="custom-file-label text-truncate" for="multBanner"
                                                            id="labelmulBanner">Seleccionar archivo...</label>
                                                    </div>
                                                </div>
                                            </div>
                                          <div class="text-center">
				                                <input class="btn btn-primary btn-user btn-block" type="submit" value="Guardar" />
				                            </div>
				                            <br>
				                         
                                            <div style="text-align:center;"><a href="GestionBanner.jsp"><i
                                                        class="fas fa-undo"></i>&nbsp;Volver a la tabla</a></div>
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
		var inputbtn = document.getElementById("multBanner");
	    var customTxt = document.getElementById("labelmulBanner");
	   		
		            
		      inputbtn.addEventListener("change", function () {
		          if (inputbtn.value) {
		              customTxt.innerHTML = inputbtn.value.match(
		                  /[\/\\]([\w\d\s\.\-\(\)]+)$/
		              )[1];
		          } else {
		              customTxt.innerHTML = "Seleccionar archivo...";
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