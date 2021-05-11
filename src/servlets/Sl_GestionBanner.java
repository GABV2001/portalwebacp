package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Banner;
import datos.Dt_Banner;

/**
 * Servlet implementation class Sl_EditarBanner
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
		int idBanner =0;
		idBanner = Integer.parseInt(request.getParameter("idB"));
		Dt_Banner dtb = new Dt_Banner(); 
		
		if(dtb.eliminaBanner(idBanner)) {
        	response.sendRedirect("GestionBanner.jsp?msj=5");
        }
        else {
        	response.sendRedirect("GestionBanner.jsp?msj=6");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	
		//Metodos para actualizar
		int opc =0;
		opc = Integer.parseInt(request.getParameter("opcion"));
		
		Banner bn = new Banner();
		Dt_Banner dtb = new Dt_Banner();
		bn.setBannerID(Integer.parseInt(request.getParameter("bannerID")));
		bn.setTitulobanner(request.getParameter("txtEditTituloBanner"));
		bn.setDescripcion(request.getParameter("txtEditDescripcionBanner"));
		
	    switch(opc){
		
	    case 2:{
			Date fechaSistema = new Date();
		    bn.setFmodificacion(new java.sql.Timestamp(fechaSistema.getTime()));
		     
	 		try {
				   if(dtb.modificarInfoBanner(bn)) {
		        	response.sendRedirect("GestionBanner.jsp?msj=3");
		        }
		        else {
		        	response.sendRedirect("GestionBanner.jsp?msj=4");
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