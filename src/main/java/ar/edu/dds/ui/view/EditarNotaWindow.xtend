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

class EditarNotaWindow extends Dialog<Nota> {
	
	Nota notaSave
	
	new(WindowOwner owner, Nota nota) {
		super(owner, nota)
		title = "Editar Nota"
		taskDescription = "Ingrese los nuevos valores"
		
		notaSave = new Nota
		
		notaSave.valor       = nota.valor
		notaSave.descripcion = nota.descripcion
		notaSave.fecha       = nota.fecha
	
	}
	

	override protected createFormPanel(Panel mainPanel) {
		val panelNota = new Panel(mainPanel)
			panelNota.setLayout = new ColumnLayout(2)
		
		
		new Label(panelNota).text = "Fecha"
		new TextBox(panelNota) => [
			setWidth(150)
			withFilter(new DateTextFilter)
			bindValueToProperty("fecha")
		]
		
		new Label(panelNota).text = "Nota"
		new TextBox(panelNota) => [
			setWidth(150)
			bindValueToProperty("valor")
			
		]
		
		new Label(panelNota).text = "Descripcion"
		new TextBox(panelNota) => [
			setWidth(150)
			bindValueToProperty("descripcion")
			
		]
		
	}

	
	override protected addActions(Panel actions){
		
		new Button(actions)
			.setCaption("Aceptar")
			.onClick [ | this.accept ]
			.setAsDefault
			.disableOnError
			.bindEnabled(new NotNullObservable("fecha"))
			
			
		new Button(actions)
			.setAsDefault
			.setCaption("Cancelar")
			.onClick [ | this.cancel ]
	}
	
	override cancel(){
		
			modelObject.valor 		= notaSave.valor
			modelObject.descripcion = notaSave.descripcion
			modelObject.fecha		= notaSave.fecha
			
			super.cancel
	}

}