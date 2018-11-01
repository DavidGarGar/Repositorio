package com.prosa.mx

class Bitacora {
	
	long id
	long numero_pago
	String folio_factura
	Date fecha_pago
	String uuid
	long monto_pagado
	String moneda
	String cuenta_origen
	String cuenta_dest
	long vendor_id
	String proveedor
	byte[] pdf_pago
	Integer notificaciones = null
	Date fecha_ultima_notif = new Date()
String estatus
    static constraints = {
    	id(nullable:true)
		uuid(nullable:true)
		monto_pagado(nullable:true)
		cuenta_origen(nullable:true)
		cuenta_dest(nullable:true)
		vendor_id(nullable:true)
		proveedor(nullable:true)
		pdf_pago(nullable:true)
		notificaciones(nullable:true)
		estatus(nullable:true)
		version(nullable:true)
		estatus(inList:["Activo","Inactivo"])
    }
}
