package ar.edu.dds.ui.runnable

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.dds.ui.home.MateriasHome
import ar.edu.dds.ui.view.MateriasWindow
import ar.edu.dds.ui.domain.Materia
import ar.edu.dds.ui.domain.Ubicacion
import ar.edu.dds.ui.home.UbicacionesHome

class MateriasApplication extends Application {
	
	static def void main(String[] args) { 
		new MateriasApplication().start
	}

	override protected Window<?> createMainWindow() {
		ApplicationContext.instance.configureSingleton(typeof(Materia), new MateriasHome)
		ApplicationContext.instance.configureSingleton(typeof(Ubicacion), new UbicacionesHome)
		return new MateriasWindow(this)
	}
} 