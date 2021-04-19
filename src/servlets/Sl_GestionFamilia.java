package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Familia;
import entidades.Familia;

/**
 * Servlet implementation class Sl_GestionFamilia
 */
@WebServlet("/Sl_GestionFamilia")
public class Sl_GestionFamilia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionFamilia() {
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
		Dt_Familia dtf = new Dt_Familia();
		Familia fm = new Familia();
		fm.setNombre(request.getParameter("txtNombreFamilia"));
		fm.setDescripcion(request.getParameter("txtDescripcionFamilia"));
		
		switch (opc){
		case 1:{
			
		        try {
			        if(	dtf.guardarFamilia(fm)) {
			        	response.sendRedirect("GestionFamilia.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("GestionFamilia.jsp?msj=2");
			        }
			        	
		        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionFamilia, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
			default:
			response.sendRedirect("GestionFamilia.jsp?msj=5");	
			break;
		
		
		}
	}

}