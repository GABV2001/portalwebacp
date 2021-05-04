package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Evento;
import entidades.Evento;

/**
 * Servlet implementation class Sl_GestionEvento
 */
@WebServlet("/Sl_GestionEvento")
public class Sl_GestionEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionEvento() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int idEvento =0;
		idEvento = Integer.parseInt(request.getParameter("idE"));
		Dt_Evento dts = new	Dt_Evento();
		
		if(dts.eliminarEvento(idEvento)) {
        	response.sendRedirect("GestionEvento.jsp?msj=5");
        }
        else {
        	response.sendRedirect("GestionEvento.jsp?msj=6");
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
		
		//Construir objeto Evento
		Dt_Evento dte = new Dt_Evento();
		Evento ev = new Evento();
		ev.setNombre(request.getParameter("txtNombreEvento"));
		ev.setDescripcion(request.getParameter("txtDescripcionEvento"));
		ev.setFechainicio(request.getParameter("datefInicioEvento"));
		ev.setHorainicio(request.getParameter("timehoraInicioEvento"));
		ev.setFechafin(request.getParameter("datefFinalEvento"));
		ev.setHorafin(request.getParameter("timehoraFinEvento"));
		ev.setTipoevento(Integer.parseInt(request.getParameter("cbxTipoEvento")));
		//ev.setMultimedia(request.getParameter("multEvento"));
		ev.setHipervinculo(request.getParameter("txthipervinculoEvento"));
		ev.setUbicacion(request.getParameter("txtUbicacionEvento"));
		
		switch (opc){
		case 1:{
			
		        try {
			        if(dte.guardarEventos(ev)) {
			        	response.sendRedirect("GestionEvento.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("GestionEvento.jsp?msj=2");
			        }
			        	
		        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionEvento, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		case 2:{
			ev.setEventoid(Integer.parseInt(request.getParameter("idEvento")));
     		try {
				   if(dte.modificarEvento(ev)) {
		        	response.sendRedirect("GestionEvento.jsp?msj=3");
		        }
		        else {
		        	response.sendRedirect("GestionEvento.jsp?msj=4");
		        }
		        
	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionEvento, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
			default:
			response.sendRedirect("GestionEvento.jsp?msj=5");	
			break;
	}//Fin Switch
		
	}
		
		
}


