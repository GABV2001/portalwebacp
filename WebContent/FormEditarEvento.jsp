<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"import = "entidades.Evento, datos.Dt_Evento,entidades.Rol,vistas.ViewRolUsuario, vistas.ViewRolOpcion, datos.Dt_Rol,datos.Dt_RolOpcion, java.util.*;"%>
<%
	response.setHeader( "Pragma", "no-cache" );
	response.setHeader( "Cache-Control", "no-store" );
	response.setDateHeader( "Expires", 0 );
	response.setDateHeader( "Expires", -1 );
	
	ViewRolUsuario vru = new ViewRolUsuario();
	Dt_RolOpcion dtro = new Dt_RolOpcion();
	ArrayList<ViewRolOpcion> listOpc = new ArrayList<ViewRolOpcion>();
	
	//OBTENEMOS LA SESION
	vru = (ViewRolUsuario)session.getAttribute("acceso");
	if(vru==null){
		response.sendRedirect("login.jsp?msj=401");
	}
	else{
		//OBTENEMOS LA LISTA DE OPCIONES ASIGNADAS AL ROL
		listOpc = dtro.listaRolOpc(vru.getRolid());
		
		//RECUPERAMOS LA URL = MI OPCION ACTUAL
		int index = request.getRequestURL().lastIndexOf("/");
		String miPagina = request.getRequestURL().substring(index+1);
		boolean permiso = false; //VARIABLE DE CONTROL
		
		//VALIDAR SI EL ROL CONTIENE LA OPCION ACTUAL DENTRO DE LA MATRIZ DE OPCIONES
		for(ViewRolOpcion vrop : listOpc){
			if(vrop.getOpcion().trim().equals(miPagina.trim())){
				permiso = true; //ACCESO CONCEDIDO
				break;
			}
		}
		
		if(!permiso){
			response.sendRedirect("401.jsp");
		}	
	}
	ViewRolUsuario vrgu = new ViewRolUsuario();
	vrgu =(ViewRolUsuario) session.getAttribute("acceso");
	
	//Control Usuario
	int usuarioid =0;
	
	if((ViewRolUsuario) session.getAttribute("acceso") == null){
		
	}else{
		vrgu =(ViewRolUsuario) session.getAttribute("acceso");
		usuarioid = vrgu.getUsuarioid();
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

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
               			 <%
                            	String evID = "";
               					evID = request.getParameter("idE")==null?"0":request.getParameter("idE");
														
								Evento ev = new Evento();
								Dt_Evento dte = new Dt_Evento();
								ev = dte.getEvento(Integer.parseInt(evID));						
                         	   %>

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
                                     <form class="Producto" method="post" action="./Sl_GestionEvento" enctype="multipart/form-data">
                                     	<input name="usuarioid" type="hidden" value="<%=usuarioid%>" />               					                                                               
                                      <input name="eventoid" type="hidden" value="<%=ev.getEventoid()%>" />                            
                      				  <input name="opcion" type="hidden" value="2" />
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
													    <label class="custom-file-label text-left" for="customFile" id="filmultEv" name="filmultEv">Evento.jpg</label>
													    <input type="file" class="custom-file-input" id="multEvento" name="multEvento" onchange="Test.UpdatePreview(this)" accept="image/jpeg" title="Evento.jpg" >
														<input type="hidden" name="url_foto" value="<%=ev.getMultimedia()%>">																		
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
	  $(document).ready(function()
		{
			$("#txtNombreEvento").val("<%=ev.getNombre()%>");
			$("#txtDescripcionEvento").val("<%=ev.getDescripcion()%>");	
			$("#datefInicioEvento").val("<%=ev.getFechainicio()%>");
			$("#timehoraInicioEvento").val("<%=ev.getHorainicio()%>");
			$("#datefFinalEvento").val("<%=ev.getFechafin()%>");
			$("#timehoraFinEvento").val("<%=ev.getHorafin()%>");
			$("#cbxTipoEvento").val("<%=ev.getTipoevento()%>");
			$("#txthipervinculoEvento").val("<%=ev.getHipervinculo()%>");
			$("#txtUbicacionEvento").val("<%=ev.getUbicacion()%>");
	 });
	 </script>  
    
      <script>  $('#multEvento').on("change",function() {
	     var i = $(this).prev('label').clone();
	      var file = $('#multEvento')[0].files[0].name;
	      $(this).prev('label').text(file);
	    });
	</script>
</body>
</html>