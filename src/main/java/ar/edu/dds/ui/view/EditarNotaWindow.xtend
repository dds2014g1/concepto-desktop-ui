package ar.edu.dds.ui.view

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.dds.ui.domain.Nota
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import com.uqbar.commons.StringUtils
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Button

class EditarNotaWindow extends Dialog<Nota> {
	
	new(WindowOwner owner, Nota nota) {
		super(owner, nota)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		title = "Editar Nota"
		taskDescription = "Ingrese los nuevos valores"
		
		val panelNota = new Panel(mainPanel)
			panelNota.layout = new ColumnLayout(2)
		
		new Label(panelNota).text = "Fecha:"
		new TextBox(panelNota)
			.withFilter [ event | StringUtils::isNumeric(event.potentialTextResult) ]
			.bindValueToProperty("fecha")
		
		var check = new CheckBox(mainPanel)
			check.bindValueToProperty("aprobado")
		new Label(panelNota).text = "Aprobado"
		
		
	}
	
	override protected addActions(Panel actions){
		
		new Button(actions)
			.setCaption("Aceptar")
			.onClick [ | ]
			.setAsDefault.disableOnError
	}
	
}