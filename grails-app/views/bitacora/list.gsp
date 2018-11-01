
<%@ page import="com.prosa.mx.Bitacora" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    </head>
    <body>
        <div class="body">
        <g:form controller="bitacora" action="consult" method="post">
            <g:hiddenField name="ok" value="true" />
           <table>
                <tr class='prop'>
                   <td valign='top' style='text-align:left;' width='10%'><label for='fechapago'>fecha de pago:</label></td>
                   <td valign='top' style='text-align:left;' width='80%'>
                   <input id="fechapago" type='date' size="25" name='fechapago' />
                </tr>
                <tr class='prop'>
                   <td valign='top' style='text-align:left;' width='10%'><label for='estatus'>Estatus:</label></td>
                   <td valign='top' style='text-align:left;' width='80%'>
                      <g:select id="estatus" name="estatus" from="${['Activo', 'Inactivo']}" noSelection="${['':'Seleccione un estatus...']}" /></td>
                </tr>
           </table>
           <div class="buttons"><span class="formButton"><input type="submit" value="Consultar"></input></span>
           </div>
        </g:form>
            <h1><g:message code="Bitácora de pagos" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                                <g:sortableColumn property="id" title="${message(code: 'bitacora.id.label', default: 'Id')}" />
                                <g:sortableColumn property="numero_pago" title="${message(code: 'bitacora.numero_pago.label', default: 'Numero_pago')}" />  
                                <g:sortableColumn property="folio_factura" title="${message(code: 'bitacora.folio_factura.label', default: 'Folio_factura')}" />   
                                <g:sortableColumn property="fecha_pago" title="${message(code: 'bitacora.fecha_pago.label', default: 'Fecha_pago')}" />                      
                                <g:sortableColumn property="uuid" title="${message(code: 'bitacora.uuid.label', default: 'Uuid')}" />
                                <g:sortableColumn property="monto_pagado" title="${message(code: 'bitacora.monto_pagado.label', default: 'Monto_pagado')}" />
                                <g:sortableColumn property="moneda" title="${message(code: 'bitacora.moneda.label', default: 'Moneda')}" />
                                <g:sortableColumn property="cuenta_origen" title="${message(code: 'bitacora.cuenta_origen.label', default: 'Cuenta_origen')}" />
                                <g:sortableColumn property="cuenta_dest" title="${message(code: 'bitacora.cuenta_dest.label', default: 'Cuenta_destino')}" />
                                <g:sortableColumn property="vendor_id" title="${message(code: 'bitacora.vendor_id.label', default: 'Vendor_id')}" />
                                <g:sortableColumn property="proveedor" title="${message(code: 'bitacora.proveedor.label', default: 'Proveedor')}" />
                                <g:sortableColumn property="notificaciones" title="${message(code: 'bitacora.notificaciones.label', default: 'Notificaciones')}" />
                                <g:sortableColumn property="fecha_ultima_notif" title="${message(code: 'bitacora.fecha_ultima_notif.label', default: 'Fecha_ultima_mod')}" />
                                <g:sortableColumn property="estatus" title="${message(code: 'bitacora.estatus.label', default: 'Estatus')}" />


                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bitacoraInstanceList}" status="i" var="bitacoraInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${bitacoraInstance.id}">${fieldValue(bean: bitacoraInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: bitacoraInstance, field: "numero_pago")}</td>
                            <td>${fieldValue(bean: bitacoraInstance, field: "folio_factura")}</td>
                            <td>${fieldValue(bean: bitacoraInstance, field: "fecha_pago")}</td>
                            <td>${fieldValue(bean: bitacoraInstance, field: "uuid")}</td>                        
                            <td>${fieldValue(bean: bitacoraInstance, field: "monto_pagado")}</td>                        
                            <td>${fieldValue(bean: bitacoraInstance, field: "moneda")}</td>
                            <td>${fieldValue(bean: bitacoraInstance, field: "cuenta_origen")}</td>
                            <td>${fieldValue(bean: bitacoraInstance, field: "cuenta_dest")}</td>
                            <td>${fieldValue(bean: bitacoraInstance, field: "vendor_id")}</td>
                            <td>${fieldValue(bean: bitacoraInstance, field: "proveedor")}</td>
                            <td>${fieldValue(bean: bitacoraInstance, field: "notificaciones")}</td>
                            <td>${fieldValue(bean: bitacoraInstance, field: "fecha_ultima_notif")}</td>
                            <td>${fieldValue(bean: bitacoraInstance, field: "estatus")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate next="Siguiente" prev="Anterior" total="${bitacoraInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
