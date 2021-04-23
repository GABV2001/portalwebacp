package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Footer;
import entidades.Footer;

/**
 * Servlet implementation class Sl_GestionPiePagina
 */
@WebServlet("/Sl_GestionPiePagina")
public class Sl_GestionPiePagina extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionPiePagina() {
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
		Dt_Footer dtf = new Dt_Footer();
		Footer ft= new Footer();
		ft.setFooterID(Integer.parseInt(request.getParameter("idFooter") ));
		ft.setUsuarioID(Integer.parseInt(request.getParameter("idUsuario")));
		ft.setDescripcion(request.getParameter("direccionFooter"));
		ft.setCorreo(request.getParameter("correoFooter"));
		ft.setTelefono(request.getParameter("telefonoFooter"));
		ft.setExtencion(request.getParameter("extensionFooter"));
	//	ft.setLogo(request.getParameter("multiFooter"));
		switch(opc) {
		case 1:{
			
			try {
		          if(dtf.modificarFooter(ft)) {
		        	response.sendRedirect("GestionPiePagina.jsp?msj=1");
		        }
		        else {
		        	response.sendRedirect("GestionPiePagina.jsp?msj=2");
		        }
		        	
	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_PiePagina, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		
		default:
			response.sendRedirect("GestionPiePagina.jsp?msj=3");	
			break;
	}
		
		
	}

}
