package com.prosa.mx

class BitacoraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bitacoraInstanceList: Bitacora.list(params), bitacoraInstanceTotal: Bitacora.count()]
    }

    def create = {
        def bitacoraInstance = new Bitacora()
        bitacoraInstance.properties = params
        return [bitacoraInstance: bitacoraInstance]
    }

    def consult = {
            //2018-10-10
            def fecha = params.fechapago
            def estatus = params.estatus.toUpperCase()
            def fromSql = "from Bitacora b  "
            fromSql += "where NVL(UPPER(b.estatus),0) LIKE '%"+estatus+"%'"
            fromSql += "and trunc(fecha_pago) =to_date('"+fecha+"','yyyy-mm-dd')"
            params.max = Math.min(params.max ? params.int('max') : 12, 100)
            params.offset = params.offset ? params.int('offset') : 0
            def total = Bitacora.findAll(fromSql).size()
            def usuarioInstance = Bitacora.findAll(fromSql,[max:params.max,offset:params.offset])
            render(view: "list", model: [bitacoraInstanceList: usuarioInstance, bitacoraInstanceTotal: total ])    
        
    }

    def save = {
        def bitacoraInstance = new Bitacora(params)
        if (bitacoraInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'bitacora.label', default: 'Bitacora'), bitacoraInstance.id])}"
            redirect(action: "show", id: bitacoraInstance.id)
        }
        else {
            render(view: "create", model: [bitacoraInstance: bitacoraInstance])
        }
    }

    def show = {
        def bitacoraInstance = Bitacora.get(params.id)
        if (!bitacoraInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bitacora.label', default: 'Bitacora'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bitacoraInstance: bitacoraInstance]
        }
    }

    def edit = {
        def bitacoraInstance = Bitacora.get(params.id)
        if (!bitacoraInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bitacora.label', default: 'Bitacora'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bitacoraInstance: bitacoraInstance]
        }
    }

    def update = {
        def bitacoraInstance = Bitacora.get(params.id)
        if (bitacoraInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bitacoraInstance.version > version) {
                    
                    bitacoraInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bitacora.label', default: 'Bitacora')] as Object[], "Another user has updated this Bitacora while you were editing")
                    render(view: "edit", model: [bitacoraInstance: bitacoraInstance])
                    return
                }
            }
            bitacoraInstance.properties = params
            if (!bitacoraInstance.hasErrors() && bitacoraInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bitacora.label', default: 'Bitacora'), bitacoraInstance.id])}"
                redirect(action: "show", id: bitacoraInstance.id)
            }
            else {
                render(view: "edit", model: [bitacoraInstance: bitacoraInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bitacora.label', default: 'Bitacora'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bitacoraInstance = Bitacora.get(params.id)
        if (bitacoraInstance) {
            try {
                bitacoraInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bitacora.label', default: 'Bitacora'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bitacora.label', default: 'Bitacora'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bitacora.label', default: 'Bitacora'), params.id])}"
            redirect(action: "list")
        }
    }
}
