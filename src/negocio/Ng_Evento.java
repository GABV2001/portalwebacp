package negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import datos.Dt_Servicio;
import datos.PoolConexion;
import entidades.Servicio;
import java.sql.SQLException;

import datos.PoolConexion;
import entidades.Usuario;

public class Ng_Evento {

	//Atributos
			PoolConexion pc = PoolConexion.getInstance(); 
			Connection c = null;
			private ResultSet rs = null;
			private PreparedStatement ps = null;
			
			// Metodo para validar los eventos 
			public boolean existeEvento(String evento){
				boolean existe = false;
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from evento where nombre=? and estado <> 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					ps.setString(1, evento);
					rs = ps.executeQuery();
					if(rs.next()){
						existe=true;
					}
				}
				catch (Exception e){
					System.out.println("DATOS ERROR existeEvento(): "+ e.getMessage());
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
		
			public boolean validarVisibilidad(){
				//Bandera
				 boolean control = false;
				 ArrayList<Servicio> listServicio = new ArrayList<Servicio>();
			     Dt_Servicio dts = new Dt_Servicio();
				 listServicio = dts.listarServicio(); 	 	 
				 if(listServicio.size() == 0 || listServicio.stream().allMatch(x -> x.getEstadoservicio() == 2)){
					 control = true;
				 }else {
					 control = false;
				 }	
				 return control;
			}	
}
