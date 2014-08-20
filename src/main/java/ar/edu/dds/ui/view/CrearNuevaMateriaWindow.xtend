package ar.edu.dds.ui.view

import ar.edu.dds.ui.domain.Materia
import ar.edu.dds.ui.home.MateriasHome
import com.uqbar.commons.StringUtils
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.utils.ApplicationContext

class CrearNuevaMateriaWindow extends Dialog<Materia>{
	
	new (WindowOwner owner){
		super(owner, new Materia)
		title = "Nueva Materia"
		taskDescription = "Ingrese nueva materia"
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		val panelMateria = new Panel(mainPanel)
			panelMateria.layout = new VerticalLayout
		
		new Label(panelMateria).text = "Nombre:"
		new TextBox(panelMateria)
			.withFilter [ event | StringUtils::isAlphaSpace(event.potentialTextResult) ]
			.setWidth(200)
			.bindValueToProperty("nombre")
			
	}
	

	override protected addActions(Panel actions){
		
		new Button(actions)
			.setAsDefault
			.setCaption("Aceptar")
			.onClick [ | this.accept ]
			.bindEnabled(new NotNullObservable("nombre"))
			
		new Button(actions)
			.setAsDefault
			.setCaption("Cancelar")
			.onClick [ | this.cancel ]
					
	}
	
	override accept(){
		materiasHome.create(modelObject)
		super.accept()
	}
	
	def materiasHome(){
		ApplicationContext::instance.getSingleton(typeof(Materia)) as MateriasHome
		
	}
}