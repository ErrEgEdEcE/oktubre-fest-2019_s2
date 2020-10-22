import personas.*
import marcas.*

class Carpa {
	var property limiteDeGente = 10
	var property tieneBanda = true
	var property marcaQueVende
	var property genteDentro = 0
	
	method dejaIngresarA(persona) {
		return self.genteDentro() + 1 <= self.limiteDeGente() and not persona.estaEbria()
	}
	
}
