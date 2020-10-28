

class Marca {
	var property lupuloPorLitro = 10
	var property paisDeOrigen 
	var property precioPorLitro = 10
	
	method graduacion()
}

class Rubia inherits Marca {
	var property graduacion = 0
}

class Negra inherits Marca {
	
	override method graduacion() {
		return graduacionReglamentaria.graduacionMundial().min(self.lupuloPorLitro() * 2)
	}
	
}

class Roja inherits Negra {
	override method graduacion() {
		return super() * 1.25
	}
}

object graduacionReglamentaria {
	var property graduacionMundial = 0
}
