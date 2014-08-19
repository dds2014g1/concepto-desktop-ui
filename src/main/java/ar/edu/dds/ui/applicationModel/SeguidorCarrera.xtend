package ar.edu.dds.ui.applicationModel

import java.io.Serializable
import org.uqbar.commons.utils.Observable
import ar.edu.dds.ui.domain.Materia
import java.util.List
import ar.edu.dds.ui.domain.Nota
import ar.edu.dds.ui.home.MateriasHome
import org.uqbar.commons.utils.ApplicationContext
import java.util.ArrayList

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

	
	def void search(){
		
		resultado = new ArrayList<Nota>
		resultado = getHomeMaterias.search(materiaSeleccionada)
		
	}
	
	def void eliminarNotaSeleccionada(){
		getHomeMaterias().delete(materiaSeleccionada)
		this.search()
		materiaSeleccionada = null
	}
	
	def MateriasHome getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}
	
}