<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="vistas.ViewArbol,datos.Dt_Arbol,java.util.*;" %>
<!DOCTYPE html>
<html lang="es">
<%
	//Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Portal ACP - Gestión Árbol</title>

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
                    <h1 class="h3 mb-2 text-gray-800">Árbol</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Gestión Árbol</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <div style="text-align:right;"><a href="FormArbol.jsp"><i
                                                class="fas fa-plus-square"></i>&nbsp; Nuevo Árbol</div></a>
                                    <%
                                    ArrayList<ViewArbol> listArbol = new ArrayList<ViewArbol>();
                                    Dt_Arbol dtu = new Dt_Arbol();
                                    listArbol = dtu.listaArbol();
                                    %>
                                    <thead>
                                        <tr>
                                            <th>Nombre común</th>
                                            <th>Nombre científico</th>
                                            <th>Descripción</th>
                                            <th>Multimedia</th>
                                            <th>Genero</th>
                                            <th>Familia</th>
                                            <th>Floración</th>
                                            <th>Distribución</th>                                      
                                            <th>Opciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Nombre común</th>
                                            <th>Nombre científico</th>
                                            <th>Descripción</th>
                                            <th>Multimedia</th>
                                            <th>Genero</th>
                                            <th>Familia</th>
                                            <th>Floración</th>
                                            <th>Distribución</th>                                     
                                            <th>Opciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                         <%
                                         	for(ViewArbol us: listArbol){
                                         %>
                                       	<tr> 
                                       	    <td><%=us.getNombreComun() %></td>
                                       	    <td><%=us.getNombreCientifico() %></td>                                           
                                            <td><%=us.getDescripcion() %></td>                                 
                                            <td>&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#modalVisualizarImagen" >
                        							<i class="fas fa-camera mostrarImagen" title="<%=us.getMultimedia()%>" onClick="getValue()"></i>
                        							</a></td>
                                         <td><%=us.getNombreGenero() %></td>                                            
                                            <td><%=us.getNombreFam() %></td>
                                            <td><%=us.getNombreFlo() %></td>
                                            <td><%=us.getNombreDis() %></td>                                                                                        
                        			       <td>&nbsp;&nbsp;<a href="FormEditarArbol.jsp?idS=<%=us.getArbolID()%>"><i class="fas fa-edit"></i></a>
                                                        
                                                   &nbsp;&nbsp;<a class="ajax-link" href="javascript:void(0);" 
                                           			onclick="$.jAlert({
                                           		    'type': 'confirm',
                                           		    'confirmQuestion': '¿Estás seguro que deseas eliminar este Servicio',
                                           		    'onConfirm': function(e, btn){
                                           		      e.preventDefault();
                                           		      //do something here

                                           		      window.location.href = 'Sl_GestionArbol?idA=<%=us.getArbolID()%>';
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
                        						</a></i></td>            
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
        if(mensaje == "3")
        {
            successAlert('Exito', 'Los datos han sido actualizados exitosamente');
        }
        if(mensaje == "5")
        {
            errorAlert('Exito', 'Los datos han sido eliminado exitosamente');
        }
    });
	</script>
	
	<script type="text/javascript">
    function getValue()
    {   	
        var a= event.srcElement.title;
        document.getElementById("preview").src = a;
    }
    </script>
</body>
</html>