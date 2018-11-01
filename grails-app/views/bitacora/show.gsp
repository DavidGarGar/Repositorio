
<%@ page import="com.prosa.mx.Bitacora" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bitacora.label', default: 'Bitacora')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bitacoraInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.uuid.label" default="Uuid" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bitacoraInstance, field: "uuid")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.monto_pagado.label" default="Montopagado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bitacoraInstance, field: "monto_pagado")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.cuenta_origen.label" default="Cuentaorigen" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bitacoraInstance, field: "cuenta_origen")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.cuenta_dest.label" default="Cuentadest" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bitacoraInstance, field: "cuenta_dest")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.vendor_id.label" default="Vendorid" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bitacoraInstance, field: "vendor_id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.proveedor.label" default="Proveedor" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bitacoraInstance, field: "proveedor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.pdf_pago.label" default="Pdfpago" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.notificaciones.label" default="Notificaciones" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bitacoraInstance, field: "notificaciones")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.estatus.label" default="Estatus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bitacoraInstance, field: "estatus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.fecha_pago.label" default="Fechapago" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${bitacoraInstance?.fecha_pago}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.fecha_ultima_notif.label" default="Fechaultimanotif" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${bitacoraInstance?.fecha_ultima_notif}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.folio_factura.label" default="Foliofactura" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bitacoraInstance, field: "folio_factura")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.moneda.label" default="Moneda" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bitacoraInstance, field: "moneda")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bitacora.numero_pago.label" default="Numeropago" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bitacoraInstance, field: "numero_pago")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${bitacoraInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
