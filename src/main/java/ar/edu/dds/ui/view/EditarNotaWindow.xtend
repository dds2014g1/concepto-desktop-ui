package ar.edu.dds.ui.view

import ar.edu.dds.ui.domain.Materia
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.dds.ui.domain.Nota

class EditarNotaWindow extends Dialog<Materia> {
	
	new(WindowOwner owner, Nota nota) {
		super(owner, nota)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
	}
	
	
	
}