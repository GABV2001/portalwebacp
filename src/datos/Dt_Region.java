package datos;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import entidades.Region;
import vistas.ViewRegion;


public class Dt_Region {
	
	//Atributos
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsRegion = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para llenar el RusultSet
				public void llenaRsRegion(Connection c){
					try{
						ps = c.prepareStatement("select * from region", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
						rsRegion = ps.executeQuery();
					}
					catch (Exception e){
						System.out.println("DATOS: ERROR EN LISTAR REGION "+ e.getMessage());
						e.printStackTrace();
					}
				}
				
				//Metodo para visualizar region
				public ArrayList<Region> listaRegion(){
					ArrayList<Region> listRegion = new ArrayList<Region>();
					try{
						c = PoolConexion.getConnection();
						ps = c.prepareStatement("select * from region", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
						rs = ps.executeQuery();
						while(rs.next()){
							Region region = new Region();
							region.setRegionID(rs.getInt("regionid"));
							region.setNombre(rs.getString("nombre"));
							region.setDescripcion(rs.getString("descripcion"));
							region.setPaisID(rs.getInt("paisid"));							
							listRegion.add(region);
						}
					}
					catch (Exception e){
						System.out.println("DATOS: ERROR EN LISTAR REGION "+ e.getMessage());
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
					return listRegion;
				}
				
						
	
				//Metodo para almacenar nueva region
				public boolean guardarRegion(Region region){
					boolean guardado = false;
					
					try{
						c = PoolConexion.getConnection();
						this.llenaRsRegion(c);
						rsRegion.moveToInsertRow();
						rsRegion.updateString("Nombre", region.getNombre());											
						rsRegion.updateString("Descripcion", region.getDescripcion());	
						rsRegion.updateInt("PaisID", region.getPaisID());
						rsRegion.updateInt("Estado", 1);
						rsRegion.insertRow();
						rsRegion.moveToCurrentRow();
						guardado = true;
					}
					catch (Exception e) {
						System.err.println("ERROR AL GUARDAR REGION "+e.getMessage());
						e.printStackTrace();
					}
					finally{
						try {
							if(rsRegion != null){
								rsRegion.close();
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
	
				//Metodo para visualizar region
				public ArrayList<ViewRegion> listaViewRegion(){
					ArrayList<ViewRegion> listRegion = new ArrayList<ViewRegion>();
					try{
						c = PoolConexion.getConnection();
						ps = c.prepareStatement("select * from viewregion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
						rs = ps.executeQuery();
						while(rs.next()){
							ViewRegion region = new ViewRegion();
							region.setRegionid(rs.getInt("regionid"));
							region.setNombreRegion(rs.getString("region"));
							region.setDescripcion(rs.getString("descripcion"));	
							region.setPais(rs.getString("Pais"));						
							listRegion.add(region);
						}
					}
					catch (Exception e){
						System.out.println("DATOS: ERROR EN LISTAR VIEWREGION "+ e.getMessage());
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
					return listRegion;
				}

}
