package ar.edu.dds.ui.view

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.dds.ui.domain.Nota
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.DateAdapter

class EditarNotaWindow extends Dialog<Nota> {
	
	new(WindowOwner owner, Nota nota) {
		super(owner, nota)
		title = "Editar Nota"
		taskDescription = "Ingrese los nuevos valores"
	}
	

	override protected createFormPanel(Panel mainPanel) {
		val panelNota = new Panel(mainPanel)
			panelNota.setLayout = new ColumnLayout(2)
		
		
		new Label(panelNota).text = "Fecha"
		new TextBox(panelNota) => [
			setWidth(150)
			withFilter(new DateTextFilter)
			bindValueToProperty("fecha")
			.setTransformer(new DateAdapter)
		]
		
		new Label(panelNota).text = "Descripcion"
		new TextBox(panelNota) => [
			setWidth(150)
			bindValueToProperty("descripcion")
			
		]
		
		new Label(panelNota).text = "Aprobado"
		new CheckBox(panelNota).bindValueToProperty("aprobado")
		
	}

	
	override protected addActions(Panel actions){
		
		new Button(actions)
			.setCaption("Aceptar")
			.onClick [ | this.accept ]
			.setAsDefault.disableOnError
			
		new Button(actions)
			.setAsDefault
			.setCaption("Cancelar")
			.onClick [ | this.cancel ]
	}
	
}