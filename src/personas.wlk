import jarras.*
import marcas.*
import carpas.*

class Persona {
	var property peso = 70
	var property jarrasCompradas = []
	var property nivelDeAguante = 10
	var property gustaDeMusicaTradicional = true
	var property marcasQueLeGustan = []
	
	method totalAlcoholIngerido() {
		return self.jarrasCompradas().sum({each => each.contenidoDeAlcohol()})
	}
	method estaEbria() {
		return self.totalAlcoholIngerido() * self.peso() > self.nivelDeAguante()
	}
	
	method leGusta(marca) {
		return self.marcasQueLeGustan().contains(marca)
	}
	
	method quiereEntrarA(carpa) {
		return self.marcasQueLeGustan().contains(carpa.marcaQueVende())
		       and self.gustaDeMusicaTradicional() == carpa.tieneBanda()
	}
	
	method puedeEntrarA(carpa) {
		return self.quiereEntrarA(carpa) and carpa.dejaIngresarA(self)
	}
	
	method entrarA(carpa) {
		if (self.puedeEntrarA(carpa)) {carpa.genteDentro(carpa.genteDentro() + 1)}
		else {self.error("No puede entrar")}
	} // REVISAR self.error("No puede entrar")
}

//REVISAR
class Belgas inherits Persona {
	
	override method marcasQueLeGustan(m) {
		self.marcasQueLeGustan().addAll({ m.lupuloPorLitro() > 4 })
     }
}


class Checos inherits Persona {
	override method marcasQueLeGustan(m) {
		self.marcasQueLeGustan().addAll({ m.graduacion() > 8 })
	}
}

class Alemanes inherits Persona {
	override method quiereEntrarA(carpa) {
		return super(carpa) and carpa.genteDentro().max(1) / 2 == 0
	}
}
