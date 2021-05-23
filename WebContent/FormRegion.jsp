<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="entidades.Pais,datos.Dt_Pais,java.util.*;" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
  
    <title>Portal ACP - Formulario Región</title>
    
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
                        <div class="row">
                            <div class="col-lg-10 mx-auto m-auto">
                                <div class="card rounded shadow border-0">

                                    <div class="card-header">
                                        <h2>
                                            Región
                                        </h2>

                                    </div>
                                    <div class="card-body bg-white rounded">
                                        <form class="Region" method="post" action="./Sl_GestionRegion">
                                        <input name="opcion" type="hidden" value="1" />
                                            <div class="form-group">
                                                <label>Nombre de la región:</label>
                                                <input class="form-control" name = "txtNombreRegion" id ="txtNombreRegion">
                                            </div>
                                            <div class="form-group">
                                                <label>Descripcion:</label>                                                
                                                <textarea class="form-control" rows="3" name = "txtDescripcionRegion" id ="txtDescripcionRegion"></textarea>
                                            </div>
                                            <div class="form-group">
                                            <%                                            
                                            ArrayList<Pais> listPais = new ArrayList<Pais>();
                                            Dt_Pais dtu = new Dt_Pais();
                                            listPais = dtu.listaPais();
                                            %>
                                                <label>País:</label>
                                                <select class="form-control" name = "txtNombrePais" id ="txtNombrePais">
                                            <%
                                    		for(Pais u: listPais){
                                    	    %>	
                                    		<option value="<%=u.getPaisID()%>"><%=u.getNombre()%></option>
                                    	    <%
                                    		}
                                    	    %>                                    	
                                            </select>
                                            </div>

                                            <div class="mb-3">
                                                 <input class="btn btn-primary btn-user btn-block" type="submit" value="Guardar" />
                                            </div>
                                            <div style="text-align:center;"><a href="GestionRegion.jsp"><i
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