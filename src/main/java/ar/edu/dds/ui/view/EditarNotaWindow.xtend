package ar.edu.dds.ui.view

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.dds.ui.domain.Nota

class EditarNotaWindow extends Dialog<Nota> {
	
	new(WindowOwner owner, Nota nota) {
		super(owner, nota)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
	}
	
	
	
}