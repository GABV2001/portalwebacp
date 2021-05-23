package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.UbicacionArbol;

public class Dt_UbicacionArbol {
		//Atributos
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsUbicacionArbol = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
	
		// Metodo para llenar el RusultSet
				public void llenaRsArbol(Connection c){
					try{
						ps = c.prepareStatement("select * from ubicacionarbol", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
						rsUbicacionArbol = ps.executeQuery();
					}
					catch (Exception e){
						System.out.println("DATOS: ERROR EN LISTAR UBICACION ARBOL "+ e.getMessage());
						e.printStackTrace();
					}
				}

				//Metodo para almacenar nueva ubicacion arbol
				public boolean guardarArbol(UbicacionArbol uarbol){
					boolean guardado = false;
					
					try{
						c = PoolConexion.getConnection();
						this.llenaRsArbol(c);
						rsUbicacionArbol.moveToInsertRow();
						rsUbicacionArbol.updateInt("arbolid", uarbol.getArbolid());
						rsUbicacionArbol.updateInt("distribucionid", uarbol.getArbolid());						
						rsUbicacionArbol.insertRow();
						rsUbicacionArbol.moveToCurrentRow();
						guardado = true;
					}
					catch (Exception e) {
						System.err.println("ERROR AL GUARDAR UBICACION ARBOL "+e.getMessage());
						e.printStackTrace();
					}
					finally{
						try {
							if(rsUbicacionArbol != null){
								rsUbicacionArbol.close();
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
