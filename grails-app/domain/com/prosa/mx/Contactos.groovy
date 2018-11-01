package com.prosa.mx

class Contactos {
long id
String proveedor
String rfc
String correo
String estatus = "A"

    static constraints = {
        estatus(inList:["A","I"])
        rfc nullable: true, maxSize: 20
        correo nullable: true, maxSize: 30

        
        
    }
    

    
}
