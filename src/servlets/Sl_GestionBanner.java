package servlets;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
		
				//Obtenemos el valor de opcion
				int opc = 0;
				opc = Integer.parseInt(request.getParameter("opcion"));
				
				//Construir objeto Banner
				Dt_Banner dtb = new Dt_Banner();
				Banner bn = new Banner();
				bn.setTitulobanner(request.getParameter("txtTituloBanner"));
				bn.setDescripcion(request.getParameter("txtDescripcionBanner"));
			//	bn.setMultimedia(request.getParameter("multBanner"));
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
				default:
					response.sendRedirect("GestionBanner.jsp?msj=7");	
					break;
			}		
				
	}
	
}
