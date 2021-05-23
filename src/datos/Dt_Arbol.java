package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Arbol;
import vistas.ViewArbol;

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
			
			//Metodo para visualizar vista arbol
			public ArrayList<ViewArbol> listaArbol(){
				ArrayList<ViewArbol> listArbol = new ArrayList<ViewArbol>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from viewarbol", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						ViewArbol arbol = new ViewArbol();
						arbol.setArbolID(rs.getInt("arbolid"));
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
					System.out.println("DATOS: ERROR EN LISTAR viewARBOL "+ e.getMessage());
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
					rsArbol.updateString("Multimedia", arbol.getMultimedia());
					//rsArbol.updateString("Geoma", "");
					rsArbol.updateInt("FloracionID", arbol.getFloracionID() );					
					rsArbol.updateInt("FamiliaID", arbol.getFamiliaID());
					rsArbol.updateInt("GeneroID", arbol.getGeneroID());
					rsArbol.updateInt("DistribucionID", arbol.getDistribucionID());
					rsArbol.updateTimestamp("fcreacion", arbol.getFcreacion());
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
