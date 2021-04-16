package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Arbol;

public class Dt_Arbol {
		//Atributos
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsArbol = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		// Metodo para llenar el RusultSet
			public void llenaRsArbol(Connection c){
				try{
					ps = c.prepareStatement("select * from viewarbol", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rsArbol = ps.executeQuery();
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR ARBOL "+ e.getMessage());
					e.printStackTrace();
				}
			}
			
			//Metodo para visualizar usuarios registrados y activos
			public ArrayList<Arbol> listaArbol(){
				ArrayList<Arbol> listArbol = new ArrayList<Arbol>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from viewarbol", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						Arbol arbol = new Arbol();
						arbol.setID(rs.getInt("arbolid"));
						arbol.setNombreComun(rs.getString("NombreComun"));
						arbol.setNombreCientifico(rs.getString("NombreCientifico"));
						arbol.setDescripcion(rs.getString("Descripcion"));					
						arbol.setMultimedia(rs.getString("Multimedia"));
						arbol.setNombreDis(rs.getString("NombreDist"));					
						arbol.setNombreFam(rs.getString("NombreFam"));		
						arbol.setNombreFlo(rs.getString("NombreFlo"));
						arbol.setNombreGenero(rs.getString("NombreGenero"));
						arbol.setEstado(rs.getInt("Estado"));		
						listArbol.add(arbol);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR ARBOL "+ e.getMessage());
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
							PoolConexion	.closeConnection(c);
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				return listArbol;
			}	
		

}
