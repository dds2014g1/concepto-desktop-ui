package ar.edu.dds.ui.domain

import org.uqbar.commons.utils.Observable
import org.joda.time.LocalDate

@Observable
class Nota {
	
	@Property Integer valor
	@Property LocalDate fecha
	@Property String descripcion
	
	new(){}
	
		
	new(Integer valor, LocalDate fecha, String descripcion) {
		this.valor = valor
		this.fecha = fecha
		this.descripcion = descripcion
	}
	
	def boolean isAprobado () {
		valor != null && valor > 4
	}
	
	def Boolean estaCompleta() {
		valor != null && fecha != null
	}
		
}