package entidades;

public class Inicio {

	//Atributos
	private int InicioID;
	private int	UsuarioID;
	private String Historia;
	private String Mision;
	private String Vision;
	private String img_historia;
	private String img_vision;
	private String img_mision;
	private int Estado;
	
	
	//Metodos
	public int getInicioID() {
		return InicioID;
	}
	public void setInicioID(int inicioID) {
		InicioID = inicioID;
	}
	public int getUsuarioID() {
		return UsuarioID;
	}
	public void setUsuarioID(int usuarioID) {
		UsuarioID = usuarioID;
	}
	public String getHistoria() {
		return Historia;
	}
	public void setHistoria(String historia) {
		Historia = historia;
	}
	public String getMision() {
		return Mision;
	}
	public void setMision(String mision) {
		Mision = mision;
	}
	public String getVision() {
		return Vision;
	}
	public void setVision(String vision) {
		Vision = vision;
	}
	public String getImg_historia() {
		return img_historia;
	}
	public void setImg_historia(String img_historia) {
		this.img_historia = img_historia;
	}
	public String getImg_vision() {
		return img_vision;
	}
	public void setImg_vision(String img_vision) {
		this.img_vision = img_vision;
	}
	public String getImg_mision() {
		return img_mision;
	}
	public void setImg_mision(String img_mision) {
		this.img_mision = img_mision;
	}
	public int getEstado() {
		return Estado;
	}
	public void setEstado(int estado) {
		Estado = estado;
	}
	
}

