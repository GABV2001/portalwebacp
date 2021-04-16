package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entidades.Genero;

public class Dt_Genero {
	//Atributos
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsGenero = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		// Metodo para llenar el RusultSet
		public void llenaRsGenero(Connection c){
			try{
				ps = c.prepareStatement("select generoid, nombre, descripcion, estado from genero", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsGenero = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR GENERO "+ e.getMessage());
				e.printStackTrace();
			}
		}
		//Metodo para visualizar usuarios registrados y activos
			public ArrayList<Genero> listaGenero(){
				ArrayList<Genero> listGenero = new ArrayList<Genero>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select generoid, nombre, descripcion, estado from genero", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						Genero genero = new Genero();
						genero.setGeneroID(rs.getInt("generoid"));
						genero.setNombre(rs.getString("nombre"));
						genero.setDescripcion(rs.getString("descripcion"));			
						listGenero.add(genero);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR GENERO "+ e.getMessage());
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
				return listGenero;
			}


}
