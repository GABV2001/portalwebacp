package datos;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.ViewRegion;

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
					ps = c.prepareStatement("select * from viewregion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rsRegion = ps.executeQuery();
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR Region "+ e.getMessage());
					e.printStackTrace();
				}
			}
			
			//Metodo para visualizar usuarios registrados y activos
			public ArrayList<ViewRegion> listaRegion(){
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
						region.setNombrePais(rs.getString("Pais"));
						listRegion.add(region);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR Familia "+ e.getMessage());
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
