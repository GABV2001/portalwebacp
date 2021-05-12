package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_TipoProducto;
import entidades.TipoProducto;

/**
 * Servlet implementation class Sl_GestionTipoProducto
 */
@WebServlet("/Sl_GestionTipoProducto")
public class Sl_GestionTipoProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionTipoProducto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int idTipoProducto =0;
		idTipoProducto = Integer.parseInt(request.getParameter("idTp"));
		Dt_TipoProducto dtp = new Dt_TipoProducto();
		
		if(dtp.eliminarTipoProducto(idTipoProducto)) {
        	response.sendRedirect("GestionTipoProductos.jsp?msj=5");
        }
        else {
        	response.sendRedirect("GestionTipoProductos.jsp?msj=6");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
				//Obtenemos el valor de opcion
				int opc = 0;
				opc = Integer.parseInt(request.getParameter("opcion"));
				
				//Construir objeto estudiante
				Dt_TipoProducto dtp = new Dt_TipoProducto();
				TipoProducto tp = new TipoProducto();
				tp.setNombre(request.getParameter("nombreTipoProducto"));
				tp.setDescripcion(request.getParameter("descripcionTipoProducto"));
				
				switch (opc){
				case 1:{
					
				        try {
				        	if(dtp.guardarTipoProducto(tp)) {
					        	response.sendRedirect("GestionTipoProductos.jsp?msj=1");
					        }
					   
					         else {
					        	response.sendRedirect("GestionTipoProductos.jsp?msj=2");
					        }	        	
				        }
				        catch(Exception e) {
				        	System.out.println("Sl_GestionTipoProducto, el error es: " + e.getMessage());
							e.printStackTrace();
				        }				        
						break;
					}
				case 2:{
					tp.setTipoproducotid(Integer.parseInt(request.getParameter("idTipoProducto")));
		     		try {
						   if(dtp.modificarTipoProducto(tp)) {
				        	response.sendRedirect("GestionTipoProductos.jsp?msj=3");
				        }
				        else {
				        	response.sendRedirect("GestionTipoProductos.jsp?msj=4");
				        }
			        }
			        catch(Exception e) {
			        	System.out.println("Sl_GestionTipoProducto, el error es: " + e.getMessage());
						e.printStackTrace();
			        }
						break;
					
					}
				default:
					response.sendRedirect("GestionTipoProducto.jsp?msj=7");	
					break;
				}
			
	}
}
