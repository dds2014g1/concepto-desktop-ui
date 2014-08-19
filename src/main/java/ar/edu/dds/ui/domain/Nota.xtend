package ar.edu.dds.ui.domain

import org.joda.time.LocalDate

class Nota {
	
	@Property Integer valor
	@Property LocalDate fecha
	@Property String descripcion
	@Property Boolean aprobado
	
	new(){}
	
		
	new(Integer valor, LocalDate fecha, String descripcion) {
		this.valor = valor
		this.fecha = fecha
		this.descripcion = descripcion
	}
	
	def boolean aprobada (){
		valor > 4
	}
		
}