package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.ViewDistribucion;

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
					ps = c.prepareStatement("select * from viewdistribucion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rsDistribucion = ps.executeQuery();
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR DISTRIBUCION"+ e.getMessage());
					e.printStackTrace();
				}
			}
			
			//Metodo para visualizar usuarios registrados y activos
			public ArrayList<ViewDistribucion> listaDistribucion(){
				ArrayList<ViewDistribucion> listDistribucion = new ArrayList<ViewDistribucion>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from viewdistribucion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						ViewDistribucion distribucion = new ViewDistribucion();
						distribucion.setID(rs.getInt("distribucionid"));
						distribucion.setNombreDist(rs.getString("distribucion"));
						distribucion.setDescripcion(rs.getString("descripcion"));
						distribucion.setNombreRegion(rs.getString("region"));
						listDistribucion.add(distribucion);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR distribucion "+ e.getMessage());
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
}
