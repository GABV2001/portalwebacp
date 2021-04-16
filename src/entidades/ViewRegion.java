package entidades;

public class ViewRegion {
	
	//Atributos
	private int regionid;
	private String NombreRegion;
	private String Descripcion;
	private String NombrePais;
	
	//Metodos
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
	public String getNombrePais() {
		return NombrePais;
	}
	public void setNombrePais(String nombrePais) {
		NombrePais = nombrePais;
	}	
	public int getRegionid() {
		return regionid;
	}
	public void setRegionid(int regionid) {
		this.regionid = regionid;
	}

}
