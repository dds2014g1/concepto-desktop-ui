package ar.edu.dds.ui.view

import ar.edu.dds.ui.domain.Nota
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import ar.edu.dds.ui.applicationModel.SeguidorCarrera

class EditarNotaWindow extends Dialog<SeguidorCarrera> {
	
	Nota notaSave
	
	new(WindowOwner owner, SeguidorCarrera seguidorCarrera) {
		super(owner, seguidorCarrera)
		title = "Editar Nota"
		taskDescription = "Ingrese los nuevos valores"
		
		notaSave = new Nota
		
		notaSave.valor       = seguidorCarrera.notaSeleccionada.valor
		notaSave.descripcion = seguidorCarrera.notaSeleccionada.descripcion
		notaSave.fecha       = seguidorCarrera.notaSeleccionada.fecha
	
	}
	

	override protected createFormPanel(Panel mainPanel) {
		val panelNota = new Panel(mainPanel)
			panelNota.setLayout = new ColumnLayout(2)
		
		
		new Label(panelNota).text = "Fecha"
		var fechaTextBox = new TextBox(panelNota)
		fechaTextBox.setWidth(150)
		fechaTextBox.withFilter(new DateTextFilter)
		
		val binding = fechaTextBox.bindValueToProperty("notaSeleccionada.fecha")
		binding.setTransformer(new LocalDateAdapter)
		
		new Label(panelNota).text = "Nota"
		new TextBox(panelNota) => [
			setWidth(150)
			bindValueToProperty("notaSeleccionada.valor")
			
		]
		
		new Label(panelNota).text = "Descripcion"
		new TextBox(panelNota) => [
			setWidth(150)
			bindValueToProperty("notaSeleccionada.descripcion")
			
		]
		
	}

	
	override protected addActions(Panel actions){
		
		new Button(actions)
			.setCaption("Aceptar")
			.onClick [ | this.close ]
			.setAsDefault
			.disableOnError
			.bindEnabled(new NotNullObservable("notaSeleccionada.fecha"))
			
			
		new Button(actions)
			.setAsDefault
			.setCaption("Cancelar")
			.onClick [ | this.cancel ]
	}
	
	override cancel(){
		
			modelObject.notaSeleccionada.valor 		= notaSave.valor
			modelObject.notaSeleccionada.descripcion = notaSave.descripcion
			modelObject.notaSeleccionada.fecha		= notaSave.fecha
			
			super.cancel
	}

}