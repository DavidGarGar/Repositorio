

<%@ page import="com.prosa.mx.Contactos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
       <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    </head>
    <body>
        <div class="nav">
            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="Lista de Contactos" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="Agregar Contacto" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Editar Contacto" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${contactosInstance}">
            <div class="errors">
                <g:renderErrors bean="${contactosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${contactosInstance?.id}" />
                <g:hiddenField name="version" value="${contactosInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estatus"><g:message code="contactos.estatus.label" default="Estatus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactosInstance, field: 'estatus', 'errors')}">
                                    <g:select name="estatus" from="${contactosInstance.constraints.estatus.inList}" value="${contactosInstance?.estatus}" valueMessagePrefix="contactos.estatus"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rfc"><g:message code="contactos.rfc.label" default="Rfc" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactosInstance, field: 'rfc', 'errors')}">
                                    <g:textField name="rfc" maxlength="20" value="${contactosInstance?.rfc}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="correo"><g:message code="contactos.correo.label" default="Correo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactosInstance, field: 'correo', 'errors')}">
                                    <g:textField name="correo" maxlength="30" value="${contactosInstance?.correo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="proveedor"><g:message code="contactos.proveedor.label" default="Proveedor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactosInstance, field: 'proveedor', 'errors')}">
                                    <g:textField name="proveedor" value="${contactosInstance?.proveedor}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
