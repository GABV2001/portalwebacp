package entidades;

public class TipoProducto {
	//Atributos
	private int tipoproducotid;
	private String nombre;
	private String descripcion;
	private int estado;
	
	//Metodos
	public int getTipoproducotid() {
		return tipoproducotid;
	}
	public void setTipoproducotid(int tipoproducotid) {
		this.tipoproducotid = tipoproducotid;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	
}
