<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

   <title>Portal ACP - Formulario �rbol</title>
  
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
                        <div class="row">
                            <div class="col-lg-10 mx-auto m-auto">
                                <div class="card rounded shadow border-0">

                                    <div class="card-header">
                                        <h2>
                                            Cat�logo del �rbol
                                        </h2>

                                    </div>
                                    <div class="card-body bg-white rounded">
                                        <form>
                                            <div class="form-group">
                                                <label>Nombre com�n:</label>
                                                <input class="form-control">

                                            </div>
                                            <div class="form-group">
                                                <label>Nombre cient�fico:</label>
                                                <input class="form-control">

                                            </div>

                                            <div class="form-group">
                                                <label>Descripci�n:</label>
                                                <textarea class="form-control" rows="3"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>G�nero del �rbol:</label>
                                                <select class="form-control">
                                                    <option value="value1">genero 1</option>
                                                    <option value="value2">genero 2</option>
                                                    <option value="value3">genero 3</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Familia del �rbol:</label>
                                                <select class="form-control">
                                                    <option value="value1">familia 1</option>
                                                    <option value="value2">familia 2</option>
                                                    <option value="value3">familia 3</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Floracion del �rbol:</label>
                                                <select class="form-control">
                                                    <option value="value1">floraci�n 1</option>
                                                    <option value="value2">floraci�n 2</option>
                                                    <option value="value3">floraci�n 3</option>
                                                </select>
                                            </div>


                                            <div class="form-group">
                                                <label>Distribuci�n del �rbol:</label>
                                                <select class="form-control">
                                                    <option value="value1">distribuci�n 1</option>
                                                    <option value="value2">distribuci�n 2</option>
                                                    <option value="value3">distribuci�n 3</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Ubicaci�n en el mapa:</label>
                                                <select class="form-control">
                                                    <option value="value1">sector 1</option>
                                                    <option value="value2">sector 2</option>
                                                    <option value="value3">sector 3</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <button class="btn btn-primary" style="width: 100%;">Guardar</button>
                                            </div>
                                            <div style="text-align:center;"><a href="GestionArbol.jsp"><i
                                                        class="fas fa-undo"></i>&nbsp;Volver a la tabla</a></div>
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