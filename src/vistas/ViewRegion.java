package vistas;

public class ViewRegion {
	
	//Atributos
	private int regionid;
	private String NombreRegion;
	private String Descripcion;
	private int Estado;
	private String Pais;
	
	
	//Metodos	
	public int getRegionid() {
		return regionid;
	}
	public String getPais() {
		return Pais;
	}
	public void setPais(String pais) {
		Pais = pais;
	}
	public void setRegionid(int regionid) {
		this.regionid = regionid;
	}
	public String getNombreRegion() {
		return NombreRegion;
	}
	public void setNombreRegion(String nombreRegion) {
		NombreRegion = nombreRegion;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	public int getEstado() {
		return Estado;
	}
	public void setEstado(int estado) {
		Estado = estado;
	}	
}