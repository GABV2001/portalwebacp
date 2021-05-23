package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_RolUsuario;
import entidades.RolUsuario;

/**
 * Servlet implementation class Sl_GestionRolUsuario
 */
@WebServlet("/Sl_GestionRolUsuario")
public class Sl_GestionRolUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionRolUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idRolUser =0;
		idRolUser = Integer.parseInt(request.getParameter("idRU"));
		Dt_RolUsuario dtru = new Dt_RolUsuario(); 
		
		if(dtru.eliminaRU(idRolUser)) {
        	response.sendRedirect("GestionRolUsuario.jsp?msj=5");
        }
        else {
        	response.sendRedirect("GestionRolUsuario.jsp?msj=6");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		//obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));
				
		//CONSTRUIR EL OBJETO ROL-USER
		RolUsuario ru = new RolUsuario();		
		Dt_RolUsuario dtru = new Dt_RolUsuario(); 
				
		ru.setUsuarioid(Integer.parseInt(request.getParameter("cbxUser")));
		ru.setRolid(Integer.parseInt(request.getParameter("cbxRol")));
	
		switch (opc){
		case 1:{
			
		        try {		        	
			        if(dtru.guardarRolUser(ru)) {
			        	response.sendRedirect("GestionRolUsuario.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("GestionRolUsuario.jsp?msj=2");
			        }
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionRolUser, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
				
			try {
	        	ru.setIdrol_usuario(Integer.parseInt(request.getParameter("rolusuarioid")))	;
		        if(dtru.modificarRolUsuario(ru)) {
		        	response.sendRedirect("GestionRolUsuario.jsp?msj=3");
		        }
		        else {
		        	response.sendRedirect("GestionRolUsuario.jsp?msj=4");
		        }
		        	
	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionRolUser, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		
		default:
			response.sendRedirect("GestionRolUsuario.jsp?msj=5");	
			break;
	}
	}

}
