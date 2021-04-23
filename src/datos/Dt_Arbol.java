package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
					ps = c.prepareStatement("select * from arbol", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rsArbol = ps.executeQuery();
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR ARBOl "+ e.getMessage());
					e.printStackTrace();
				}
			}
			
			//Metodo para almacenar nuevo arbol
			public boolean guardarArbol(Arbol arbol){
				boolean guardado = false;
				
				try{
					c = PoolConexion.getConnection();
					this.llenaRsArbol(c);
					rsArbol.moveToInsertRow();
					rsArbol.updateString("NombreComun", arbol.getNombreComun());
					rsArbol.updateString("NombreCientifico", arbol.getNombreCientifico());					
					rsArbol.updateString("Descripcion", arbol.getDescripcion());
					rsArbol.updateString("Multimedia", "Defecto.jpeg");
					//rsArbol.updateString("Geoma", "");
					rsArbol.updateInt("FloracionID", arbol.getFloracionID() );					
					rsArbol.updateInt("FamiliaID", arbol.getFamiliaID());
					rsArbol.updateInt("GeneroID", arbol.getGeneroID());
					rsArbol.updateInt("DistribucionID", arbol.getDistribucionID());
					rsArbol.updateInt("UsuarioID", 1);
					rsArbol.updateInt("Estado", 1);
					rsArbol.insertRow();
					rsArbol.moveToCurrentRow();
					guardado = true;
				}
				catch (Exception e) {
					System.err.println("ERROR AL GUARDAR ARBOL "+e.getMessage());
					e.printStackTrace();
				}
				finally{
					try {
						if(rsArbol != null){
							rsArbol.close();
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
