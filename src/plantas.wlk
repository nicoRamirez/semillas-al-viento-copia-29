class Planta {
	var property anoDeObtencion=0
	var property altura=0
	var property tolerancia=7
	
	method esFuerte(){
		return self.tolerancia() > 9
	}
	method daNuevasSemillas(){
		return self.esFuerte()
	}
	method espacioOcupado()
	method puedenTolerar(cantSol){
		return tolerancia > cantSol
	}
	method toleraUnPocoMas(cant){
		return (self.tolerancia() - cant).abs() > 2
	}
	method esIdeal(parce)
}
class Menta inherits Planta{
	
	override method daNuevasSemillas(){
	return 	super() or self.altura() > 0.4 
	}
	override method espacioOcupado(){
		return altura * 3
	}
	override method esIdeal(parce){
		return parce.superficie() > 6
	}
}
class Soja inherits Planta{
	
	override method tolerancia(){
		var tole=0
		 if (self.pequenia()){tole=6} if(self.mediana()){tole=8}
		 else{tole =12}  return tole
	}
	method pequenia(){
		return altura < 0.5
	}
	method mediana(){
		return altura.between(0.5,1)
	}
	method grande(){
		return altura > 1
	}
	override method daNuevasSemillas(){
	return 	super() or self.anoDeObtencion() < 2007 and self.mediana()
	}
	override method espacioOcupado(){
		return altura / 2
	}	
	override method esIdeal(parce){
		return self.tolerancia() == parce.hsSol()
	}
} 
class Quinoa inherits Planta{
	var property espacioOcupado=0
	override method espacioOcupado(){
		return espacioOcupado
	}
	override method tolerancia(){
		 if(self.superaEspacioCalculado()){tolerancia =10}else{tolerancia}
		  return tolerancia
	}
	method superaEspacioCalculado(){
		return self.espacioOcupado() < 0.3
	}
	
	override method daNuevasSemillas(){
	return 	super() or self.anoDeObtencion() < 2005
	}
	override method esIdeal(parce){
		return parce.sinPlantasGrandes()
	}
}
 class Transgenica inherits Soja{
 	override method daNuevasSemillas(){
 	return sinSemilla.tieneSemilla()
 	}
 	override method esIdeal(parce){
 		return parce.totalDePlantas() == 1
 	}
 }
 class Peperina inherits Menta{
 	override method espacioOcupado(){
		return super() * 2
	}
 }
 object sinSemilla{
 	method tieneSemilla(){
 		return false
 	}
 }


