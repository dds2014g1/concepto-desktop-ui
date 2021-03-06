package ar.edu.dds.ui.domain

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity
import java.util.List
import java.util.ArrayList

@Observable
class Materia extends Entity {
	
	@Property String nombre
	@Property String anioDeCursada
	@Property String profesor
	@Property Ubicacion ubicacion
	@Property boolean finalAprobado
	
	@Property List<Nota> notas
	
	
	new (){
		notas = new ArrayList
	}
	
	def setUbicacion(Ubicacion ubicacion) {
		println("Seteando ubicacion: " + ubicacion.toString)
		this._ubicacion = ubicacion
	}
	
	
}