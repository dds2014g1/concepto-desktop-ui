package ar.edu.dds.ui.view

import org.uqbar.arena.windows.WindowOwner
import ar.edu.dds.ui.domain.Materia
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel

class CrearNuevaMateriaWindow extends Dialog<Materia>{
	
	new (WindowOwner owner){
		super(owner, new Materia)
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
	}
	
	
	
	
	
}