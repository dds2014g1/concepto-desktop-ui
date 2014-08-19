package ar.edu.dds.ui.applicationModel

import java.io.Serializable
import org.uqbar.commons.utils.Observable
import ar.edu.dds.ui.domain.Materia
import java.util.List
import ar.edu.dds.ui.domain.Nota

@Observable
class SeguidorCarrera implements Serializable{
	
	@Property Integer anioCursada
	@Property Boolean finalDado
	@Property String profesor
	@Property String uicacionMateria
	@Property List<Nota> resultado
	@Property List<Materia> materias
	@Property Materia materiaSeleccionada
	@Property Nota notaSeleccionada
	
	
	
}