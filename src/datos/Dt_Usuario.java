package datos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import entidades.Usuario;
import vistas.ViewRolUsuario;

public class Dt_Usuario {
	//Atributos
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsUsuario = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para llenar el RusultSet
	public void llenaRsUsuario(Connection c){
		try{
			ps = c.prepareStatement("SELECT usuarioid, nombres, apellidos, email, usuario, contra, telefono,estado, url_foto,fcreacion, fmodificacion, feliminacion FROM usuario where estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsUsuario = ps.executeQuery();
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR USUARIOS "+ e.getMessage());
			e.printStackTrace();
		}
	}
	//Metodo para visualizar usuarios registrados y activos
		public ArrayList<Usuario> listaUserActivos(){
			ArrayList<Usuario> listUser = new ArrayList<Usuario>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("SELECT usuarioid, nombres, apellidos, email, telefono,usuario, contra, estado, url_foto,fcreacion, fmodificacion, feliminacion FROM usuario where estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Usuario user = new Usuario();
					user.setIdUser(rs.getInt("usuarioid"));
					user.setUser(rs.getString("usuario"));
					user.setPwd(rs.getString("contra"));
					user.setNombre(rs.getString("nombres"));
					user.setApellido(rs.getString("apellidos"));
					user.setfCreacion(rs.getTimestamp("fcreacion"));
					user.setEmail(rs.getString("email"));
					user.setTelefono(rs.getString("telefono"));
					user.setEstado(rs.getInt("estado"));
					listUser.add(user);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR USUARIOS "+ e.getMessage());
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
			return listUser;
		}
		// Metodo para visualizar los datos de un usuario especifico
		public Usuario getUsuario(int idUsuario)
		{
			Usuario user = new Usuario();
			try
			{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select usuarioid, nombres, apellidos, email, telefono ,usuario, contra, estado, url_foto, fcreacion, fmodificacion, feliminacion from usuario where estado <> 3 and usuarioid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, idUsuario);
				rs = ps.executeQuery();
				if(rs.next())
				{
					user.setIdUser(idUsuario);
					user.setUser(rs.getString("usuario"));
					user.setPwd(rs.getString("contra"));
					user.setNombre(rs.getString("nombres"));
					user.setApellido(rs.getString("apellidos"));
					user.setUrl_foto(rs.getString("url_foto"));
					user.setEmail(rs.getString("email"));
					user.setTelefono(rs.getString("telefono"));
					user.setEstado(rs.getInt("estado"));
				}
			}
			catch (Exception e)
			{
				System.out.println("DATOS ERROR getUsuario(): "+ e.getMessage());
				e.printStackTrace();
			}
			finally
			{
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
			
			return user;
		}
		
		//Metodo para almacenar nuevo usuario
		public boolean guardarUser(Usuario user){
			boolean guardado = false;
			
			try{
				c = PoolConexion.getConnection();
				this.llenaRsUsuario(c);
				rsUsuario.moveToInsertRow();
				rsUsuario.updateString("usuario", user.getUser());
				rsUsuario.updateString("contra", user.getPwd());
				rsUsuario.updateString("nombres", user.getNombre());
				rsUsuario.updateString("apellidos", user.getApellido());
				rsUsuario.updateTimestamp("fcreacion", user.getfCreacion());
				rsUsuario.updateString("email", user.getEmail());
				rsUsuario.updateString("telefono",user.getTelefono());
				rsUsuario.updateInt("Estado", 1);
				rsUsuario.insertRow();
				rsUsuario.moveToCurrentRow();
				guardado = true;
			}
			catch (Exception e) {
				System.err.println("ERROR AL GUARDAR Usuario "+e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rsUsuario != null){
						rsUsuario.close();
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
		// Metodo para modificar usuario
		public boolean modificarUser(Usuario user)
		{
			boolean modificado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsUsuario(c);
				rsUsuario.beforeFirst();
				while (rsUsuario.next())
				{
					if(rsUsuario.getInt(1)==user.getIdUser())
					{
						rsUsuario.updateString("usuario", user.getUser());
						rsUsuario.updateString("nombres", user.getNombre());
						rsUsuario.updateString("apellidos", user.getApellido());
						rsUsuario.updateTimestamp("fmodificacion", user.getfModificacion());
						rsUsuario.updateString("email", user.getEmail());
						rsUsuario.updateString("telefono",user.getTelefono());	
						if(user.getPwd().equals(null) || user.getPwd().equals("")){
							
						}else {
						rsUsuario.updateString("contra", user.getPwd());
						}

						rsUsuario.updateInt("estado", 2);						
						rsUsuario.updateRow();
						modificado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ACTUALIZAR USUARIO "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsUsuario != null){
						rsUsuario.close();
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
		
		// Metodo para eliminar usuario
		public boolean eliminarUser(int idUsuario)
		{
			boolean eliminado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsUsuario(c);
				rsUsuario.beforeFirst();
				Date fechaSistema = new Date();
				while (rsUsuario.next())
				{
					if(rsUsuario.getInt(1)==idUsuario)
					{
						rsUsuario.updateTimestamp("feliminacion", new java.sql.Timestamp(fechaSistema.getTime()));
						rsUsuario.updateInt("estado", 3);
						rsUsuario.updateRow();
						eliminado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ELIMINAR USUARIO "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsUsuario != null){
						rsUsuario.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return eliminado;
		}
		// Metodo para guardar la foto del Usuario
		public boolean guardarFotoUser(int idUser, String urlFoto)
		{
			boolean actualizado = false;
			
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsUsuario(c);	
				rsUsuario.beforeFirst();
				while(rsUsuario.next())
				{
					if(rsUsuario.getInt(1)==idUser)
					{
						
						rsUsuario.updateString("url_foto", urlFoto);
						rsUsuario.updateInt("estado", 2);
						rsUsuario.updateRow();
						actualizado = true;
						break;
					}
				}
			}
			catch (Exception e) 
			{
				System.err.println("ERROR AL GUARDAR FOTO "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsUsuario != null){
						rsUsuario.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return actualizado;
		}
		
		// METODO PARA VERIFICAR USUARIO Y PWD //
		public boolean dtverificarLogin(String login, String clave, int rol)
		{
			boolean existe=false;
			String SQL = ("SELECT * FROM vw_usuario_rol WHERE usuario=? AND contra=? AND rolid=?");
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement(SQL);
				ps.setString(1, login);
				ps.setString(2, clave);
				ps.setInt(3, rol);
				rs = ps.executeQuery();
				if(rs.next()){
					existe=true;
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR AL VERIFICAR EL LOGIN "+ e.getMessage());
				e.printStackTrace();
			}
			finally {
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
		
		// METODO PARA OBTENER UN OBJETO DE TIPO Vw_RolUser //
		public ViewRolUsuario dtGetRU(String login)
		{
			ViewRolUsuario vwru = new ViewRolUsuario();
		String SQL = ("SELECT * FROM vw_usuario_rol where usuario=?");
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(SQL);
			ps.setString(1, login);
			rs = ps.executeQuery();
			if(rs.next()){
				vwru.setIdrol_usuario(rs.getInt("idrol_usuario"));
				vwru.setUsuarioid(rs.getInt("usuarioid"));
				vwru.setRolid(rs.getInt("rolid"));
				vwru.setUsuario(rs.getString("usuario"));
				vwru.setRol(rs.getString("rol"));
				vwru.setContra(rs.getString("contra"));
				vwru.setNombres(rs.getString("nombres"));
				vwru.setApellidos(rs.getString("apellidos"));
				vwru.setUrl_foto(rs.getString("url_foto"));
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN dtGetRU "+ e.getMessage());
			e.printStackTrace();
		}
		finally {
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
		return vwru;
	}
}
