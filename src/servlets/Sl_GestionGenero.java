package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entidades.Genero;
import datos.Dt_Genero;

/**
 * Servlet implementation class Sl_GestionGenero
 */
@WebServlet("/Sl_GestionGenero")
public class Sl_GestionGenero extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionGenero() {
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
		doGet(request, response);
		//Obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));
		
		//Construir objeto genero
		Dt_Genero dtb = new Dt_Genero();
		Genero bn = new Genero();
		bn.setNombre(request.getParameter("txtNombreGenero"));
		bn.setDescripcion(request.getParameter("txtDescripcionGenero"));		
		
		switch (opc){
			case 1:{
				
			        try {
				        if(dtb.guardarGenero(bn)) {
				        	response.sendRedirect("GestionGenero.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("GestionGenero.jsp?msj=2");
				        }
				        	
			        	
			        }
			        catch(Exception e) {
			        	System.out.println("Sl_GestionFamilia, el error es: " + e.getMessage());
						e.printStackTrace();
			        }
			        
					break;
				}
		}
	}
	

}