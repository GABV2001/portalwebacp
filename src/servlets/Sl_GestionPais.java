package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Pais;
import entidades.Pais;

/**
 * Servlet implementation class Sl_GestionPais
 */
@WebServlet("/Sl_GestionPais")
public class Sl_GestionPais extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionPais() {
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
		
		//Construir objeto pais
		Dt_Pais dtb = new Dt_Pais();
		Pais bn = new Pais();
		bn.setNombre(request.getParameter("txtNombrePais"));
		bn.setDescripcion(request.getParameter("txtDescripcionPais"));
		//bn.setEstado(Integer.parseInt(request.getParameter("posicion")));
		
		switch (opc){
			case 1:{
				
			        try {
				        if(dtb.guardarPais(bn)) {
				        	response.sendRedirect("GestionPais.jsp?msj=1");
				        }
				        else {
				        	response.sendRedirect("GestionPais.jsp?msj=2");
				        }
				        	
			        	
			        }
			        catch(Exception e) {
			        	System.out.println("Sl_GestionPais, el error es: " + e.getMessage());
						e.printStackTrace();
			        }
			        
					break;
				}
		}
	}

}
