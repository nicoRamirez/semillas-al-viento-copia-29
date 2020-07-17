import plantas.*
class Parcela {
	var property ancho=0
	var property largo=0
	var property hsSol=0
	var property plantas=#{}
	
	method superficie(){
		return self.ancho() * self.largo()
	}
	method cantMaxima(){
		var cant=0
		return if(self.superaLargo()){self.calcularXLargo()}else{self.calcularxSup()}
	}
	method superaLargo(){
		return self.largo()>3
	}
	method calcularXLargo(){
		return self.largo() + 4
	}
	method calcularxSup(){
		return self.superficie() / 2
	}
	method conComplicaciones(){
		return plantas.any({planta=> planta.puedenTolerar(self.hsSol())})
	}
	method plantarUnaPlanta(planta){
		if (not self.superoLaCant() or planta.toleraUnPocoMas(self.hsSol()))
		{plantas.add(planta)}
		else{self.error("no puede agregarse")}
	}
	method superoLaCant(){
		return self.totalDePlantas() < self.cantMaxima()
	}
	method sinPlantasGrandes(){
		return plantas.all({planta=>planta.altura()<1.5})
	}
	method totalDePlantas(){
		return plantas.size()
	}
	method asociaBien(planta)
	method cantPlantasAsocia() {
		return plantas.count({planta=>self.asociaBien(planta)})
	}
	
}
class Ecologica inherits Parcela {
	override method asociaBien(planta){
		return not self.conComplicaciones() and planta.esIdeal(self)
	}
	
}
class Industriale inherits Parcela {
	override method asociaBien(planta){
		return self.totalDePlantas() <=2 and planta.esFuerte()
	}
	
}
