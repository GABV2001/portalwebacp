package vistas;

public class ViewDistribucion {
	
		//Atributos
		private int DistribucionID;
		private String Distribucion;
		private String Descripcion;
		private int Estado;
		private String Region;
		
		public int getDistribucionID() {
			return DistribucionID;
		}
		public void setDistribucionID(int distribucionID) {
			DistribucionID = distribucionID;
		}
		public String getDistribucion() {
			return Distribucion;
		}
		public void setDistribucion(String distribucion) {
			Distribucion = distribucion;
		}
		public String getDescripcion() {
			return Descripcion;
		}
		public void setDescripcion(String descripcion) {
			Descripcion = descripcion;
		}
		public String getRegion() {
			return Region;
		}
		public void setRegion(String region) {
			Region = region;
		}
		public int getEstado() {
			return Estado;
		}
		public void setEstado(int estado) {
			Estado = estado;
		}	    
}