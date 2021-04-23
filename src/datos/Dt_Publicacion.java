package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Evento;
import entidades.Publicacion;

public class Dt_Publicacion {
		//Atributos
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsPost = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		
		// Metodo para llenar el ResultSet
			public void llenaRsPublicacion(Connection c){
				try{
					ps = c.prepareStatement("select publicacionid, titulo, descripcion, fecha, multimedia, estadopublicacion, estado, usuarioid FROM publicacion where publicacion.estado <>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rsPost = ps.executeQuery();
				}
				catch (Exception e){
					System.out.println("DATOS: Error al listar elementos del Banner "+ e.getMessage());
					e.printStackTrace();
				}
			}
		
			//Metodo para visualizar Banners
			public ArrayList<Publicacion> ListaPost(){

				//Crear lista de arreglos
				ArrayList<Publicacion> listPost = new ArrayList<Publicacion>();
				
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select publicacionid, titulo, descripcion, fecha, multimedia, estadopublicacion, estado, usuarioid FROM publicacion where publicacion.estado <>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						Publicacion post = new Publicacion();
						post.setPublicacionid(rs.getInt("publicacionid"));
						post.setTitulo(rs.getString("titulo"));
						post.setDescripcion(rs.getString("descripcion"));
						post.setFecha(rs.getTimestamp("fecha"));
						post.setMultimedia(rs.getString("multimedia"));
						post.setEstadopublicacion(rs.getInt("estadopublicacion"));
						post.setEstado(rs.getInt("estado"));
						post.setUsuarioid(rs.getInt("usuarioid"));
						listPost.add(post);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR PUBLICACIONs "+ e.getMessage());
					e.printStackTrace();
				}
				finally{
					try {
						if(rs != null){
							rs.close();
						}
						if(ps != null){
							ps.close();
						}
						if(c != null){
							PoolConexion.closeConnection(c);
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				return listPost;
				
			}
			
			//Metodo para almacenar nueva Publicacion
			public boolean guardarPost(Publicacion post){
				boolean guardado = false;
				
				try{
					c = PoolConexion.getConnection();
					this.llenaRsPublicacion(c);
					rsPost.moveToInsertRow();
					rsPost.updateString("titulo", post.getTitulo());
					rsPost.updateString("descripcion", post.getDescripcion());			
					rsPost.updateTimestamp("fecha", post.getFecha());	
					rsPost.updateString("multimedia", "Defecto.jpeg");						
					rsPost.updateInt("estadopublicacion", post.getEstadopublicacion());						
					rsPost.updateInt("estado", 1);
					rsPost.updateInt("usuarioid", 1);
					rsPost.insertRow();
					rsPost.moveToCurrentRow();
					guardado = true;
				}
				catch (Exception e) {
					System.err.println("ERROR AL GUARDAR PUBLICACION "+e.getMessage());
					e.printStackTrace();
				}
				finally{
					try {
						if(rsPost != null){
							rsPost.close();
						}
						if(c != null){
							PoolConexion.closeConnection(c);
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				return guardado;
			}

}
