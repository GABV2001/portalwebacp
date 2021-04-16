package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Home;
import datos.Dt_Home;
/**
 * Servlet implementation class Sl_GestionInicio
 */


@WebServlet("/Sl_GestionInicio")
public class Sl_GestionInicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionInicio() {
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
				Dt_Home dth = new Dt_Home();
				Home hm = new Home();
				hm.setHomeID(Integer.parseInt(request.getParameter("idInicio") ));
				hm.setUsuarioID(Integer.parseInt(request.getParameter("idUsuario")));
				hm.setHistoria(request.getParameter("descripcionHis"));
				hm.setMision(request.getParameter("descripcionMis"));
				hm.setVision(request.getParameter("descripcionVis"));
	/*			hm.setImg_historia(request.getParameter(""));			
				hm.setImg_mision(request.getParameter(""));
				hm.setImg_vision(request.getParameter(""));*/
	

			switch(opc) {
			case 1:{
				
				try {
			          if(dth.modificarInicio(hm)) {
			        	response.sendRedirect("GestionInicio.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("GestionInicio.jsp?msj=2");
			        }
			        	
		        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionInicio, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
					break;
					
				}
			
			default:
				response.sendRedirect("GestionIncio.jsp?msj=3");	
				break;
		}
		
			}

}
