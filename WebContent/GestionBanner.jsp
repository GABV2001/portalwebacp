<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
import = "entidades.Banner, datos.Dt_Banner, java.util.*;"%>
<!DOCTYPE html>
<%
	//Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");
%>
<html lang="en">
<head>

    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Portal ACP - Gesti�n Banner</title>
    
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
    
    <!-- jAlert css  -->
	<link rel="stylesheet" href="jAlert/dist/jAlert.css" />
    

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

    <!-- Menus -->
	<jsp:include page="adminMenus.jsp" />      
	
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Banner</h1>

      							<%
                                	ArrayList<Banner> listBanner = new ArrayList<Banner>();
                                	Dt_Banner dtb = new Dt_Banner();
                                	listBanner = dtb.ListarBanner();
                                	
                                	Banner ban = new Banner();
                               	
                                	int posicion = 0;
                                	if(listBanner.size() == 0){
                                		posicion= 1;	
                                	}	
                                	else{			
                                		ban = listBanner.get(listBanner.size() - 1);
                                		posicion = ban.getPosicion();		
                                	}    
                                    %>
                    <!-- DataTales Banner -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Gesti�n Banner</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <div style="text-align:right;"><a href="FormBanner.jsp?posicion=<%=ban.getPosicion()%>"><i
                                                class="fas fa-plus-square"></i>&nbsp; Nuevo Elemento</div></a>
                                    <thead>
                                        <tr>
                                             <th>Titulo</th>
                                            <th>Descripci�n</th>
                                            <th>Multimedia</th>
                                            <th>Opciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                              <th>Titulo</th>
                                            <th>Descripci�n</th>
                                            <th>Multimedia</th>
                                            <th>Opciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<%
                                       		for(Banner bn: listBanner){                                       		
                                       	%>
                                       <tr>
   	                                        <td><%=bn.getTitulobanner() %></td>
                                           <td><%=bn.getDescripcion() %></td>
                                           <td>&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#modalVisualizarImagen" >
                        							<i class="fas fa-camera mostrarImagen" title="<%=bn.getMultimedia()%>" onClick="getValue()"></i>
                        							</a></td>
                                             
                                                 <td>
                                                 &nbsp;&nbsp;<a href="FormEditarBanner.jsp?idB=<%=bn.getBannerID()%>"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;                                       
                                                 
                                                 <a class="ajax-link" href="javascript:void(0);" 
                                           		onclick="$.jAlert({
                                           		    'type': 'confirm',
                                           		    'confirmQuestion': '�Est�s seguro que deseas eliminar este elemento?',
                                           		    'onConfirm': function(e, btn){
                                           		      e.preventDefault();
                                           		      //do something here

                                           		      window.location.href = 'Sl_GestionBanner?idB=<%=bn.getBannerID()%>';
                                           		      btn.parents('.jAlert').closeAlert();
                                           		      return false;
                                           		    },
                                           		    'onDeny': function(e, btn){
                                           		      e.preventDefault();
                                           		      //do something here
                                           		      btn.parents('.jAlert').closeAlert();
                                           		      return false;
                                           		    }
                                           		  });">
                        							<i class="fas fa-trash-alt" title="Eliminar Elemento"></i>
                        						</a></i>
                        						
                        						
                        						</td>      
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
			
			
                     <!-- MODAL VISUALIZAR IMAGEN -->					
					<div class="modal fade" id="modalVisualizarImagen" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					       <h5 class="modal-title">Visualizar Imagen</h5>				
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					    	<div align="center">
									<img id="preview" src="" name="preview"  alt="Imagen Banner"
										class = "img-fluid"; border-bottom-color: white; margin: 2px;" />
								</div>								
					      </div>					 
					    </div>
					  </div>
					</div>					
					<!-- FIN Modal -->
					
				
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

	<!-- jAlert js -->
	<script src="jAlert/dist/jAlert.min.js"></script>
	<script src="jAlert/dist/jAlert-functions.min.js"></script>
	
	<script>
    $(document).ready(function ()
    {
        
	/////////// VARIABLE DE CONTROL MSJ ///////////
        var mensaje = "";
        mensaje = "<%=varMsj%>";

        if(mensaje == "1")
        {
            successAlert('Exito', 'El elemento se ha guardado exitosamente');
        }
        if(mensaje == "2")
        {
            errorAlert('Error', 'Revise los datos e intente nuevamente');
        }
        if(mensaje == "5")
        {
            errorAlert('Exito', 'Los datos han sido eliminado exitosamente');
        }       
    
       
    });
    function getValue()
    {   	
        var a= event.srcElement.title;
        document.getElementById("preview").src = a;
    }  
	</script>

</body>

</html>