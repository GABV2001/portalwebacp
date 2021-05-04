package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Pais;

public class Dt_Pais {
	//Atributos
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsPais = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para llenar el RusultSet
	public void llenaRsPais(Connection c){
		try{
			ps = c.prepareStatement("select * from Pais", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsPais = ps.executeQuery();
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR PAIS "+ e.getMessage());
			e.printStackTrace();
		}
	}
	//Metodo para visualizar paises 
	public ArrayList<Pais> listaPais(){
		ArrayList<Pais> listPais = new ArrayList<Pais>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from Pais", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				Pais pais = new Pais();
				pais.setPaisID(rs.getInt("PaisID"));
				pais.setNombre(rs.getString("Nombre"));
				pais.setDescripcion(rs.getString("Descripcion"));				
				pais.setEstado(rs.getInt("Estado"));		
				listPais.add(pais);
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR PAIS "+ e.getMessage());
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
		return listPais;
	}
	

	//Metodo para almacenar nuevo pais
		public boolean guardarPais(Pais pais){
			boolean guardado = false;
			
			try{
				c = PoolConexion.getConnection();
				this.llenaRsPais(c);
				rsPais.moveToInsertRow();
				rsPais.updateString("Nombre", pais.getNombre());				
				rsPais.updateString("Descripcion", pais.getDescripcion());			
				rsPais.updateInt("Estado", 1);
				rsPais.insertRow();
				rsPais.moveToCurrentRow();
				guardado = true;
			}
			catch (Exception e) {
				System.err.println("ERROR AL GUARDAR PAIS "+e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rsPais != null){
						rsPais.close();
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
