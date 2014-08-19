package ar.edu.dds.ui.view

import org.uqbar.arena.widgets.Panel
import ar.edu.dds.ui.domain.Materia
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import ar.edu.dds.ui.domain.Nota
import ar.edu.dds.ui.applicationModel.SeguidorCarrera
import org.uqbar.arena.widgets.tables.Column

class MateriasWindow extends SimpleWindow<SeguidorCarrera> {
	
	new(WindowOwner parent) {
		super(parent, new SeguidorCarrera)
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Seguidor de Carrera"
		//taskDescription = "Ingrese los parametros de busqueda"

		super.createMainTemplate(mainPanel)

		this.createResultsGrid(mainPanel)
		//this.createGridActions(mainPanel)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		var searchFormPanel = new Panel(mainPanel)
		searchFormPanel.setLayout(new ColumnLayout(2))
		
		var labelNumero = new Label(searchFormPanel)
		labelNumero.text = "Seguidor de carrera"
		
		var table = new Table<Materia>(mainPanel, typeof(Materia))
		table.heigth = 200
		table.width = 450
		table.bindItemsToProperty("materias")
		table.bindValueToProperty("materiaSeleccionada")
	}
	
	override protected addActions(Panel arg0) {
		
	}
	
	def protected createResultsGrid(Panel mainPanel) {
		var table = new Table<Nota>(mainPanel, typeof(Nota))
		table.heigth = 200
		table.width = 450
		table.bindItemsToProperty("resultado")
		table.bindValueToProperty("materiaSeleccionada")
		this.describeResultsGrid(table)
		}
		
		def void describeResultsGrid(Table<Nota> table) {
		new Column<Nota>(table) //
			.setTitle("Fecha")
			.setFixedSize(150)
			.bindContentsToProperty("fecha")

		new Column<Nota>(table) //
			.setTitle("Valor")
			.setFixedSize(100)
			.bindContentsToProperty("valor")

		new Column<Nota>(table)
			.setTitle("Aprobado")
			.setFixedSize(150)
			.bindContentsToTransformer([nota | if (nota.aprobada) "SI" else "NO"])

	}
		
	
}