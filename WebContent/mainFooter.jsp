<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "entidades.Footer, datos.Dt_Footer, java.util.*;"%>
		<!-- footer -->
        <footer class="footer-clean bg-success">
            <div class="container">
                <div class="row justify-content-center">
                
                	<%
	             	ArrayList<Footer> listFooter = new ArrayList<Footer>();
					Dt_Footer dtf = new Dt_Footer();
					listFooter = dtf.listFooter();
						
					String Descripcion = null;
					String Correo = null;
					String Telefono = null;
					String Extencion =null ;
					String Logo = null;
					
					for(Footer ft : listFooter){
						Descripcion = ft.getDescripcion();
						Correo = ft.getCorreo();
						Telefono = ft.getTelefono();
					    Extencion = ft.getExtencion();
						Logo = ft.getLogo();
					}
	   			   %>                
                    <div class="col-sm-4 col-md-3 item">
                        <h3>Dirección</h3>
                        <ul>
                            <li><%=Descripcion%></li>
                        </ul>
                    </div>
                    <div class="col-sm-4 col-md-3 item">
                        <h3>Telefono</h3>
                        <ul>
                            <li><%=Telefono%> </li>
                        </ul>
                        <ul>
                            <li><a href="#">Ext: <%=Extencion%></a></li>
                        </ul>
                    </div>
                      <div class="col-sm-4 col-md-3 item">
                        <h3>Correo</h3>
                        <ul>
                            <li><%=Correo%> </li>
                        </ul>
                    </div>
                    <div class="col-sm-4 col-md-3 mt-auto item">
                        <img src="<%=Logo%>" alt="" class="img-fluid rounded mx-auto d-block" id="imgLogo">
                    </div>
                </div>                
                <%
			    Calendar cal=Calendar.getInstance();
			    int year=cal.get(Calendar.YEAR);
			    %>                
                <div>
                    <p class="copyright">Arboreto Carmelo Palma © <%=year %></p>
                </div>
                </div>
        </footer>
</html>