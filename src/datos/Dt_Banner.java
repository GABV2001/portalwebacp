package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Banner;

public class Dt_Banner {
	
	//Atributos
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsBanner = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	
	// Metodo para llenar el ResultSet
		public void llenarBanner(Connection c){
			try{
				ps = c.prepareStatement("select bannerid, titulobanner, descripcion, multimedia, posicion, estado, usuarioid from banner", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsBanner = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: Error al listar elementos del Banner "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		//Metodo para visualizar Banners
		public ArrayList<Banner> ListarBanner(){

			//Crear lista de arreglos
			ArrayList<Banner> listBanner = new ArrayList<Banner>();
			
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("SELECT * FROM banner where banner.estado <> 3 order by banner.posicion asc", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Banner bn = new Banner();
					bn.setBannerID(rs.getInt("BannerID"));
					bn.setTitulobanner(rs.getString("Titulobanner"));
					bn.setDescripcion(rs.getString("Descripcion"));
					bn.setMultimedia(rs.getString("Multimedia"));
					bn.setPosicion(rs.getInt("Posicion"));
					bn.setEstado(rs.getInt("Estado"));
					bn.setUsuarioID(rs.getInt("UsuarioID"));
					listBanner.add(bn);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR Elementos del Banner "+ e.getMessage());
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
			return listBanner;
		}
	
		//Metodo para almacenar nuevo banner
		public boolean guardarBanner(Banner bn){
			boolean guardado = false;
			
			try{
				c = PoolConexion.getConnection();
				this.llenarBanner(c);
				rsBanner.moveToInsertRow();
				rsBanner.updateString("titulobanner", bn.getTitulobanner());
				rsBanner.updateString("descripcion", bn.getDescripcion());
				rsBanner.updateString("multimedia", "Defecto.jpeg");
				rsBanner.updateInt("posicion", bn.getPosicion() + 1);
				rsBanner.updateInt("estado", 1);
				rsBanner.updateInt("usuarioid", 1);
				rsBanner.insertRow();
				rsBanner.moveToCurrentRow();
				guardado = true;
			}
			catch (Exception e) {
				System.err.println("Error al guardar Banner "+e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rsBanner != null){
						rsBanner.close();
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
	
		// Metodo para eliminar Banner
		public boolean eliminaBanner(int idB)
		{
			boolean eliminado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenarBanner(c);;
				rsBanner.beforeFirst();
				while (rsBanner.next())
				{
					if(rsBanner.getInt(1)==idB)
					{
						rsBanner.deleteRow();
						eliminado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ELIMINAR BANNER "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsBanner != null){
						rsBanner.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return eliminado;
		}

}
