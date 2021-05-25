package servlets;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
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

import datos.Dt_Publicacion;
import entidades.Publicacion;
import negocio.Ng_Publicacion;

/**
 * Servlet implementation class Sl_GestionPublicacion
 */
@WebServlet("/Sl_GestionPublicacion")
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
		int idPublicacion =0;
		idPublicacion = Integer.parseInt(request.getParameter("idP"));
		Dt_Publicacion dts = new Dt_Publicacion();
		
		if(dts.eliminarPublicacion(idPublicacion)) {
        	response.sendRedirect("GestionPublicacion.jsp?msj=5");
        }
        else {
        	response.sendRedirect("GestionPublicacion.jsp?msj=6");
        }	response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				//Construir objeto Banner
				Dt_Publicacion dtp = new Dt_Publicacion();
				Publicacion post = new Publicacion();
				Ng_Publicacion  ngp = new Ng_Publicacion();
				
				int opc = 0;
				int publicacionid =0;
				String txtTituloPost = null;
				String txtDescripcionPost = null;
				String cbxEstadoPost = null;
				String rutaFichero = null;
				String usuarioid = null;		
				String url_foto = null;
				boolean control = false;
				
				try
				{
					FileItemFactory factory = new DiskFileItemFactory();
					ServletFileUpload upload = new ServletFileUpload(factory);
					String path = getServletContext().getRealPath("/");
					List<FileItem> items = upload.parseRequest(request);
					File fichero = null;
							
					for(FileItem item: items)
					{
						FileItem uploaded = item;
						if(uploaded.isFormField())
						{	
							String key = uploaded.getFieldName();
							String valor = uploaded.getString();
							if(key.equals("opcion")){
								opc = Integer.parseInt(valor);
							}else if(key.equals("publicacionid")){
								publicacionid = Integer.parseInt(valor);
							}else if(key.equals("txtTituloPost")){
								txtTituloPost = valor;
							}else if(key.equals("txtDescripcionPost")){
								txtDescripcionPost = valor;
							}else if(key.equals("cbxEstadoPost")){
								cbxEstadoPost = valor;
							}else if(key.equals("url_foto")){
								url_foto = valor;
							}else if(key.equals("usuarioid")){
								usuarioid = valor;
							}					
						}
					}
					
					if(txtTituloPost.trim().isEmpty() || txtDescripcionPost.trim().isEmpty()){
						response.sendRedirect("GestionServicio.jsp?msj=2"); 
					}else {
						control = true;
					}
					
					if(control){
					int valorImagen = 0;
					for(FileItem item : items)
					{
					
						FileItem uploaded = item;
						if(uploaded.getName()!=""){					
						if(!uploaded.isFormField())
						{
							/////////TAMAÑO DEL ARCHIVO ////////
							long size = uploaded.getSize();
							System.out.println("size: "+size);
							
							/////// GUARDAMOS EN UN ARREGLO LOS FORMATOS QUE SE DESEAN PERMITIR
							List<String> formatos = Arrays.asList("image/jpeg");
							
							////// COMPROBAR SI EL TAMAÑO Y FORMATO SON PERMITIDOS //////////
						    valorImagen = publicacionid; 
							
							if(formatos.contains(uploaded.getContentType()))
							{
								System.out.println("Filetype: "+uploaded.getContentType());
								
								rutaFichero = "fotosServicio"+valorImagen+".jpg";
								path = "C:\\payara5\\glassfish\\fotosPublicacionAbra\\";
								System.out.println(path+rutaFichero);
								
								fichero = new File(path+rutaFichero);
								System.out.println(path+rutaFichero);
								
								///////// GUARDAR EN EL SERVIDOR //////////////
								uploaded.write(fichero);
								
								System.out.println("SERVIDOR: FOTO GUARDADA CON EXITO!!!");
								/////// ACTUALIZAMOS EL CAMPO URLFOTO EN LA BASE DE DATOS
								String url = "fotosPublicacionAbra/"+rutaFichero;
								post.setMultimedia(url);
							}
							else
							{
								System.out.println("SERVIDOR: VERIFIQUE QUE EL ARCHIVO CUMPLA CON LAS ESPECIFICACIONES REQUERIDAS!!!");
								response.sendRedirect("GestionServicio.jsp?msj="+valorImagen+"&guardado=3");						
							}
						  }
					   }
					}
				   }
				 }
				catch(Exception e)
				{
						System.out.println("SERVLET: ERROR AL SUBIR LA FOTO: " + e.getMessage());
				}
				
				if(control){
				post.setTitulo(txtTituloPost);
				post.setDescripcion(txtDescripcionPost);
				if(post.getMultimedia()==null)
				{
					post.setMultimedia(url_foto);
				}
				post.setEstadopublicacion(Integer.parseInt(cbxEstadoPost));
				post.setUsuarioid(Integer.parseInt(usuarioid));
				
				switch (opc){
				case 1:{						
						try {
				        	//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
					        Date fechaSistema = new Date();
					        post.setFcreacion(new java.sql.Timestamp(fechaSistema.getTime()));
					        System.out.println("Post.getFechaCreacion(): "+post.getFcreacion());
					        if(ngp.existePublacion(post.getTitulo())){
					        	response.sendRedirect("GestionPublicacion.jsp?msj=existe");							
							}else{					        
					        if(dtp.guardarPost(post)) {
					        	response.sendRedirect("GestionPublicacion.jsp?msj=1");
					        }
					        else {
					        	response.sendRedirect("GestionPublicacion.jsp?msj=2");
					        }	
						  }
				        }	
				        catch(Exception e) {
				        	System.out.println("Sl_GestionPublicacion, el error es: " + e.getMessage());
							e.printStackTrace();
				        }
				        
						break;
					}
					case 2:{
						post.setPublicacionid(publicacionid);
						//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				        Date fechaSistema = new Date();
				        post.setFmodificacion(new java.sql.Timestamp(fechaSistema.getTime()));
						try {
							   if(dtp.modificarPublicacion(post)) {
					        	response.sendRedirect("GestionPublicacion.jsp?msj=3");
					        }
					        else {
					        	response.sendRedirect("GestionPublicacion.jsp?msj=4");
					        }        		        	
				        }
			        catch(Exception e) {
			        	System.out.println("Sl_GestionPublicacion el error es: " + e.getMessage());
						e.printStackTrace();
			        }
						break;
						
					}
					default:
					response.sendRedirect("GestionPublicacion.jsp?msj=5");	
					break;
			}//Fin Switch
		  }
	}
}
