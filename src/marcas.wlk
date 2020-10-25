class Marca {
	var property lupuloPorLitro = 1
	var property paisDeOrigen
	var property precioPorLitro = 10
	
}

class Rubia inherits Marca {
	var property graduacion
}

class Negra inherits Marca {
	var property graduacionReglamentaria
	method graduacion() {
		return self.graduacionReglamentaria().min(self.lupuloPorLitro() * 2)
	}
	
}

class Roja inherits Negra {
	override method graduacion() {
		return super() * 1.25
	}
	
}
