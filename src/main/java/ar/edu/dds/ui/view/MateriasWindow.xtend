package ar.edu.dds.ui.view

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import ar.edu.dds.ui.domain.Nota
import ar.edu.dds.ui.applicationModel.SeguidorCarrera
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout

class MateriasWindow extends SimpleWindow<SeguidorCarrera> {

	new(WindowOwner parent) {
		super(parent, new SeguidorCarrera)
		modelObject.search()
	}

	override def createMainTemplate(Panel mainPanel) {
		title = "Seguidor de Carrera"

		super.createMainTemplate(mainPanel)

		this.createResultsGrid(mainPanel)

		this.createGridActions(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {
		var searchFormPanel = new Panel(mainPanel)
		searchFormPanel.setLayout(new ColumnLayout(2))

		var labelNumero = new Label(searchFormPanel)
		labelNumero.text = "Seguidor de carrera"

		var listado = new List(mainPanel)
		listado.heigth = 200
		listado.width = 450
		listado.bindItemsToProperty("materias")
		listado.bindValueToProperty("materiaSeleccionada")
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) //
			.setCaption("Nueva materia")
			.onClick [ | this.crearMateria ]
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
		.setTitle("Fecha").setFixedSize(150).bindContentsToProperty("fecha")

		new Column<Nota>(table) //
		.setTitle("Valor").setFixedSize(100).bindContentsToProperty("valor")

		new Column<Nota>(table).setTitle("Aprobado").setFixedSize(150).
			bindContentsToTransformer([nota|if(nota.aprobada) "SI" else "NO"])

	}

	def void createGridActions(Panel mainPanel) {
		var actionsPanel = new Panel(mainPanel)
		actionsPanel.setLayout(new HorizontalLayout)

		var edit = new Button(actionsPanel)
			.setCaption("Editar")
			.onClick[|this.editarNota]

		var remove = new Button(actionsPanel)
			.setCaption("Borrar")
			.onClick[|modelObject.eliminarNotaSeleccionada]

		var add = new Button(actionsPanel)
			.setCaption("Agregar")
			.onClick[|this.agregarNota]
			
	}


			
	def void crearMateria(){
		this.openDialog(new CrearNuevaMateriaWindow(this))
		
	}
	
	def void editarNota(){
		this.openDialog(new EditarNotaWindow(this, modelObject.notaSeleccionada))
		
	}
	
	def void agregarNota(){
		this.openDialog(new AgregarNotaWindow(this))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open

	}
}

