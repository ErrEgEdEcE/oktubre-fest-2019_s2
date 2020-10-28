import personas.*
import marcas.*
import jarras.*


class Carpa {
	var property limiteDeGente = 10
	var property tieneBanda = true
	var property marcaQueVende
	var property genteDentro = #{}
	var property tipoDeRecargo = self.recargoFijo()
	
	method cantidadDeGenteDentro() {
		return self.genteDentro().size()
	}
	method dejaIngresarA(persona) {
		return self.cantidadDeGenteDentro() + 1 <= self.limiteDeGente() and not persona.estaEbria()
	}
	
	method servirJarraA(tamanio, persona) {
		if(self.genteDentro().contains(persona)) {persona.jarrasCompradas().add(new Jarra(capacidad = tamanio, marca = self.marcaQueVende(), vendidaEn = self))}
		else {self.error("La persona no está en la carpa")}
	}
	
	method asistentesNoServidos() {
		return self.genteDentro().filter({each => !each.carpasQueLeSirvieron().contains(self)})
	}
	
	method cantidadDeEbriosEmpedernidos() {
		return self.genteDentro().count({each => each.esEbrioEmpedernido()})
	}
	
	method esHomogenea() {
		return self.genteDentro().map({each => each.paisDeOrigen()}).asSet().size() == 1
	}
	
	method precioDeVenta() {
		return self.marcaQueVende().precioPorLitro() + self.tipoDeRecargo()
	}
	
	method recargoFijo() {
		return self.marcaQueVende().precioPorLitro() * 0.3
	}
	
	method recargoPorCantidad() {
		return if (self.cantidadDeGenteDentro() >= self.limiteDeGente()) {self.marcaQueVende().precioPorLitro() * 0.4}
		else {self.marcaQueVende().precioPorLitro() * 0.25}
	}
	method recargoPorEbriedad() {
		return if(self.genteDentro().count({each => each.estaEbria()}) >= self.genteDentro().size() * 0.75) {self.marcaQueVende().precioPorLitro() * 0.5}
		else {self.marcaQueVende().precioPorLitro() * 0.2}
	}

}
/*Pense en hacer un objeto recargo que retornara en diferentes métodos, pero no me permitía
 * permitía remitir a los métodos de la clase carpa que necesitaba consultar (marcaQueVende()
 * o cantidadDeGenteDentro()*/



