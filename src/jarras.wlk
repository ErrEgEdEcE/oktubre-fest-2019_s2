import marcas.*
import carpas.*

class Jarra {
	var property capacidad = 1
	var property marca
	const property vendidaEn 
	
	method contenidoDeAlcohol() {
		return self.capacidad() * (self.marca().graduacion() / 100)
	}
	method precio() {
		return self.capacidad() * self.vendidaEn().precioDeVenta()
	}
	
}
