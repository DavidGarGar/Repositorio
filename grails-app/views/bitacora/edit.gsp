

<%@ page import="com.prosa.mx.Bitacora" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="Lista de Bitacora de Pagos" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Editar Bitacora de Pagos" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bitacoraInstance}">
            <div class="errors">
                <g:renderErrors bean="${bitacoraInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <g:hiddenField name="id" value="${bitacoraInstance?.id}" />
                <g:hiddenField name="version" value="${bitacoraInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="uuid"><g:message code="bitacora.uuid.label" default="Uuid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'uuid', 'errors')}">
                                    <g:textField name="uuid" value="${bitacoraInstance?.uuid}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="monto_pagado"><g:message code="bitacora.monto_pagado.label" default="Montopagado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'monto_pagado', 'errors')}">
                                    <g:textField name="monto_pagado" value="${fieldValue(bean: bitacoraInstance, field: 'monto_pagado')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cuenta_origen"><g:message code="bitacora.cuenta_origen.label" default="Cuentaorigen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'cuenta_origen', 'errors')}">
                                    <g:textField name="cuenta_origen" value="${bitacoraInstance?.cuenta_origen}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cuenta_dest"><g:message code="bitacora.cuenta_dest.label" default="Cuentadest" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'cuenta_dest', 'errors')}">
                                    <g:textField name="cuenta_dest" value="${bitacoraInstance?.cuenta_dest}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vendor_id"><g:message code="bitacora.vendor_id.label" default="Vendorid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'vendor_id', 'errors')}">
                                    <g:textField name="vendor_id" value="${fieldValue(bean: bitacoraInstance, field: 'vendor_id')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="proveedor"><g:message code="bitacora.proveedor.label" default="Proveedor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'proveedor', 'errors')}">
                                    <g:textField name="proveedor" value="${bitacoraInstance?.proveedor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pdf_pago"><g:message code="bitacora.pdf_pago.label" default="Pdfpago" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'pdf_pago', 'errors')}">
                                    <input type="file" id="pdf_pago" name="pdf_pago" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="notificaciones"><g:message code="bitacora.notificaciones.label" default="Notificaciones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'notificaciones', 'errors')}">
                                    <g:textField name="notificaciones" value="${fieldValue(bean: bitacoraInstance, field: 'notificaciones')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estatus"><g:message code="bitacora.estatus.label" default="Estatus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'estatus', 'errors')}">
                                    <g:select name="estatus" from="${bitacoraInstance.constraints.estatus.inList}" value="${bitacoraInstance?.estatus}" valueMessagePrefix="bitacora.estatus" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fecha_pago"><g:message code="bitacora.fecha_pago.label" default="Fechapago" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'fecha_pago', 'errors')}">
                                    <g:datePicker name="fecha_pago" precision="day" value="${bitacoraInstance?.fecha_pago}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fecha_ultima_notif"><g:message code="bitacora.fecha_ultima_notif.label" default="Fechaultimanotif" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'fecha_ultima_notif', 'errors')}">
                                    <g:datePicker name="fecha_ultima_notif" precision="day" value="${bitacoraInstance?.fecha_ultima_notif}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="folio_factura"><g:message code="bitacora.folio_factura.label" default="Foliofactura" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'folio_factura', 'errors')}">
                                    <g:textField name="folio_factura" value="${bitacoraInstance?.folio_factura}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="moneda"><g:message code="bitacora.moneda.label" default="Moneda" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'moneda', 'errors')}">
                                    <g:textField name="moneda" value="${bitacoraInstance?.moneda}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="numero_pago"><g:message code="bitacora.numero_pago.label" default="Numeropago" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bitacoraInstance, field: 'numero_pago', 'errors')}">
                                    <g:textField name="numero_pago" value="${fieldValue(bean: bitacoraInstance, field: 'numero_pago')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'Actualizar', default: 'Actualizar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Eliminar', default: 'Eliminar')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
