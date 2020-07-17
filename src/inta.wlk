import parcelas.*
import plantas.*
object inta{
	var property parcelas=#{}
	method promedioDePlantas(){
		return self.cantDePlantas() / self.cantParcelas()
	}
	method cantDePlantas(){
		return parcelas.sum({parcela=>parcela.totalDePlantas()})
	}
	method cantParcelas(){
		return parcelas.size()
	}
	method masAutosustentable(){
		return self.conMasDeCuatroPlantas().max({parcela=>parcela.cantPlantasAsocia()})
	}
	method conMasDeCuatroPlantas(){
		return parcelas.filter({parcela=>parcela.size()> 4})
	}	
}
