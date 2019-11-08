import parcelas.*

object inta {
var property parcelas = #{}

	method promedioDePlantasXParcela() {
		return parcelas.sum{p => p.plantas().size()} / parcelas.size()
	}
	method parcelaMasAutosustentable() {
		return self.parcelasCapaces().max{p => p.porcentajeDePlantasAsociadas()}
	}
	method parcelasCapaces() {
		return parcelas.filter{p => p.plantas().size() >= 4}.asSet()
	}	
}