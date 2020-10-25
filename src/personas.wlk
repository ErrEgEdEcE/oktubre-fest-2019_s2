import jarras.*
import marcas.*
import carpas.*

class Persona {
	var property peso = 70
	var property jarrasCompradas = []
	var property nivelDeAguante = 10
	var property gustaDeMusicaTradicional = true
	var property paisDeOrigen
	var property marcasQueLeGustan = []
	
	
	method totalAlcoholIngerido() {
		return self.jarrasCompradas().sum({each => each.contenidoDeAlcohol()})
	}
	method estaEbria() {
		return self.totalAlcoholIngerido() * self.peso() > self.nivelDeAguante()
	}
	
	method esEbrioEmpedernido() {
		return self.estaEbria() and self.jarrasCompradas().all({each => each.capacidad() >= 1})
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
		if (self.puedeEntrarA(carpa)) {carpa.genteDentro().add(self)}
		else {self.error("No puede entrar")}
	}
	
	method esPatriota() {
		return self.jarrasCompradas().all({each => each.marca().paisDeOrigen() == self.paisDeOrigen()}) 
	}
	
	method carpasQueLeSirvieron() {
		return self.jarrasCompradas().map({jarra => jarra.vendidaEn()}).asSet()
	}
	method marcasQueCompro() {
		return self.jarrasCompradas().map({each => each.marca()}).asSet()
	}
	method esCompatibleCon(otraPersona) {
		return self.marcasQueCompro().intersection(otraPersona.marcasQueCompro()).size() 
		       > self.marcasQueCompro().difference(otraPersona.marcasQueCompro()).size()
	}
	method gastoTotalEnCerveza() {
		return self.jarrasCompradas().sum({each => each.precio()})
	}
	method jarraMasCaraComprada() {
		return self.jarrasCompradas().max({each => each.precio()})
	}
}
	

//REVISAR
class Belgas inherits Persona {
	
	override method marcasQueLeGustan(m) {
		self.marcasQueLeGustan().addAll({marca => marca.lupuloPorLitro() > 4 })
     }
}


class Checos inherits Persona {
	override method marcasQueLeGustan(m) {
		self.marcasQueLeGustan().addAll({ m.graduacion() > 8 })
	}
}

class Alemanes inherits Persona {
	override method quiereEntrarA(carpa) {
		return super(carpa) and carpa.genteDentro().size().max(1) / 2 == 0
	}
}
