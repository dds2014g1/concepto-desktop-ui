package ar.edu.dds.ui.applicationModel

import ar.edu.dds.ui.domain.Materia
import ar.edu.dds.ui.domain.Nota
import ar.edu.dds.ui.home.MateriasHome
import java.io.Serializable
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable

@Observable
class SeguidorCarrera implements Serializable{
	
	@Property Integer anioCursada
	@Property Boolean finalDado
	@Property String profesor
	@Property String uicacionMateria
	@Property List<Nota> resultado
	@Property List<Materia> materias
	@Property String materiaSeleccionada
	@Property Nota notaSeleccionada

	
	def void search(){
		
		materias = new ArrayList<Materia>
		materias = getHomeMaterias.search(materiaSeleccionada)
		
	}
	
	def void eliminarNotaSeleccionada(){
		
		//hay que hacer que se pueda eliminar una nota de una materia
		//getHomeMaterias().delete(materiaSeleccionada) 
		this.search()
		notaSeleccionada = null
	}
	
	def MateriasHome getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}
	
}