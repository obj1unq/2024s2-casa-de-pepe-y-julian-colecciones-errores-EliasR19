import cosas.* 
import cuentaBancaria.*

object casaDePepeYJulian {
	const cosas = []
	var property cuenta = corriente

	method cosas(){
		return cosas
	}
	
	method comprar(cosa){
		cuenta.extraer(cosa.precio())
		cosas.add(cosa)
	}

	method cantCosasCompradas(){
		return cosas.size()
	}

	method tieneAlgun(categoria){
		return cosas.any( {cosa => cosa.categoria() == categoria})
	}

	method vieneDeComprar(categoria){
		return cosas.last().categoria() == categoria
	}

	method esDerrochador(){
		return self.precioTotalDeCosas() >= 9000
	}
	method precioTotalDeCosas(){
		//var total = 0
		//cosas.forEach( { cosa => total= total + cosa.precio()})
		//return total
		return cosas.sum( { cosa => cosa.precio()})
	}

	method compraMasCara(){
		return cosas.max( {cosa => cosa.precio()})
	}

	method comprados(categoria){
		return cosas.filter( {cosa => cosa.categoria() == categoria} )
	}

	method malaEpoca(){
		return cosas.all( { cosa => cosa.categoria() == comida})
		// 001 return cosas.all( cosa=> cosa.categoria().esComestible() })
		

	}
	// mala practica hacer comparacion con objeto usando objeto global

	method queFaltaComprar(lista){

		return lista.filter( { cosa => !self.estaComprado(cosa)} )
		
	}
	method estaComprado(cosa){
		return cosas.contains(cosa)
	}

	method faltaComida(){
		return self.cantComidas() < 2
	}
	method cantComidas(){
		return self.comprados(comida).size()
	}

	method categoriasCompradas(){
		return cosas.map({ cosa=> cosa.categoria()}).asSet()
	}

}

