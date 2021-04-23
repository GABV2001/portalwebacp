package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidades.Distribucion;
import datos.Dt_Distribucion;



/**
 * Servlet implementation class Sl_GestionDistribucion
 */
@WebServlet("/Sl_GestionDistribucion")
public class Sl_GestionDistribucion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionDistribucion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));
		
		//CONSTRUIR EL OBJETO USUARIO
		Dt_Distribucion dtf = new Dt_Distribucion();
		Distribucion dt = new Distribucion();
		dt.setNombre(request.getParameter("txtNombreDistribucion"));
		dt.setDescripcion(request.getParameter("txtDescripcionDistribucion"));
		
		switch (opc){
		case 1:{
			
		        try {
			        if(	dtf.guardarDistribucion(dt)) {
			        	response.sendRedirect("GestionDistribucion.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("GestionDistribucion.jsp?msj=2");
			        }
			        	
		        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionDistribucion, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
			default:
			response.sendRedirect("GestionDistribucion.jsp?msj=5");	
			break;
		
		
		}
	}

	

}
