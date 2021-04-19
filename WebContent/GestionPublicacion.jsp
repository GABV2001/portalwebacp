<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "entidades.Publicacion, datos.Dt_Publicacion, java.util.*;"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Portal ACP - Gestión Publicación</title>

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

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Publicación</h1>
                    
                    			<%
                                	ArrayList<Publicacion> listPost = new ArrayList<Publicacion>();
                                	Dt_Publicacion dtp = new Dt_Publicacion();
                                	listPost = dtp.ListaPost();                               	                   
                               	
                                %>

                    <!-- DataTales Publicacion  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Gestión Publicación</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <div style="text-align:right;"><a href="FormPublicacion.jsp"><i
                                                class="fas fa-plus-square"></i>&nbsp; Nueva Publicación</div></a>
                                    <thead>
                                        <tr>
                                            <th>Titulo</th>
                                            <th>Descripcion</th>
                                            <th>Multimedia</th>
                                            <th>Fecha</th>
                                            <th>Estado</th>
                                            <th>Opciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Titulo</th>
                     				        <th>Descripcion</th>
                                            <th>Multimedia</th>                             
                                            <th>Fecha</th>
                                            <th>Estado</th>
                                            <th>Opciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                   		 <%
                                       		for(Publicacion post: listPost){
                                       	%>
                                        <tr>
                                            <td><%=post.getTitulo() %></td>
                                            <td><%=post.getDescripcion()%></td>
                                            <td><%=post.getMultimedia() %></td>
                                            <td><%=post.getFecha() %></td>
                                            <td><%=post.getEstadopublicacion()==1?"Visible":"No Visible" %></td>
                                            <td>&nbsp;&nbsp;<a href="#"><i
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