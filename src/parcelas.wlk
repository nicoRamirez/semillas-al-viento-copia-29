import plantas.*
class Parcela {
	var property ancho=0
	var property largo=0
	var property hsSol=0
	var property plantas=[]
	
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
		return plantas.size() < self.cantMaxima()
	}
	
}
