<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
import="vistas.*, entidades.*, datos.*, java.util.*;"%>   
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
<%            	
	ArrayList<ViewArbol> listArbol = new ArrayList<ViewArbol>();
	Dt_Arbol dts = new Dt_Arbol();
	listArbol = dts.listaArbol();
	
	ViewArbol ar = new ViewArbol();
	
	int arbolid =0;
	
	if(listArbol.size() == 0){
		arbolid= 1;	
	}	
	else{			
		ar = listArbol.get(listArbol.size() - 1);
		arbolid = ar.getArbolID() +1 ;		
	}
	
	//Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


   <title>Portal ACP - Formulario Árbol</title>
   
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
                                            Catálogo del árbol
                                        </h2>

                                    </div>
                                    <div class="card-body bg-white rounded">
                                    
                                        <form class="Arbol" method="post" action="./Sl_GestionArbol" enctype="multipart/form-data">
                                         <input name="usuarioid" type="hidden" value="<%=usuarioid %>" />  
                                         <input name="arbolid" type="hidden" value="<%=arbolid %>" />                                      
                                          <input name="opcion" type="hidden" value="1" />                                        
                                            <div class="form-group">
                                                <label>Nombre común:</label>
                                                <input class="form-control"  name="txtNombreComun" id="txtNombreComun">

                                            </div>
                                            <div class="form-group">
                                                <label>Nombre científico:</label>
                                                <input class="form-control" name="txtNombreCientifico" id="txtNombreCientifico">

                                            </div>
                                            <div class="form-group">
                                                <label>Descripción:</label>
                                                <textarea class="form-control" rows="3"  name="txtDescripcionArbol" id="txtDescripcionArbol" required></textarea>
                                            </div>
                                             <div class="form-group">
                                                <label for="custom-file">Multimedia:</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Archivo</span>
                                                    </div>
                                                   <div class="custom-file">
													    <label class="custom-file-label text-left" for="customFile" id="filmultArb" name="filmultArb">Seleccionar Archivo</label>
													    <input type="file" class="custom-file-input" id="multArbol" name="multArbol" onchange="Test.UpdatePreview(this)" accept="image/jpeg" >
													</div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                            <%                                            
                                            ArrayList<Genero> listGenero = new ArrayList<Genero>();
                                            Dt_Genero dtu = new Dt_Genero();
                                            listGenero = dtu.listaGenero();
                                            %>
                                                <label>Género del árbol: &nbsp;<a href="GestionGenero.jsp"><i
                                                class="fas fa-plus-square"></i></a></label>  
                                                <select class="form-control" name="GeneroID" id="GeneroID">
                                                <option value="0" selected disabled>Seleccionar</option> 
                                            <%
                                    		for(Genero u: listGenero){
                                    	    %>	
                                    		<option value="<%=u.getGeneroID()%>"><%=u.getNombre()%></option>
                                    	    <%
                                    		}
                                    	    %>  
                                                </select>
                                            </div>   
                                             <%                                            
                                            ArrayList<Familia> listFamilia = new ArrayList<Familia>();
                                            Dt_Familia dtuf = new Dt_Familia();
                                            listFamilia = dtuf.listaFamilia();
                                            %>                             
                                            <div class="form-group">
                                                <label>Familia del árbol:  &nbsp;<a href="GestionFamilia.jsp"><i
                                                class="fas fa-plus-square"></i></a></label>
                                                <select class="form-control" name="FamiliaID" id="FamiliaID">
                                                <option value="0" selected disabled>Seleccionar</option> 
                                            <%
                                    		for(Familia u: listFamilia){
                                    	    %>	
                                    		<option value="<%=u.getFamiliaID()%>"><%=u.getNombre()%></option>
                                    	    <%
                                    		}
                                    	    %>  
                                                </select>
                                            </div>
                                             <%                                            
                                            ArrayList<Floracion> listFloracion = new ArrayList<Floracion>();
                                            Dt_Floracion dtf = new Dt_Floracion();
                                            listFloracion = dtf.listaFloracion();
                                            %>
                                            <div class="form-group">
                                                <label>Floracion del árbol:</label>
                                                <select class="form-control" name="FloracionID" id="FloracionID">
                                                <option value="0" selected disabled>Seleccionar</option> 
                                            <%
                                    		for(Floracion u: listFloracion){
                                    	    %>	
                                    		<option value="<%=u.getFloracionID()%>"><%=u.getNombre()%></option>
                                    	    <%
                                    		}
                                    	    %>  
                                                </select>
                                            </div>                                                                                                                                                                  
                                            <div class="mb-3">
                                                 <input class="btn btn-primary btn-user btn-block" type="submit" value="Guardar" />
                                            </div>
                                            <br>
                                            <div style="text-align:center;"><a href="GestionArbol.jsp"><i
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
	$('#multArbol').on("change",function() {
	     var i = $(this).prev('label').clone();
	      var file = $('#multArbol')[0].files[0].name;
	   console.log(file);
	      $(this).prev('label').text(file);

	    });
	</script>	

</body>
</html>