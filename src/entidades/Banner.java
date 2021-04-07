package entidades;

public class Banner {	
	
	//Atributos	
	private int BannerID;
	private  int UsuarioID;
	private String Descripcion;
	private String Image;
	private int Estado;
	
	//Metodos
	public int getBannerID() {
		return BannerID;
	}
	public void setBannerID(int bannerID) {
		BannerID = bannerID;
	}
	public int getUsuarioID() {
		return UsuarioID;
	}
	public void setUsuarioID(int usuarioID) {
		UsuarioID = usuarioID;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public int getEstado() {
		return Estado;
	}
	public void setEstado(int estado) {
		Estado = estado;
	}
	
	

}
