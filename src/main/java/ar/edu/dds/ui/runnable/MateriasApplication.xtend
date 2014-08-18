package ar.edu.dds.ui.runnable

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.dds.ui.home.MateriasHome
import ar.edu.dds.ui.domain.Materia
import ar.edu.dds.ui.view.MateriasWindow

class MateriasApplication extends Application {
	
	static def void main(String[] args) { 
		new MateriasApplication().start()
	}

	override protected Window<?> createMainWindow() {
		ApplicationContext.instance.configureSingleton(typeof(MateriasHome), new MateriasHome)
		
		return new MateriasWindow(this)
	}
}