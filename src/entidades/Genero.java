package entidades;

public class Genero {
	
		//Atributos
		private int GeneroID;
		private String Nombre;
		private String Descripcion;
		
		//Metodos
		public int getGeneroID() {
			return GeneroID;
		}
		public void setGeneroID(int generoID) {
			GeneroID = generoID;
		}
		public String getNombre() {
			return Nombre;
		}
		public void setNombre(String nombre) {
			Nombre = nombre;
		}
		public String getDescripcion() {
			return Descripcion;
		}
		public void setDescripcion(String descripcion) {
			Descripcion = descripcion;
		}

}
