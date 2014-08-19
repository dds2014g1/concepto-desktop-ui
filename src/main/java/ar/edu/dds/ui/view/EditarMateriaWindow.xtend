package ar.edu.dds.ui.view

import org.uqbar.arena.windows.WindowOwner
import ar.edu.dds.ui.domain.Materia
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel

class EditarMateriaWindow extends Dialog<Materia> {
	
	new(WindowOwner owner, Materia model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}