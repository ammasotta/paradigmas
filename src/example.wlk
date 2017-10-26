class Planeta{
	var habitantes=[]
	method agregarHabitantes(habitante){
		habitantes.add(habitante)
	}
	method poder()=habitantes.sum({habitante=>habitante.poder()})
	method poseeOrden()=self.poderTresHabitantesMasPoderosos()>=self.poder()/2
	method poderTresHabitantesMasPoderosos()=habitantes.sortedBy({hab1,hab2=>hab1.poder()>=hab2.poder()}).take(3).sum({hab=>hab.poder()})
/*alternativa al bloque de 2 del sortedBy es hab1.esMasGrosoQue(hab2) sirve cuando la ordenacion
 no depende de numeros como en este caso que depende del poder*/
}

class Habitante {
	var valentia
	var inteligencia
	constructor (_valentia,_inteligencia){
		valentia=_valentia
		inteligencia=_inteligencia
	}
	method poder()=valentia+inteligencia+self.poderEspecial()
	method poderEspecial()=0
}

class Soldado inherits Habitante{
	var equipamiento=#{}
	method agregarEquipamiento(equip){
		equipamiento.add(equip)
	}
	override method poderEspecial()=equipamiento.sum()
}

class Maestro inherits Habitante{
	var midiclorianos
	var sableDeLuz
	var caminoDeLaFuerza
	constructor(_midiclorianos,_sableDeLuz,_valentia,_inteligencia,_caminoDeLaFuerza)=super(_valentia,_inteligencia) {
		midiclorianos=_midiclorianos
		sableDeLuz=_sableDeLuz
		caminoDeLaFuerza=_caminoDeLaFuerza
	}
	method caminoDeLaFuerza(_caminoDeLaFuerza){
		caminoDeLaFuerza=_caminoDeLaFuerza
	}
	method caminoDeLaFuerza()=caminoDeLaFuerza
	override method poderEspecial()=midiclorianos/1000+caminoDeLaFuerza.poder(sableDeLuz)
	method vivirSuceso(cargaEmocional){
		caminoDeLaFuerza.vivirSuceso(cargaEmocional,self)
	}
}

//Se repite codigo tanto en sith como jedi, pasar el tiempo l aestro o hacer una superclase de jedi  sith
class Jedi{
	var tiempo=0
	var pazInterior=10
	method poder(sableDeLuz)=sableDeLuz*tiempo
	method vivirSuceso(cargaEmocional,maestro){
		tiempo+=1
		if(pazInterior<=-cargaEmocional){
			maestro.caminoDeLaFuerza(new Sith())
		}
		pazInterior+=cargaEmocional
	}
	/*override method == (otroBando) {
		return self.className()== otroBando.className() && pazInterior== otroBando.pazInterior()
	}*/
}

class Sith{
	var tiempo=0
	var odioInterno=100
	method poder(sableDeLuz)=2*sableDeLuz+tiempo
	method vivirSuceso(cargaEmocional,maestro){
		tiempo+=1
		if(odioInterno<=cargaEmocional){
			maestro.caminoDeLaFuerza(new Jedi())
		}
		odioInterno*=1.1
	}
	/*override method == (otroBando) {
		return self.className()== otroBando.className() && self.odioInterno() == otroBando.pazInterior() && self.
	}*/
}


class CorazonPerturbadoException inherits Exception{}
class CorazaRotaException inherits Exception{}
