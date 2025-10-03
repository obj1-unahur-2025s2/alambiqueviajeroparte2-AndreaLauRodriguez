object luke {
var cantidadDeViajes  = 0
var recuerdo = "llavero torre Eiffel"
var vehiculo = alambiqueVeloz
method cambiarVehiculo (nuevoVehiculo){
  vehiculo = nuevoVehiculo
   }
method vehiculo() = vehiculo   
method viajarHacia(destino) {
    if (self.puedeLlegarA(destino)){
        cantidadDeViajes = cantidadDeViajes + 1
        recuerdo = destino.recuerdoQueTrae()
        vehiculo.recorrer(destino)


    }
}
method puedeLlegarA(destino) = destino.puedeLlegarA(vehiculo)
method recuerdoQueTrae() = recuerdo
method cantidadDeViajes() = cantidadDeViajes

}
object alambiqueVeloz {
var esRapido = true
var combustible = 50
const consumoPorViaje =  10
method esRapido() = esRapido
method recorrer(destino) {
    if (combustible > 0) {
        combustible = combustible - 10
    } else {
        esRapido = false
    }
}
method puedeFuncionar() = combustible >= consumoPorViaje
method combustible() = combustible
method consumoPorViaje() = consumoPorViaje
method velocidad() = 80
}
object prueba{

    
}

object paris {
method recuerdoQueTrae() = "llavero torre Eiffel"
method puedeLlegarA(movil) = movil.puedeFuncionar()
method tieneCombustible(movil) = movil.combustible()

}

object buenosAires {
method recuerdoQueTrae() = "mate"  
method puedeLlegarA(auto) = auto.esRapido()
method tieneCombustible(auto) = auto.combustible()
}

object bagdad {
var recuerdo = "bidon con petroleo crudo"
method cambiarRecuerdo(nuevoRecuerdo) {
       recuerdo = nuevoRecuerdo
}
method recuerdoQueTrae() = recuerdo
method puedeLlegarA(cualquierCosa) = true

}

object lasVegas {
var homenaje = paris
method homenaje(nuevoHomenaje) {homenaje = nuevoHomenaje}
method recuerdoQueTrae() = homenaje.recuerdoQueTrae()
method puedeLlegarA(vehiculo) = homenaje.puedeLlegarA(vehiculo)
}
object hurlingham {
method recuerdoQueTrae() = "campus"
method puedeLlegarA(vehiculo) = vehiculo.puedeFuncionar() && vehiculo.esRapido() 

}


object chatarra {
var cañones = 10
var municiones = 100
method puedeFuncionar() = municiones == 100 && cañones.between(6,12)
method combustible() = cañones * 10
method desgaste() {
    cañones = cañones - 1
    municiones = municiones - 10
  }
method cañones() = cañones  
method esRapido() =  cañones > 8
method recorrer(destino) {
    if (cañones > 0 and municiones > 0) {
        self.desgaste()
    }
}
method velocidad()= 50
}

object  antigualla {
var gangster = 7
method puedeFuncionar() = gangster.even()
method desgaste() {gangster = gangster  - 1}
method esRapido() = gangster > 6
method recorrer(destino) {
    if (gangster < 7) {
        self.desgaste()
    }
}
method velocidad()= 60
}


object superConvertible {
var convertido = antigualla
method convertir(vehiculo) {convertido = vehiculo}
method puedeFuncionar() = convertido.puedeFuncionar()
method desgaste() {convertido.desgaste()}
method esRapido() = convertido.esRapido()
method recorrer(destino) {
    if (convertido.puedeFuncionar()) {
        convertido.recorrer(destino)
    } 

}
method velocidad() = convertido.velocidad()

}



object moto {
method esRapido() = true
method puedeFuncionar() = self.esRapido()
method desgaste() {}
method recorrer(destino) { }
method velocidad() = 100 

}


object antiguallaBlindada{
    const gangsters = ["Marcos","Javier","Lucho","Yanina","Jony","Mecha","Brian"]
    method puedeFuncionar()=gangsters.size().even()
    method esRapido() = gangsters.size() > 6
    method desgaste(){
        gangsters.remove(gangsters.anyOne())
    }
    method velocidad(){
        return gangsters.sum({c=>c.size()})
    }
    method subirAUnGangster(unGangster){
       gangsters.add(unGangster)
    }

      method bajarAUnGangster(unGangster){
       gangsters.remove(unGangster)
    }  
    method gangsters() = gangsters
    method recorrer(destino) {
    

}
}

object patanCar{
    var velocidad = 90
    method esRapido() = true
    method puedeFuncionar() = not self.esRapido()
    method desgaste(){
    }
    method velocidad()= velocidad
    method hacerTrampa(){
      velocidad = 0.max(velocidad*0.05)
    }
    method recorrer(destino){
       self.hacerTrampa()
    }

}



object locovichCar{
    const listadoCars = [superConvertible,chatarra,antigualla ]
    var vehiculo = chatarra
    method vehiculo()= vehiculo
    method cambiarVehiculo(){
        vehiculo = listadoCars.anyOne()
    }
    method velocidad()= vehiculo.velocidad()

     method esRapido() = vehiculo.esRapido()
    method puedeFuncionar() = vehiculo.puedeFuncionar()
    method desgaste() = vehiculo.desgaste()
    method recorrer(destino) {
    if (vehiculo.puedeFuncionar()) {
        vehiculo.recorrer(destino)
    } 

}

}


object carrera{
    const inscriptos= []
    const rechazados = []
    var ciudad = buenosAires
    method inscribirACarrera(unVehiculo){
        if (ciudad.puedeLlegarA(unVehiculo)){
            inscriptos.add(unVehiculo)}
        else{
            rechazados.add(unVehiculo)    
        }
    }
    method inscriptos()=inscriptos
    method rechazados()= rechazados
    method cambiarCiudad(nuevaCiudad){
        ciudad = nuevaCiudad
    }
    method replanificarCarrera(nuevaCiudad){
        const listaAux= []
        self.cambiarCiudad(nuevaCiudad)
        listaAux.addAll(rechazados)
        listaAux.addAll(inscriptos)
        inscriptos.clear()
        rechazados.clear()
        listaAux.forEach({c=>self.inscribirACarrera(c)})
    }
    method irACarrera(){
        inscriptos.forEach({c=>c.recorrer(ciudad)})
    }
    method ganador(){
        return inscriptos.max({c=>c.velocidad()})
    }
}




