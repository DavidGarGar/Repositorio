
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
            <h1><g:message code="Descripcion de Contacto" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactos.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactosInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactos.estatus.label" default="Estatus" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactosInstance, field: "estatus")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactos.rfc.label" default="Rfc" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactosInstance, field: "rfc")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactos.correo.label" default="Correo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactosInstance, field: "correo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactos.proveedor.label" default="Proveedor" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactosInstance, field: "proveedor")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${contactosInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
