package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Banner;
import datos.Dt_Banner;

/**
 * Servlet implementation class Sl_GestionBanner
 */
@WebServlet("/Sl_GestionBanner")
public class Sl_GestionBanner extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionBanner() {
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
		// doGet(request, response);
		
				//Obtenemos el valor de opcion
				int opc = 0;
				opc = Integer.parseInt(request.getParameter("opcion"));
				
				//Construir objeto Banner
				Dt_Banner dtb = new Dt_Banner();
				Banner bn = new Banner();
				bn.setTitulobanner(request.getParameter("txtTituloBanner"));
				bn.setDescripcion(request.getParameter("txtDescripcionBanner"));
				bn.setPosicion(Integer.parseInt(request.getParameter("posicion")));
				
				switch (opc){
					case 1:{
						
					        try {
 					        if(dtb.guardarBanner(bn)) {
						        	response.sendRedirect("GestionBanner.jsp?msj=1");
						        }
						        else {
						        	response.sendRedirect("GestionBanner.jsp?msj=2");
						        }
						        	
					        	
					        }
					        catch(Exception e) {
					        	System.out.println("Sl_GestionBanner, el error es: " + e.getMessage());
								e.printStackTrace();
					        }
					        
							break;
						}
				}
		
	}

}
