package negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import datos.PoolConexion;

public class Ng_Publicacion {
	//Atributos
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		//Metodo para validar el Publicacion
		public boolean existePublacion(String Publicacion){
			boolean existe = false;
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from publicacion where titulo=? and estado <>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setString(1, Publicacion);
				rs = ps.executeQuery();
				if(rs.next()){
					existe=true;
				}
			}
			catch (Exception e){
				System.out.println("DATOS ERROR existePublacion(): "+ e.getMessage());
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
			return existe;
		}
}
