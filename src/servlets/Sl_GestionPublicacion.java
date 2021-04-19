package servlets;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Publicacion;
import entidades.Publicacion;

/**
 * Servlet implementation class Sl_Publicacion
 */
@WebServlet("/Sl_Publicacion")
public class Sl_GestionPublicacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionPublicacion() {
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

		//Obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));
		
		//Construir objeto Banner
		Dt_Publicacion dtp = new Dt_Publicacion();
		Publicacion post = new Publicacion();
		post.setTitulo(request.getParameter("txtTituloPost"));
		post.setDescripcion(request.getParameter("txtDescripcionPost"));
		post.setMultimedia(request.getParameter("multPost"));
		post.setEstadopublicacion(Integer.parseInt(request.getParameter("cbxEstadoPost")));
		
		switch (opc){
		case 1:{
			
		        try {
		        	//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
			        Date fechaSistema = new Date();
			        post.setFecha(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("Post.getFechaCreacion(): "+post.getFecha());
			        if(dtp.guardarPost(post)) {
			        	response.sendRedirect("GestionPublicacion.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("GestionPublicacion.jsp?msj=2");
			        }
			        	
		        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionPublicacion, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
			default:
			response.sendRedirect("GestionEvento.jsp?msj=5");	
			break;
	}//Fin Switch
		
	}

}
