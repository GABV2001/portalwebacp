<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" 
import="entidades.Rol,entidades.Opcion,entidades.RolOpcion,datos.Dt_Opcion,datos.Dt_Opcion,datos.Dt_Rol,datos.Dt_RolOpcion,java.util.*;" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
  
    <title>Portal ACP - Formulario Rol-Opciones</title>
    
     <!-- Icon -->
	 <jsp:include page="imgShortIcon.jsp" />  
    
    <link rel="icon" href="img/logo_jesuita.ico" type="img/ico">
  
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
                  	String rolOpcionID = "";
                	 rolOpcionID = request.getParameter("rolopcID")==null?"0":request.getParameter("rolopcID");
											
					RolOpcion ro = new RolOpcion();
					Dt_RolOpcion dtro = new Dt_RolOpcion();
					ro = dtro.getRolOpcion(Integer.parseInt(rolOpcionID));
		            %>

                    <!-- Formulario -->
   			   		 <div class="container">
                        <div class="row">
                            <div class="col-lg-10 mx-auto m-auto">
                                <div class="card rounded shadow border-0">
                                    <div class="card-header">
                                        <h2>
                                            Formulario Rol-Opción
                                        </h2>

                                    </div>
                                    <div class="card-body bg-white rounded">
                                       <form class="Rol-Opcion" method="post" action="./Sl_GestionRolOpciones">
                                     	<input name="rolOpcionid" type="hidden" value="<%=ro.getIdrol_opc() %>" />                                        
                                   		<input name="opcion" type="hidden" value="2" />
                                         <div class="form-group">
                                           <div class="col-sm-12 mb-3">
                                            <%
		                                	ArrayList<Rol> listRol = new ArrayList<Rol>();
		                                	Dt_Rol dto = new Dt_Rol();
		                                	listRol = dto.listaRolActivos();
                                			%>
	                                    	<select class="form-control" name="cbxRol" id="cbxRol" required>
	                                 		<option value="" selected disabled>Seleccionar</option>                                  			                                            	                                    		
	                                    	<%
	                                    		for(Rol r: listRol){
	                                    	%>	
	                                    		<option value="<%=r.getIdRol()%>"><%=r.getRol()%></option>
	                                    	<%
	                                    		}
	                                    	%>
	                                    	</select>
	                                    	</div>
                                            <div class="col-sm-12 mb-3">
                                            <%
		                                	ArrayList<Opcion> listOpc = new ArrayList<Opcion>();
		                                	Dt_Opcion dtr = new Dt_Opcion();
		                                	listOpc = dtr.listarOpc();
	                                		%>
	                                    	<select class="form-control" name="cbxOpc" id="cbxOpc" required>
											<option value="" selected disabled>Seleccionar</option>                                    			                                            	
                                   			<%
	                                    		for(Opcion opc: listOpc){
	                                    	%>	
	                                    		<option value="<%=opc.getId_opc()%>"><%=opc.getOpcion()%></option>
	                                    	<%
	                                    		}
	                                    	%>                                    	
                                   			</select>
                                            </div>
                                            </div>
                                         	 <div class="form-group text-center">
				                                <input class="btn btn-primary btn-user btn-block" type="submit" value="Guardar" />
				                            </div>  
                                          <div style="text-align:center;"><a href="GestionRolOpcion.jsp"><i
                                                        class="fas fa-arrow-circle-left"></i>&nbsp;Volver a la tabla</a></div>
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
		$("#cbxOpc").val("<%=ro.getId_opc()%>");
		$("#cbxRol").val("<%=ro.getRolid()%>");
	});
</script>
</body>
</html>