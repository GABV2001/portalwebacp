package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Distribucion;
import vistas.ViewDistribucion;


public class Dt_Distribucion {
	//Atributos
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsDistribucion = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		// Metodo para llenar el RusultSet
		public void llenaRsDistribucion(Connection c){
			try{
				ps = c.prepareStatement("select * from distribucion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsDistribucion = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR DISTRIBUCION "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		//Metodo para visualizar usuarios registrados y activos
				public ArrayList<Distribucion> listaDistribucion(){
					ArrayList<Distribucion> listDistribucion = new ArrayList<Distribucion>();
					try{
						c = PoolConexion.getConnection();
						ps = c.prepareStatement("select * from distribucion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
						rs = ps.executeQuery();
						while(rs.next()){
							Distribucion distribucion = new Distribucion();
							distribucion.setDistribucionID(rs.getInt("distribucionid"));
							distribucion.setNombre(rs.getString("nombre"));
							distribucion.setDescripcion(rs.getString("descripcion"));
							distribucion.setRegionID(rs.getInt("Regionid"));
							distribucion.setEstado(rs.getInt("estado"));
							listDistribucion.add(distribucion);
						}
					}
					catch (Exception e){
						System.out.println("DATOS: ERROR EN LISTAR DISTRIBUCION "+ e.getMessage());
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
					return listDistribucion;
				}
				
		//Metodo para visualizar vista distribucion
		public ArrayList<ViewDistribucion> listaViewDistribucion(){
			ArrayList<ViewDistribucion> listDistribucion = new ArrayList<ViewDistribucion>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from viewdistribucion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					ViewDistribucion distribucion = new ViewDistribucion();
					distribucion.setDistribucionID(rs.getInt("distribucionid"));
					distribucion.setDistribucion(rs.getString("distribucion"));
					distribucion.setDescripcion(rs.getString("descripcion"));						
					distribucion.setRegion(rs.getString("region"));
					listDistribucion.add(distribucion);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR VIEWDISTRIBUCION "+ e.getMessage());
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
			return listDistribucion;
		}
		
	
		//Metodo para almacenar nueva distribucion
		public boolean guardarDistribucion(Distribucion distribucion){
			boolean guardado = false;
			
			try{
				c = PoolConexion.getConnection();
				this.llenaRsDistribucion(c);
				rsDistribucion.moveToInsertRow();
				rsDistribucion.updateString("Nombre", distribucion.getNombre());								
				rsDistribucion.updateString("Descripcion", distribucion.getDescripcion());			
				rsDistribucion.updateInt("RegionID", distribucion.getRegionID());
				rsDistribucion.updateInt("Estado", 1);
				rsDistribucion.insertRow();
				rsDistribucion.moveToCurrentRow();
				guardado = true;
			}
			catch (Exception e) {
				System.err.println("ERROR AL GUARDAR DISTRIBUCION "+e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rsDistribucion != null){
						rsDistribucion.close();
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
