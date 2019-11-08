import plantas.*

class Parcela {
var property ancho
var property largo
var property horasDeSolXDia
const property plantas = #{}

	method superficie() = ancho * largo
	method cantMaxDePlantas() {
		return if (ancho > largo) {
			self.superficie() / 5
		} else {
			(self.superficie() / 3) + largo
		}
	}
	method tieneComplicaciones() {
		return plantas.any{p => p.horasDeSolTolerables() < horasDeSolXDia}
	}
	method plantar(planta) {
		if (self.cantMaxDePlantas() == plantas.size() or
			horasDeSolXDia >= planta.horasDeSolTolerables() + 2) {
			self.error("No se puede plantar más.")
		} 
		plantas.add(planta)
	}
	method seAsociaBien(planta)
	method porcentajeDePlantasAsociadas() {
		return plantas.count{p => self.seAsociaBien(p)}
	}	
}

class ParcelaEco inherits Parcela {
	override method seAsociaBien(planta) {
		return not self.tieneComplicaciones() and planta.esParcelaIdeal(self)
	}
}

class ParcelaIndus inherits Parcela {
	override method seAsociaBien(planta) {
		return self.cantMaxDePlantas() == 2 and planta.esFuerte()
	}
}