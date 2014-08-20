package ar.edu.dds.ui.applicationModel

import java.io.Serializable
import org.uqbar.commons.utils.Observable
import ar.edu.dds.ui.domain.Materia
import java.util.List
import ar.edu.dds.ui.domain.Nota
import ar.edu.dds.ui.home.MateriasHome
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.dds.ui.domain.Ubicacion
import java.util.ArrayList

@Observable
class SeguidorCarrera implements Serializable {
	
	@Property Integer anioCursada
	@Property Boolean finalAprobado
	@Property String profesor
	@Property Ubicacion ubicacionMateria
	@Property List<Nota> resultado
	@Property List<Materia> materias
	@Property Materia materiaSeleccionada
	@Property Nota notaSeleccionada

//	def void setMateriaSeleccionada(Materia m) {
//		this._materiaSeleccionada = m
//		println(m.profesor)
//	}
	
	def void search(){
		
		materias = new ArrayList<Materia>
		materias = homeMaterias.allInstances.toList
	}
	
	def void eliminarNotaSeleccionada(){
		materiaSeleccionada.notas.remove(notaSeleccionada)
		notaSeleccionada = null		
	}
	
	def MateriasHome getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}
	
}