package entidades;

import java.sql.Timestamp;

public class Publicacion {
	//Atributos
	private int publicacionid;
	private String titulo;
	private String descripcion;
	private Timestamp fcreacion;
	private Timestamp fmodificacion;
	private Timestamp feliminacion;
	private String multimedia;
	private int estadopublicacion;
	private int estado;
	private int usuarioid;
	
	//Metodos

	public String getTitulo() {
		return titulo;
	}
	public int getPublicacionid() {
		return publicacionid;
	}
	public void setPublicacionid(int publicacionid) {
		this.publicacionid = publicacionid;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getMultimedia() {
		return multimedia;
	}
	public void setMultimedia(String multimedia) {
		this.multimedia = multimedia;
	}
	public int getEstadopublicacion() {
		return estadopublicacion;
	}
	public void setEstadopublicacion(int estadopublicacion) {
		this.estadopublicacion = estadopublicacion;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public int getUsuarioid() {
		return usuarioid;
	}
	public void setUsuarioid(int usuarioid) {
		this.usuarioid = usuarioid;
	}
	public Timestamp getFcreacion() {
		return fcreacion;
	}
	public void setFcreacion(Timestamp fcreacion) {
		this.fcreacion = fcreacion;
	}
	public Timestamp getFmodificacion() {
		return fmodificacion;
	}
	public void setFmodificacion(Timestamp fmodificacion) {
		this.fmodificacion = fmodificacion;
	}
	public Timestamp getFeliminacion() {
		return feliminacion;
	}
	public void setFeliminacion(Timestamp feliminacion) {
		this.feliminacion = feliminacion;
	}
}
