package negocio;

import java.util.ArrayList;

import datos.Dt_Servicio;
import entidades.Servicio;

public class Ng_Servicio {
	public static boolean validarVisibilidad(){
		 ArrayList<Servicio> listServicio = new ArrayList<Servicio>();
	     Dt_Servicio dts = new Dt_Servicio();
		 listServicio = dts.listarServicio(); 	 	 
		 if(listServicio.size() == 0 || listServicio.stream().allMatch(x -> x.getEstadoservicio() == 2)){
			 return true;
		 }else {
			 return false;
		 }	
	}
}
