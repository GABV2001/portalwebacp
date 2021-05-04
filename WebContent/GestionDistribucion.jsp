<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="vistas.ViewDistribucion,datos.Dt_Distribucion,java.util.*;" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Portal ACP - Gestión Distribución</title>
    
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

        <!-- Menu -->
    	<jsp:include page="adminMenus.jsp" />  

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Distribución</h1>

                    <!-- DataTales -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Gestión Distribución</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <div style="text-align:right;"><a href="FormDistribucion.jsp"><i
                                                class="fas fa-plus-square"></i>&nbsp; Nuevo Distribución</div></a>
                                                  <%
                                                  	ArrayList<ViewDistribucion> listDistribucion = new ArrayList<ViewDistribucion>();
                                                    Dt_Distribucion dtu = new Dt_Distribucion();
                                                    listDistribucion = dtu.listaViewDistribucion();
                                                  %>
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Descripción</th>
                                            <th>Región</th>                                            
                                            <th>Opciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Nombre</th>                                            
                                            <th>Descripción</th>
                                            <th>Región</th>
                                            <th>Opciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                           <%
                                       		for(ViewDistribucion us: listDistribucion){
                                       	%>
                                       	<tr> 
                                       	    <td><%=us.getDistribucion() %></td>                                           
                                            <td><%=us.getDescripcion() %></td>
                                             <td><%=us.getRegion() %></td>
                         		       <td>&nbsp;&nbsp;<a href="EditarDistribucion.jsp"><i
                                                        class="fas fa-edit"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                    href="#"><i class="far fa-trash-alt"></i></td>                                   
                                       </tr>
                                           <%
                                       		}
                                           %>                                
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
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
