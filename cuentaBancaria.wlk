import casa.*
import cosas.*

object corriente{
    var saldo = 0

    method saldo(){
        return saldo
    }

    method depositar(cantidad){
        saldo = saldo + cantidad
    }

    method extraer(cantidad){
        self.validarExtraccion(cantidad) // si esta se da, la proxima línea no se lee, se corta
        saldo = saldo - cantidad
    }
    method validarExtraccion(cantidad){
        if(cantidad < saldo){
            self.error("Saldo " + saldo + " insuficiente para comprar algo de " + cantidad)
        }
    }
}

object conGastos{
    var saldo = 0
    var property operacion = 20

    method saldo(){
        return saldo
    }

    method depositar(cantidad){
        saldo = saldo + (cantidad - operacion.max(0))
    }
    method extraer(cantidad){
        saldo = saldo - cantidad
    }
}

object combinada{
    var property primaria = corriente
    var property secundaria = conGastos

    method saldo(){
        return primaria.saldo() + secundaria.saldo()
    }

    method depositar(cantidad){
        primaria.depositar(cantidad)
    }

    method extraer(cantidad){
        const cuenta = if(primaria.saldo() >= cantidad ) primaria else secundaria
        cuenta.extraer(cantidad)
    }
}