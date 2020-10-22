import marcas.*
class Jarra {
	var property capacidad = 1
	var property marca
	
	method contenidoDeAlcohol() {
		return self.capacidad() * (self.marca().graduacion() / 100)
	}
}
