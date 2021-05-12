<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "entidades.Evento, datos.Dt_Evento, java.util.*;"
%>
<!DOCTYPE html>
<html lang="en">
<%            	
	ArrayList<Evento> listEvento = new ArrayList<Evento>();
	Dt_Evento dte = new Dt_Evento();
	listEvento = dte.listarEventos();
	
	Evento ev = new Evento();	
	int eventoid =0;	
	
	if(listEvento.size() == 0){
		eventoid= 1;	
	}	
	else{			
		ev = listEvento.get(listEvento.size() - 1);
		eventoid = ev.getEventoid() + 1;		
	}
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Portal ACP - Formulario Evento</title>
    
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
                    <div class="container ">
                        <header class="text-center text-white">
                            <script src="https://kit.fontawesome.com/a41f4b8198.js" crossorigin="anonymous"></script>
                        </header>
                        <div class="row">
                            <div class="col-lg-10 mx-auto">
                                <div class="card rounded shadow border-0">

                                    <div class="card-header">
                                        <h2>Formulario Evento</h2>
                                    </div>
                                    <div class="card-body bg-white rounded">
                                        <form class="Evento" method="post" action="./Sl_GestionEvento" enctype="multipart/form-data">
                      					<input name="opcion" type="hidden" value="1" />
                      					<input name="eventoid" type="hidden" value="<%=eventoid%>" />                   					                            
                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Nombre:</label>
                                                <input type="text" class="form-control" id="txtNombreEvento" name = "txtNombreEvento" required>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label>Descripción:</label>
                                                    <textarea class="form-control" rows="3" id ="txtDescripcionEvento" name = "txtDescripcionEvento" required ></textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Fecha Inicio:</label>
                                                <input type="date" class="form-control" id="datefInicioEvento" name = "datefInicioEvento" required>
                                            </div>

											 <div class="form-group">
                                                <label for="formGroupExampleInput">Hora Inicio:</label>
                                                <input type="time" class="form-control" id="timehoraInicioEvento" name = "timehoraInicioEvento" required>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Fecha Final:</label>
                                                <input type="date" class="form-control" id="datefFinalEvento" name = "datefFinalEvento" required>
                                            </div>
                                            
                                             <div class="form-group">
                                                <label for="formGroupExampleInput">Hora Final:</label>
                                                <input type="time" class="form-control" id="timehoraFinEvento" name = "timehoraFinEvento" required>
                                            </div>
                                                <div class="form-group">
                                                    <label for="formGroupExampleInput">Tipo de Evento:</label>
                                                    <select class="form-control" id= "cbxTipoEvento" name= "cbxTipoEvento" required>
                                                      	<option value = "0">Seleccionar...</option>
                                                        <option value="1">Agenda Pública</option>
                                                        <option value="2">Agenda Privada</option>
                                                    </select>
                                                </div>
    										 <div class="form-group">
                                                <label for="custom-file">Multimedia:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Archivo</span>
                                                    </div>
                                                   <div class="custom-file">
													    <label class="custom-file-label text-left" for="customFile" id="filmultEv" name="filmultEv">Seleccionar Archivo</label>
													    <input type="file" class="custom-file-input" id="multEvento" name="multEvento" onchange="Test.UpdatePreview(this)" accept="image/jpeg" >
													</div>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="formGroupExampleInput ">Hipervinculo:</label>
                                                <input type="text" class="form-control " id="txthipervinculoEvento" name = "txthipervinculoEvento">
                                            </div>

                                            <div class="form-group ">
                                                <label for="formGroupExampleInput ">Ubicación:</label>
                                                <input type="text " class="form-control " id="txtUbicacionEvento" name= "txtUbicacionEvento">
                                            </div>
                                            <div class="form-group text-center">
				                                <input class="btn btn-primary btn-user btn-block" type="submit" value="Guardar" />
				                            </div>
                                        </form>

                                        <div style="text-align: center; "><a href="GestionEvento.jsp"><i
                                                    class="fas fa-arrow-circle-left"></i>&nbsp;Volver a la tabla</div></a>
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
    
	<script> 
	$('#multEvento').on("change",function() {
	     var i = $(this).prev('label').clone();
	      var file = $('#multEvento')[0].files[0].name;
	   console.log(file);
	      $(this).prev('label').text(file);

	    });
	</script>	
</body>

</html>