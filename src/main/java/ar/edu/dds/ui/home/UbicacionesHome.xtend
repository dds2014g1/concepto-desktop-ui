package ar.edu.dds.ui.home

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.CollectionBasedHome
import java.util.List
import org.apache.commons.collections15.Predicate;
import ar.edu.dds.ui.domain.Ubicacion

@Observable
class UbicacionesHome extends CollectionBasedHome<Ubicacion> {
	
	new() {
		this.init()
	}
	
	def void init() {
		this.create(new Ubicacion(1, 1))
		this.create(new Ubicacion(2, 1))
		this.create(new Ubicacion(1, 2))
		this.create(new Ubicacion(2, 2))
		this.create(new Ubicacion(1, 3))
		this.create(new Ubicacion(2, 3))
		this.create(new Ubicacion(1, 4))
		this.create(new Ubicacion(2, 4))
		this.create(new Ubicacion(1, 5))
		this.create(new Ubicacion(2, 5))
					
	}
	
	def Ubicacion get(String descripcion) {
		ubicaciones.findFirst [ ubicacion | ubicacion.descripcion.equals(descripcion) ]
	}
	
	def List<Ubicacion> getUbicaciones() {
		allInstances	
	}
	
	override def Predicate<Ubicacion> getCriterio(Ubicacion example) {
		null
	}
	
	override createExample() {
		new Ubicacion
	}
	
	override def Class<Ubicacion> getEntityType() {
		typeof(Ubicacion)
	}
	
}