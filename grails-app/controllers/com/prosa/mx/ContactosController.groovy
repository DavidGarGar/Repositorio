package com.prosa.mx

class ContactosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        def bandera = Contactos.get(params.bandera)
        def lista 
        def conteo
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if(bandera.equals(null)){
            lista = Contactos.list(params)
            conteo = Contactos.count()
        }else{
            lista = Contactos.get(params.lista)
            conteo= Contactos.get(params.conteo)
        }
        
        [contactosInstanceList: lista, contactosInstanceTotal: conteo]

    }

    def create = {
        def contactosInstance = new Contactos()
        contactosInstance.properties = params
        return [contactosInstance: contactosInstance]
    }
    def consult = {
        
            def proveedor = params.proveedor.toUpperCase()
            def estatus = params.estatus.toUpperCase()
            def fromSql = "from Contactos b  "
            fromSql += "where NVL(UPPER(b.proveedor),0) LIKE '%"+proveedor+"%'"
            fromSql += "and NVL(UPPER(b.estatus),0) LIKE '%"+estatus+"%'"
            params.max = Math.min(params.max ? params.int('max') : 12, 100)
            params.offset = params.offset ? params.int('offset') : 0
            def total = Contactos.findAll(fromSql).size()
            def usuarioInstance = Contactos.findAll(fromSql,[max:params.max,offset:params.offset])
            redirect(action: "list", bandera: 1, lista: usuarioInstance, conteo: total)
            
        
    }

    def save = {
        def contactosInstance = new Contactos(params)
        if (contactosInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'contactos.label', default: 'Contactos'), contactosInstance.id])}"
            redirect(action: "show", id: contactosInstance.id)
        }
        else {
            render(view: "create", model: [contactosInstance: contactosInstance])
        }
    }

    def show = {
        def contactosInstance = Contactos.get(params.id)
        if (!contactosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactos.label', default: 'Contactos'), params.id])}"
            redirect(action: "list")
        }
        else {
            [contactosInstance: contactosInstance]
        }
    }

    def edit = {
        def contactosInstance = Contactos.get(params.id)
        if (!contactosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactos.label', default: 'Contactos'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [contactosInstance: contactosInstance]
        }
    }

    def update = {
        def contactosInstance = Contactos.get(params.id)
        if (contactosInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (contactosInstance.version > version) {
                    
                    contactosInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'contactos.label', default: 'Contactos')] as Object[], "Another user has updated this Contactos while you were editing")
                    render(view: "edit", model: [contactosInstance: contactosInstance])
                    return
                }
            }
            contactosInstance.properties = params
            if (!contactosInstance.hasErrors() && contactosInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'contactos.label', default: 'Contactos'), contactosInstance.id])}"
                redirect(action: "show", id: contactosInstance.id)
            }
            else {
                render(view: "edit", model: [contactosInstance: contactosInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactos.label', default: 'Contactos'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def contactosInstance = params.id
        if (contactosInstance) {
            try {
                Contactos.executeUpdate("delete Contactos where id='"+contactosInstance+"'")
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'contactos.label', default: 'Contactos'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactos.label', default: 'Contactos'), params.id])}"
            redirect(action: "list")
        }
    }
}
