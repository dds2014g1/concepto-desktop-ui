package ar.edu.dds.ui.domain

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity
import java.util.List

@Observable
class Materia extends Entity {
	
	@Property String nombre
	@Property String anioDeCursada
	@Property String profesor
	@Property Ubicacion ubicacion
	@Property Boolean finalAprobado
	
	@Property List<Nota> notas
	
	def setUbicacion(Ubicacion ubicacion) {
		println("Seteando ubicacion: " + ubicacion.toString)
		this._ubicacion = ubicacion
	}
	
	
}