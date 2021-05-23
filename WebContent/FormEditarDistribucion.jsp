<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
 import="entidades.Distribucion, datos.Dt_Distribucion, entidades.Region, datos.Dt_Region, java.util.*;" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

   <title>Portal ACP - Formulario Distribucion</title>
   
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
                               <%
                            	String dsID = "";
							 	dsID= request.getParameter("idD")==null?"0":request.getParameter("idD");
														
								Distribucion ds = new Distribucion();
								Dt_Distribucion dtr = new Dt_Distribucion();
								ds = dtr.getDistribucion(Integer.parseInt(dsID));						
                         	   %>
                    <!-- Formulario -->
                      <div class="container">
                        <div class="row ">
                            <div class="col-lg-10 mx-auto m-auto">
                                <div class="card rounded shadow border-0">
                                    <div class="card-header">
                                        <h2>
                                            Region
                                        </h2>
                                    </div>
                                    <div class="card-body bg-white rounded">                           
                                        <form role="form" class = "Region" method="post" action="./Sl_GestionDistribucion">
                      					<input name="opcion" type="hidden" value="2" />
                      						<input name="iddistribucion" type="hidden" value="<%=ds.getDistribucionID()%>" />
                                         <div class="form-group">
                                                <label>Nombre de la distribucion:</label>
                                                <input class="form-control" name = "txtNombreDistribucion" id ="txtNombreDistribucion" required>

                                                <div class="form-group">
                                                    <label>Descripción:</label>
                                                    <textarea class="form-control" rows="3" name = "txtDescripcionDistribucion" id = "txtDescripcionDistribucion" required></textarea>
                                                </div>
                                                 <div class="form-group">
                                            <%                                            
                                            ArrayList<Region> listRegion = new ArrayList<Region>();
                                            Dt_Region dtu = new Dt_Region();
                                            listRegion = dtu.listaRegion();
                                            %>
                                                <label>Region:</label>
                                                <select class="form-control" name = "txtNombreRegion" id ="txtNombreRegion" required>
                                            <%
                                    		for(Region u: listRegion){
                                    	    %>	
                                    		<option value="<%=u.getRegionID()%>"><%=u.getNombre()%></option>
                                    	    <%
                                    		}
                                    	    %>                                    	
                                            </select>
                                            </div>
                                            </div>
                                         	 <div class="text-center">
				                                <input class="btn btn-primary btn-user btn-block" type="submit" value="Guardar" />
				                            </div>  
                                            <div style="text-align:center;"><a href="GestionDistribucion.jsp"><i
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
    
    <script>  
	  $(document).ready(function()
		{
			$("#txtNombreDistribucion").val("<%=ds.getNombre()%>");
			$("#txtDescripcionDistribucion").val("<%=ds.getDescripcion()%>");
			$("#txtNombreRegion").val("<%=ds.getRegionID()%>");		 
		});
	 </script>  
</body>
</html>