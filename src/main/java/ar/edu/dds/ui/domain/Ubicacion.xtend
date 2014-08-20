package ar.edu.dds.ui.domain

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

@Observable
class Ubicacion extends Entity {
	
	@Property int cuatrimestre
	@Property int nivel

	new() {}

	new (int cuatrimestre, int nivel) {
		this.cuatrimestre = cuatrimestre
		this.nivel = nivel
	}
	
	def getDescripcion() {
		toString
	}
	
	override def toString() {
		new StringBuilder().append(cuatrimestre)
						   .append(sufijoPara(cuatrimestre))
						   .append(" Cuatrimestre ")
						   .append(nivel)
						   .append(" - ")
						   .append("nivel").toString
	}
	
	private def sufijoPara(int i) {
		if (i == 1) "er"
		else if (i == 2) "do"
		else ""
	}
	
}