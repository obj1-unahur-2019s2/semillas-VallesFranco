import parcelas.*

class Planta {
var property anioDeObtencion
var property altura 

	method horasDeSolTolerables() 
	method esFuerte() = self.horasDeSolTolerables() > 10
	method daNuevasSemillas() = self.esFuerte()
	method espacioOcupado()
	method esParcelaIdeal(parcela) 	
}

class Menta inherits Planta {
	override method horasDeSolTolerables() = 6
	override method daNuevasSemillas() = super() or altura > 0.4
	override method espacioOcupado() = altura * 3
	override method esParcelaIdeal(parcela) {
		return parcela.superficie() > 6
	}
}

class Soja inherits Planta {
	override method horasDeSolTolerables() {
		return if (altura < 0.5) {
			6
		} else if (altura.between(0.5,1)) {
			7
		} else {
			9
		}
	}
	override method daNuevasSemillas() = super() or anioDeObtencion > 2007 and
		altura > 1
	override method espacioOcupado() = altura / 2
	override method esParcelaIdeal(parcela) {
		return parcela.horasDeSolXDia() == self.horasDeSolTolerables()
	}	
}

class Quinoa inherits Planta {
var property horasDeSolTolerables
	
	override method daNuevasSemillas() = super() or anioDeObtencion < 2005
	override method espacioOcupado() = 0.5
	override method esParcelaIdeal(parcela) {
		return not parcela.plantas().any{p => p.altura() > 1.5}
	}
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
	override method esParcelaIdeal(parcela) {
		return parcela.cantMaxDePlantas() == 1
	} 
}

class Hierbabuena inherits Menta {
	override method espacioOcupado() = super() * 2
}