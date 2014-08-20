package ar.edu.dds.ui.home

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.CollectionBasedHome
import ar.edu.dds.ui.domain.Materia
import java.util.List
import ar.edu.dds.ui.domain.Nota
import org.joda.time.LocalDate
import org.apache.commons.collections15.Predicate;
import ar.edu.dds.ui.domain.Ubicacion

@Observable
class MateriasHome extends CollectionBasedHome<Materia> {
	
	new() {
		this.init()
	}
	
	def void init() {
		this.create("Sistemas y Organizaciones",
					"2012",
					true,
					"Oscal Díaz",
					new Ubicacion(1, 1), 
					newArrayList(new Nota(7, new LocalDate(2012, 5, 5), "1er Parcial"),
								 new Nota(8, new LocalDate(2012, 9, 1), "2do Parcial")
					))
					
		this.create("Paradigmas de Programación",
					"2013",
					true,
					"Nicolás Scarcella",
					new Ubicacion(2, 1), 
					newArrayList(new Nota(8, new LocalDate(2013, 5, 1), "1er Parcial"),
								 new Nota(10, new LocalDate(2013, 10, 15), "2do Parcial")
					))
					
		this.create("Arquitectura de computadoras",
					"2012",
					false,
					"Roberto Tenuta",
					new Ubicacion(2, 1), 
					newArrayList(new Nota(4, new LocalDate(2012, 5, 5), "1er Parcial"),
								 new Nota(6, new LocalDate(2012, 9, 1), "2do Parcial"),
								 new Nota(7, new LocalDate(2012, 10, 3), "TP")
					))
					
		this.create("Técnicas Avanzadas de Programación",
					"2014",
					true,
					"Demian Alonso",
					new Ubicacion(1, 3), 
					newArrayList(new Nota(8, new LocalDate(2012, 5, 5), "1er Parcial"),
								 new Nota(7, new LocalDate(2012, 9, 1), "2do Parcial"),
								 new Nota(8, new LocalDate(2012, 10, 3), "TP")
					))
	}
	
	override def Predicate<Materia> getCriterio(Materia example) {
		null
	}
	
	override createExample() {
		new Materia
	}
	
	override def Class<Materia> getEntityType() {
		typeof(Materia)
	}
	
	// Altas y bajas
	def void create(String nombre, 
					String anioDeCursada,
					Boolean finalAprobado, 
					String profesor, 
					Ubicacion ubicacion,
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
	
	def match(Object expectedValue, Object realValue) {
		if (expectedValue == null) {
			return true
		}
		if (realValue == null) {
			return false
		}
		
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}
	
}