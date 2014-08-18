package ar.edu.dds.ui.home

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.CollectionBasedHome
import ar.edu.dds.ui.domain.Materia
import java.util.List
import ar.edu.dds.ui.domain.Nota
import org.joda.time.LocalDate

@Observable
class MateriasHome extends CollectionBasedHome<Materia> {
	
	new() {
		this.init()
	}
	
	@Property Materia materiaSeleccionada
	
	def void init() {
		this.create("Sistemas y Organizaciones",
					"2012",
					true,
					"Oscal Díaz",
					"Anual 2012", 
					newArrayList(new Nota(7, new LocalDate(2012, 5, 5), "1er Parcial"),
								 new Nota(8, new LocalDate(2012, 9, 1), "2do Parcial")
					))
					
		this.create("Paradigmas de Programación",
					"2013",
					true,
					"Nicolás Scarcella",
					"Anual 2013", 
					newArrayList(new Nota(8, new LocalDate(2013, 5, 1), "1er Parcial"),
								 new Nota(10, new LocalDate(2013, 10, 15), "2do Parcial")
					))
	}
	
	override def getCriterio(Materia example) {
		null
	}
	
	override createExample() {
		new Materia
	}
	
	override getEntityType() {
		typeof(Materia)
	}
	
	// Altas y bajas
	def void create(String nombre, 
					String anioDeCursada,
					Boolean finalAprobado, 
					String profesor, 
					String ubicacion,
					List<Nota> notas) {
		
		val materia = new Materia
		materia.nombre = nombre
		materia.anioDeCursada = anioDeCursada
		materia.finalAprobado = finalAprobado
		materia.profesor = profesor
		materia.ubicacion = ubicacion
		materia.notas = notas
		
		this.create(materia)
	}
	
}