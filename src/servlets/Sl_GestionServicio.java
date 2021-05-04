package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Servicio;
import datos.Dt_Servicio;

/**
 * Servlet implementation class Sl_GestionServicio
 */
@WebServlet("/Sl_GestionServicio")
public class Sl_GestionServicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionServicio() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int idServicio =0;
		idServicio = Integer.parseInt(request.getParameter("idS"));
		Dt_Servicio dts = new Dt_Servicio();
		
		if(dts.eliminarServicio(idServicio)) {
        	response.sendRedirect("GestionServicio.jsp?msj=5");
        }
        else {
        	response.sendRedirect("GestionServicio.jsp?msj=6");
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//	doGet(request, response);
		//Obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));
		
		//Construir objeto estudiante
		Dt_Servicio dts = new Dt_Servicio();
		Servicio sr = new Servicio();
		sr.setNombre(request.getParameter("nombreServicio"));
		sr.setDescripcion(request.getParameter("descripcionServicio"));
		sr.setEstadoservicio(Integer.parseInt(request.getParameter("cbxEstadoServicio")));
		
		switch (opc){
		case 1:{
			
		        try {
		        	if(dts.guardarServicio(sr)) {
			        	response.sendRedirect("GestionServicio.jsp?msj=1");
			        }
			   
			         else {
			        	response.sendRedirect("GestionServicio.jsp?msj=2");
			        }
			        	
		        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionServicio, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		case 2:{
			sr.setServicioid(Integer.parseInt(request.getParameter("idServicio")));
     		try {
				   if(dts.modificarServicio(sr)) {
		        	response.sendRedirect("GestionServicio.jsp?msj=3");
		        }
		        else {
		        	response.sendRedirect("GestionServicio.jsp?msj=4");
		        }
		        
	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionServicio, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		default:
			response.sendRedirect("GestionServicio.jsp?msj=7");	
			break;
		}
		
		
	}

}
