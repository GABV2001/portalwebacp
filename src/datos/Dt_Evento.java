package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entidades.Evento;
import entidades.Familia;

public class Dt_Evento {
	
			//Atributos
			PoolConexion pc = PoolConexion.getInstance(); 
			Connection c = null;
			private ResultSet rsEvento = null;
			private ResultSet rs = null;
			private PreparedStatement ps = null;
			
			// Metodo para llenar el RusultSet
			public void llenaREventos(Connection c){
				try{
					ps = c.prepareStatement("select eventoid, nombre, descripcion, fechainicio, horainicio,fechafin, horafin, tipoevento, multimedia, hipervinculo, ubicacion ,estado, usuarioid from evento", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rsEvento = ps.executeQuery();
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR EVENTO "+ e.getMessage());
					e.printStackTrace();
				}
			}
			
			//Metodo para visualizar eventos
			public ArrayList<Evento> listarEventos(){
				ArrayList<Evento> listEvento = new ArrayList<Evento>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select eventoid, nombre, descripcion, fechainicio, horainicio,fechafin, horafin, tipoevento, multimedia, hipervinculo, ubicacion ,estado, usuarioid from evento where evento.estado <> 3 order by evento.fechainicio", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						Evento event = new Evento();
						event.setEventoid(rs.getInt("eventoid"));
						event.setNombre(rs.getString("nombre"));
						event.setDescripcion(rs.getString("descripcion"));
						event.setFechainicio(rs.getString("fechainicio"));
						event.setHorainicio(rs.getString("horainicio"));
						event.setFechafin(rs.getString("fechafin"));
						event.setHorafin(rs.getString("horafin"));
						event.setTipoevento(rs.getInt("tipoevento"));
						event.setMultimedia(rs.getString("multimedia"));
						event.setHipervinculo(rs.getString("hipervinculo"));
						event.setUbicacion(rs.getString("ubicacion"));
						event.setEstado(rs.getInt("estado"));
						event.setUsuarioid(rs.getInt("usuarioid"));
						listEvento.add(event);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR EVENTO "+ e.getMessage());
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
				return listEvento;
			}
			
			//Metodo para almacenar nuevo evento
			public boolean guardarEventos(Evento ev){
				boolean guardado = false;
				
				try{
					c = PoolConexion.getConnection();
					this.llenaREventos(c);
					rsEvento.moveToInsertRow();
					rsEvento.updateString("nombre", ev.getNombre());
					rsEvento.updateString("descripcion", ev.getDescripcion());
					rsEvento.updateString("fechainicio", ev.getFechainicio());
					rsEvento.updateString("horainicio", ev.getHorainicio());
					rsEvento.updateString("fechafin", ev.getFechafin());
					rsEvento.updateString("horafin", ev.getHorafin());
					rsEvento.updateInt("tipoevento", ev.getTipoevento());	
					rsEvento.updateString("multimedia", ev.getMultimedia());
					rsEvento.updateString("hipervinculo", ev.getHipervinculo());
					rsEvento.updateString("ubicacion", ev.getUbicacion());										
					rsEvento.updateInt("estado", 1);
					rsEvento.updateInt("usuarioid", 1);
					rsEvento.insertRow();
					rsEvento.moveToCurrentRow();
					guardado = true;
				}
				catch (Exception e) {
					System.err.println("ERROR AL GUARDAR EVENTO "+e.getMessage());
					e.printStackTrace();
				}
				finally{
					try {
						if(rsEvento != null){
							rsEvento.close();
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
