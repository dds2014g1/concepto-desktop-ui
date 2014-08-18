package ar.edu.dds.ui.domain

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity
import java.util.List

@Observable
class Materia extends Entity {
	
	@Property String nombre
	@Property String anioDeCursada
	@Property String profesor
	@Property String ubicacion
	@Property Boolean finalAprobado
	
	@Property List<Nota> notas
	
	
}