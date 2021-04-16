package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entidades.Familia;

public class Dt_Familia {

	//Atributos
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsFamilia = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		// Metodo para llenar el RusultSet
		public void llenaRsFamilia(Connection c){
			try{
				ps = c.prepareStatement("select * from familia", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsFamilia = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR FAMILIA "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		//Metodo para visualizar usuarios registrados y activos
		public ArrayList<Familia> listaFamilia(){
			ArrayList<Familia> listFamilia = new ArrayList<Familia>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from familia", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Familia familia = new Familia();
					familia.setFamiliaID(rs.getInt("FamiliaID"));
					familia.setNombre(rs.getString("Nombre"));
					familia.setDescripcion(rs.getString("Descripcion"));			
					familia.setEstado(rs.getInt("Estado"));		
					listFamilia.add(familia);
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
			return listFamilia;
		}
		
		//Metodo para almacenar nueva familia
			public boolean guardarFamilia(Familia familia){
				boolean guardado = false;
				
				try{
					c = PoolConexion.getConnection();
					this.llenaRsFamilia(c);
					rsFamilia.moveToInsertRow();
//					rsFamilia.updateInt("FamiliaID", familia.getFamiliaID());
					rsFamilia.updateString("Nombre", familia.getNombre());				
					rsFamilia.updateString("Descripcion", familia.getDescripcion());			
					rsFamilia.updateInt("Estado", 1);
					rsFamilia.insertRow();
					rsFamilia.moveToCurrentRow();
					guardado = true;
				}
				catch (Exception e) {
					System.err.println("ERROR AL GUARDAR Familia "+e.getMessage());
					e.printStackTrace();
				}
				finally{
					try {
						if(rsFamilia != null){
							rsFamilia.close();
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
			
			
			// Metodo para modificar familia
			public boolean modificarFamilia(Familia familia)
			{
				boolean modificado=false;	
				try
				{
					c = PoolConexion.getConnection();
					this.llenaRsFamilia(c);
					rsFamilia.beforeFirst();
					while (rsFamilia.next())
					{
						if(rsFamilia.getInt(1)==familia.getFamiliaID())
						{
						
							rsFamilia.updateString("Nombres", familia.getNombre());
							rsFamilia.updateString("Descripcion", familia.getDescripcion());						
							rsFamilia.updateInt("estado", 2);
							rsFamilia.updateRow();
							modificado=true;
							break;
						}
					}
				}
				catch (Exception e)
				{
					System.err.println("ERROR AL ACTUALIZAR Familia "+e.getMessage());
					e.printStackTrace();
				}
				finally
				{
					try {
						if(rsFamilia != null){
							rsFamilia.close();
						}
						if(c != null){
							PoolConexion.closeConnection(c);
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				return modificado;
			}
			
}
