package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Arbol;
import datos.Dt_Arbol;



/**
 * Servlet implementation class Sl_GestionArbol
 */
@WebServlet("/Sl_GestionArbol")
public class Sl_GestionArbol extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionArbol() {
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
		
		//CONSTRUIR EL OBJETO ARBOL
		Dt_Arbol dta = new Dt_Arbol();
		Arbol ar = new Arbol();
		ar.setNombreComun(request.getParameter("txtNombreComun"));
		ar.setNombreCientifico(request.getParameter("txtNombreCientifico"));
		ar.setDescripcion(request.getParameter("txtDescripcionArbol"));
		ar.setMultimedia(request.getParameter("Multimedia"));		
		ar.setGeneroID(Integer.parseInt(request.getParameter("GeneroID")));		
		ar.setFamiliaID(Integer.parseInt(request.getParameter("FamiliaID")));
		ar.setDistribucionID(Integer.parseInt(request.getParameter("DistribucionID")));
		ar.setFloracionID(Integer.parseInt(request.getParameter("FloracionID")));
		
		switch (opc){
		case 1:{
			
		        try {
			        if(	dta.guardarArbol(ar)) {
			        	response.sendRedirect("GestionArbol.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("GestionArbol.jsp?msj=2");
			        }
			        	
		        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionArbol, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}/*
		case 2:{
			try {
	        	
		        if(dtf.modificarFamilia(ar)) {
		        	response.sendRedirect("tblUsuarios.jsp?msj=3");
		        }
		        else {
		        	response.sendRedirect("tblUsuarios.jsp?msj=4");
		        }
		        
	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionRolUser, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}*/
		default:
			response.sendRedirect("GestionFamilia.jsp?msj=5");	
			break;
		
			
		}		
	
		
		
	}

}
