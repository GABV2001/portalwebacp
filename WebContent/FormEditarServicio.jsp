<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
 import="entidades.Servicio, datos.Dt_Servicio, java.util.*;" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
  
      <title>Portal ACP - Formulario Servicio</title>
      
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
                            	String srID = "";
							 	srID = request.getParameter("idS")==null?"0":request.getParameter("idS");
														
								Servicio sr = new Servicio();
								Dt_Servicio dts = new Dt_Servicio();
								sr = dts.getServicio(Integer.parseInt(srID));						
                         	   %>
                    <!-- Formulario -->
   			   		  <div class="container">
                        <header class="text-center text-white">
                            <script src="https://kit.fontawesome.com/a41f4b8198.js" crossorigin="anonymous"></script>
                        </header>
                        <div class="row">
                            <div class="col-lg-10 mx-auto m-auto">
                                <div class="card rounded shadow border-0">

                                    <div class="card-header">
                                        <h3 class="card-title text-left">Formulario Servicio</h3>
                                    </div>
                                    <div class="card-body">
                                      <form class="Servicio" method="post" action="./Sl_GestionServicio" enctype="multipart/form-data">
                                         <input name="servicioid" type="hidden" value="<%=sr.getServicioid()%>" />                            
                      					<input name="opcion" type="hidden" value="2" />
                                      <div class="form-group">
                                                <label for="nombreS" class="form-label fw-bolder">Nombre:</label>
                                                <input type="text" class="form-control" id="nombreServicio" name="nombreServicio" minlength="10" maxlength="200" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="descripciónS"
                                                    class="form-label fw-bolder">Descripción:</label>
                                                <textarea rows="4" class="form-control" id="descripcionServicio" name= "descripcionServicio" minlength="25" maxlength="350" required></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="custom-file">Imagen:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Archivo</span>
                                                    </div>
                                                   <div class="custom-file">
													    <label class="custom-file-label text-left" for="customFile" id="filmultSer" name="filmultSer">Servicio.jpg</label>
													    <input type="file" class="custom-file-input" id="multSer" name="multSer" onchange="Test.UpdatePreview(this)" accept="image/jpeg" title="Servicio.jpg" >
														<input type="hidden" name="url_foto" value="<%=sr.getMultimedia()%>">									
													</div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                             <label>Estado:</label>  
                                                <select class="form-control"  id="cbxEstadoServicio" name="cbxEstadoServicio">                                            	
                                    			<option value="">Seleccionar</option>                                    			                                            	
                                    			<option value="1">Disponible</option>
                                    			<option value="2">No disponible</option>
                                    	        </select>
                                    	      </div>                                            
                                            <div class="mb-3">
                                                <button class="btn btn-primary" style="width: 100%;">Guardar</button>
                                            </div>
                                            <div style="text-align:center;"><a href="GestionServicio.jsp"><i
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
			$("#nombreServicio").val("<%=sr.getNombre()%>");
			$("#descripcionServicio").val("<%=sr.getDescripcion()%>");	
			$("#cbxEstadoServicio").val("<%=sr.getEstadoservicio()%>");	
		});
	 </script>  
	 
	  <script>  $('#multSer').on("change",function() {
	     var i = $(this).prev('label').clone();
	      var file = $('#multSer')[0].files[0].name;
	      $(this).prev('label').text(file);
	    });
	</script>	
</body>
</html>