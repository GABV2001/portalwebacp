<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Portal ACP - Gesti�n Inicio</title>

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
                                        <form>
                                            <h3>Historia</h3>
                                            <hr class="bg-dark w-auto">
                                            <div class="form-group">
                                                <label for="custom-file">Imagen:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Subir</span>
                                                    </div>
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input"
                                                            id="inputGroupFile01">
                                                        <label class="custom-file-label"
                                                            for="inputGroupFile01">Seleccionar
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="nombreCP" class="form-label fw-bolder">Descripci�n:</label>
                                                <textarea id="descripci�nCP" rows="4" class="form-control"></textarea>
                                            </div>
                                            <h3>Misi�n</h3>
                                            <hr class="bg-dark w-auto">
                                            <div class="form-group">
                                                <label for="custom-file">Imagen:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Subir</span>
                                                    </div>
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input"
                                                            id="inputGroupFile02">
                                                        <label class="custom-file-label"
                                                            for="inputGroupFile02">Seleccionar</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="nombreCP" class="form-label fw-bolder">Descripci�n:</label>
                                                <textarea id="descripci�nCP" rows="4" class="form-control"></textarea>
                                            </div>

                                            <h3>Visi�n</h3>
                                            <hr class="bg-dark w-auto">
                                            <div class="form-group">
                                                <label for="custom-file">Imagen:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Subir</span>
                                                    </div>
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input"
                                                            id="inputGroupFile03">
                                                        <label class="custom-file-label"
                                                            for="inputGroupFile03">Seleccionar</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="nombreCP" class="form-label fw-bolder">Descripci�n:</label>
                                                <textarea id="descripci�nCP" rows="4" class="form-control"></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <button class="btn btn-primary" style="width: 49%;">Guardar</button>
                                                <button class="btn btn-primary" style="width: 48%;">Visualizar</button>
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


</body>

</html>