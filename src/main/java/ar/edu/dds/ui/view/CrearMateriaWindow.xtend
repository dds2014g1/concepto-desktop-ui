package ar.edu.dds.ui.view

import org.uqbar.arena.windows.WindowOwner
import ar.edu.dds.ui.domain.Materia

class CrearMateriaWindow extends EditarMateriaWindow{
	
	new(WindowOwner owner) {
		super(owner, new Materia)
	}
}