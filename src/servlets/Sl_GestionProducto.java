package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Producto;
import entidades.Producto;

/**
 * Servlet implementation class Sl_GestionProducto
 */
@WebServlet("/Sl_GestionProducto")
public class Sl_GestionProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionProducto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int idProducto =0;
		idProducto = Integer.parseInt(request.getParameter("idP"));
		Dt_Producto dtp = new Dt_Producto();
		
		if(dtp.eliminarProducto(idProducto)) {
        	response.sendRedirect("GestionProductos.jsp?msj=5");
        }
        else {
        	response.sendRedirect("GestionProductos.jsp?msj=6");
        }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//Obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));
		
		//Construir objeto estudiante
		Dt_Producto dts = new Dt_Producto();
		Producto pr = new Producto();
		pr.setProducto(request.getParameter("nombreProducto"));
		pr.setDescripcion(request.getParameter("descripcionProducto"));
		pr.setEstadoproductoid(Integer.parseInt(request.getParameter("cbxEstadoProducto")));		
		pr.setTipoproductoid(Integer.parseInt(request.getParameter("cbxTipoProducto")));
		
		switch (opc){
		case 1:{
			
		        try {
		        	if(dts.guardarProducto(pr)) {
			        	response.sendRedirect("GestionProductos.jsp?msj=1");
			        }
			   
			         else {
			        	response.sendRedirect("GestionProductos.jsp?msj=2");
			        }
			        	
		        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionProducto, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
	   	case 2:{
			pr.setProductoid(Integer.parseInt(request.getParameter("idProducto")));
     		try {
				   if(dts.modificarProducto(pr)) {
		        	response.sendRedirect("GestionProductos.jsp?msj=3");
		        }
		        else {
		        	response.sendRedirect("GestionProductos.jsp?msj=4");
		        }
		        
	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionProductos, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
			default:
			response.sendRedirect("GestionProductos.jsp?msj=7");	
			break;
		}		
	}

}
