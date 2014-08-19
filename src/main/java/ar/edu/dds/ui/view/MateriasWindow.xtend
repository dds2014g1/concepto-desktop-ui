package ar.edu.dds.ui.view

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import ar.edu.dds.ui.domain.Nota
import ar.edu.dds.ui.applicationModel.SeguidorCarrera
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.bindings.PropertyAdapter
import ar.edu.dds.ui.domain.Materia
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.CheckBox

class MateriasWindow extends SimpleWindow<SeguidorCarrera> {

	new(WindowOwner parent) {
		super(parent, new SeguidorCarrera)
		modelObject.search()
	}

	override def createMainTemplate(Panel mainPanel) {
		title = "Seguidor de Carrera"

		super.createMainTemplate(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {

		var panelContendor = new Panel(mainPanel)
		panelContendor.setLayout(new HorizontalLayout)
		
		var panelListaDeMaterias = new Panel(panelContendor)
		panelListaDeMaterias.setLayout(new VerticalLayout)

		var labelTitulo = new Label(panelListaDeMaterias)
		labelTitulo.text = "Seguidor de carrera"

		var listado = new List(panelListaDeMaterias)
		listado.heigth = 300
		listado.width = 250
		listado.bindItemsToProperty("materias")
			.setAdapter(new PropertyAdapter(typeof(Materia), "nombre"))
		
		listado.bindValueToProperty("materiaSeleccionada")
		
		var panelDerecho = this.crearDetalleDeMateria(panelContendor)
		
		this.crearTablaDeNotas(panelDerecho)

		this.crearAccionesDeNotas(panelDerecho)
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) //
			.setCaption("Nueva materia")
			.onClick [ | this.crearMateria ]
	}

	def protected crearTablaDeNotas(Panel panelPadre) {

		var table = new Table<Nota>(panelPadre, typeof(Nota))
		table.heigth = 200
		table.width = 450
		table.bindItemsToProperty("materiaSeleccionada.notas")
		table.bindValueToProperty("notaSeleccionada")
		
		new Column<Nota>(table) //
		.setTitle("Fecha").setFixedSize(150).bindContentsToProperty("fecha")

		new Column<Nota>(table) //
		.setTitle("Valor").setFixedSize(100).bindContentsToProperty("valor")

		new Column<Nota>(table).setTitle("Aprobado").setFixedSize(150).
			bindContentsToTransformer([nota|if(nota.aprobado) "SI" else "NO"])

	}
	
	def Panel crearDetalleDeMateria(Panel panelPadre) {
		
		var detalleDeMateriaPanel = new Panel(panelPadre)
		detalleDeMateriaPanel.setLayout(new VerticalLayout)
		detalleDeMateriaPanel.width = 600
		
		var labelNombre = new Label(detalleDeMateriaPanel)
		labelNombre.bindValueToProperty("materiaSeleccionada.nombre")
		labelNombre.fontSize = 14
		
		// Renglón 1
		var renglon1Panel = new Panel(detalleDeMateriaPanel)
		renglon1Panel.layout = new HorizontalLayout
		
		var labelAnioDeCursada = new Label(renglon1Panel)
		labelAnioDeCursada.text = "Año de cursada: "
		
		var textBoxAnioDeCursada = new TextBox(renglon1Panel)
		textBoxAnioDeCursada.width = 50
		textBoxAnioDeCursada.bindValueToProperty("materiaSeleccionada.anioDeCursada")

		var aproboCheckbox = new CheckBox(renglon1Panel)
		aproboCheckbox.bindValueToProperty("materiaSeleccionada.finalAprobado")
		
		var labelAprobo = new Label(renglon1Panel)
		labelAprobo.text = "Final Aprobado"
		
		// Renglón 2
		var renglon2Panel = new Panel(detalleDeMateriaPanel)
		renglon2Panel.layout = new HorizontalLayout
		
		var labelProfesor = new Label(renglon2Panel)
		labelProfesor.text = "Profesor de cursada: "
		
		var textBoxProfesor = new TextBox(renglon2Panel)
		textBoxProfesor.bindValueToProperty("materiaSeleccionada.profesor")
		textBoxProfesor.width = 150
		
		// Renglón 3
		var renglon3Panel = new Panel(detalleDeMateriaPanel)
		renglon3Panel.layout = new HorizontalLayout
		
		var labelUbicacion = new Label(renglon3Panel)
		labelUbicacion.text = "Ubicacion Materia: "
		
		detalleDeMateriaPanel
		
	}

	def void crearAccionesDeNotas(Panel mainPanel) {
		var actionsPanel = new Panel(mainPanel)
		actionsPanel.setLayout(new HorizontalLayout)

		var edit = new Button(actionsPanel)
			.setCaption("Editar")
			.onClick[|this.editarNota]

		var remove = new Button(actionsPanel)
			.setCaption("Borrar")
			.onClick[|modelObject.eliminarNotaSeleccionada]

		new Button(actionsPanel)
			.setCaption("Agregar")
			.onClick[|this.agregarNota]
			
		var elementSelected = new NotNullObservable("notaSeleccionada")
		remove.bindEnabled(elementSelected)
		edit.bindEnabled(elementSelected)
			
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

