package ar.edu.dds.ui.view

import org.uqbar.arena.windows.WindowOwner
import ar.edu.dds.ui.domain.Nota

class AgregarNotaWindow extends EditarNotaWindow{
	
	
	new(WindowOwner owner) {
		super(owner, new Nota)
	}
	
	
	
}