package ar.edu.dds.ui.view

import java.util.ArrayList
import org.uqbar.arena.widgets.TextFilter
import org.uqbar.arena.widgets.TextInputEvent

class DateTextFilter implements TextFilter {
	
	override accept(TextInputEvent event) {
		val expected = new ArrayList(#["\\d{0,4}", "-", "\\d", "\\d?", "-", "\\d", "\\d?"])
		val regex = expected.reverse.fold("")[result, element| '''(«element»«result»)?''']
		
		event.potentialTextResult.matches(regex)
	}
	
}
