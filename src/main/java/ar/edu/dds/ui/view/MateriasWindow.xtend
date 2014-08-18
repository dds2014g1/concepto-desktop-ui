package ar.edu.dds.ui.view

import org.uqbar.arena.widgets.Panel
import ar.edu.dds.ui.domain.Materia
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import ar.edu.dds.ui.home.MateriasHome

class MateriasWindow extends SimpleWindow<MateriasHome> {
	
	new(WindowOwner parent) {
		super(parent, new MateriasHome)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		var searchFormPanel = new Panel(mainPanel)
		searchFormPanel.setLayout(new ColumnLayout(2))
		
		var labelNumero = new Label(searchFormPanel)
		labelNumero.text = "Seguidor de carrera"
		
		var table = new Table<Materia>(mainPanel, typeof(Materia))
		table.heigth = 200
		table.width = 450
		table.bindItemsToProperty("objects")
		//table.bindValueToProperty("materiaSeleccionada")
	}
	
	override protected addActions(Panel arg0) {
		
	}
	
}