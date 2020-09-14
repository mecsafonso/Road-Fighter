object pepe{
	
	// variables
	var categoria = gerente
	var bonoXResultados = porcentaje
	var bonoXPresentismo = normal
	var cantidadDeFaltas = 0
	
	method sueldoNeto() = categoria.valorNeto()
	
	// sueldo = neto + bono x resultados + bono x presentismo.
	method sueldo() = self.sueldoNeto()
						+ bonoXResultados.valor(self.sueldoNeto()) 
						+ bonoXPresentismo.valor(cantidadDeFaltas,self.sueldoNeto())
						
	// metodo para facilitar los tests
	method cargarDatos(cat,bonoResultados,bonoPresentismo,cantFaltas){
		categoria = cat
		bonoXResultados = bonoResultados
		bonoXPresentismo = bonoPresentismo
		cantidadDeFaltas = cantFaltas 
	}
}

// El neto depende de la categoría, hay varias categorías. 
// Contemplar al menos estas dos:
	// gerentes que ganan $15000 de neto, y 
	// cadetes cuyo neto es $20000. 
// Tener en cuenta que puede haber más categorías. 

// Tipos de categorias, si se quiere agregar alguna, se debe crear un objeto nuevo para esa categoria
object gerente{
	method valorNeto() = 15000
}

object cadete{
	method valorNeto() = 20000
}


// Pepe tiene un bono por resultados que va cambiando a lo largo del tiempo.
// Sabemos que hay tres posibilidades para el bono por resultados:
	// Porcentaje: 10% sobre el neto.
	// Monto fijo: $800 fijos.
	// Nulo: nada.

object porcentaje{
	method valor(neto) = neto * 0.1
}

object montoFijo{
	method valor(neto) = 800
}

object nulo{
	method valor(neto) = 0
	method valor(cantidadDeFaltas,neto) = 0
}


// Al igual que el Bono por resultados, Pepe posee un bono por presentismo que puede variar mes a mes. 
// Existen varios bonos por presentismo:
	// Normal: $2000 pesos si la persona a quien se aplica no faltó nunca, $1000 si faltó sólo un día, $0 en cualquier otro caso.
	// Ajuste: $100 pesos si el empleado no faltón nunca, $0 en cualquier otro caso.
	// Demagógico: $500 pesos si el neto es menor a 18000, $300 en caso contrario. Para este bono no importa cuántas veces faltó el emplado.
	// Nulo: nada.
	
object normal{
	method valor(cantidadDeFaltas,neto){
		if(cantidadDeFaltas == 0) return 2000
		if(cantidadDeFaltas == 1) return 1000
		else return 0
	}
}

object ajuste{
	method valor(cantidadDeFaltas,neto){
		if(cantidadDeFaltas == 0) return 100
		else return 0
	}
}

object demagogico{
	method valor(cantidadDeFaltas,neto){
		if(neto < 18000) return 500
		else return 300
	}
}

// Para el bono por resultados nulo agregué un metodo en el objecto nulo ya creado




// BONUS

// Definir a Sofía, otra persona de la que hay que calcular el sueldo.
// Sofía solamente tiene bono por resultados, o sea que su sueldo se calcula como neto + bono x resultados.
// A su vez, su neto es un 30% superior a lo que indica su categoría. P.ej. si Sofía es cadete, su neto es 26000. Recordar que para aumentar un número un 30%, se lo multiplica por 1.3.
// Atención: si Pepe, o cualquier otra persona que se agregue, es cadete, su neto es 20000. El incremento del 30% se aplica solamente a Sofía.

object sofia{
	
	// variables
	var categoria = gerente
	var bonoXResultados = porcentaje
	var bonoXPresentismo = normal
	var cantidadDeFaltas = 0

	
	method sueldoNeto() = categoria.valorNeto() * 1.3
	
	// sueldo =  neto + bono x resultados
	method sueldo() = self.sueldoNeto()
						+ bonoXResultados.valor(self.sueldoNeto()) 
	
	// metodo para facilitar los tests
	method cargarDatos(cat,bonoResultados,bonoPresentismo,cantFaltas){
		categoria = cat
		bonoXResultados = bonoResultados
		bonoXPresentismo = bonoPresentismo
		cantidadDeFaltas = cantFaltas 	
	}
}


object vendedor{
	
	var muchasVentas = true
	const neto = 16000
	
	method activarAumentoPorMuchasVentas(){
	muchasVentas = true	}
	
	method desactivarAumentoPorMuchasVentas(){
	muchasVentas = false}
	
	method valorNeto() {
		if(muchasVentas) return neto * 1.25
		else return neto
	}
	
}

object medioTiempo{
	var categoriaB = gerente
	
	method categoriaBase(categoria) {
		categoriaB = categoria
	}
	
	method valorNeto() = categoriaB.valorNeto() * 0.5
}



// Roque, que en lugar de asignársele una categoría, se establece un neto de 28000 �pesos.
// El sueldo se calcula como neto + bono por resultados + 9000 pesos.
// Para el bono por resultados, se usan las mismas opciones que para Pepe. 

object roque{
	
	// variables
	const neto = 28000
	var bonoXResultados = porcentaje
	
	method sueldoNeto() = neto
	
	// sueldo =  neto + bono x resultados
	method sueldo() =  neto + bonoXResultados.valor(neto) + 9000 
	
	// metodo para facilitar los tests
	method cargarDatos(bonoResultados){
		bonoXResultados = bonoResultados	
	}
}
	

// Ernesto, que trabaja junto con un compañero, que puede cambiar. El neto de Ernesto es igual al de su compañero.
// Su sueldo se calcula como neto + bono por presentismo.
// Para el bono por presentismo, usar las mismas opciones que para Pepe. Se sabe que Ernesto no falta nunca.

object ernesto{
	
	var companiero = pepe	
	var bonoXPresentismo = normal
	const neto = companiero.sueldoNeto()
	
	method sueldo() = neto + bonoXPresentismo.valor(0,neto)
	
	method cargarDatos(compa,bonoResultados){
		companiero = compa
		bonoXPresentismo = bonoResultados
	}
	
}

































