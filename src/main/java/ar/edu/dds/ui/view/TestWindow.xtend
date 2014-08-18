package ar.edu.dds.ui.view

import org.uqbar.arena.windows.MainWindow
import ar.edu.dds.ui.domain.ClasdeDeDominioEjemplo
import org.uqbar.arena.widgets.Panel

class TestWindow extends MainWindow<ClasdeDeDominioEjemplo> {
	
	new() {
		super(new ClasdeDeDominioEjemplo)
	}
	
	override createContents(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def static main(String[] args) {
		new TestWindow().startApplication
	}
}