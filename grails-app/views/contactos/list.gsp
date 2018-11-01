
<%@ page import="com.prosa.mx.Contactos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
       <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    </head>
    <body>
        <div class="nav">
            
            <span class="menuButton"><g:link class="create" action="create"><g:message code="Agregar Contacto" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <g:form controller="contactos" action="consult" method="post">
            <g:hiddenField name="ok" value="true" />
           <table>
                <tr class='prop'>
                   <td valign='top' style='text-align:left;' width='10%'><label for='proveedor'>Proveedor:</label></td>
                   <td valign='top' style='text-align:left;' width='80%'>
                   <input id="proveedor" type='text' size="25" name='proveedor' value=""/>
                </tr>
                <tr class='prop'>
                   <td valign='top' style='text-align:left;' width='10%'><label for='estatus'>Estatus:</label></td>
                   <td valign='top' style='text-align:left;' width='80%'>
                      <g:select id="estatus" name="estatus" from="${['A', 'I']}" noSelection="${['':'Seleccione un estatus...']}" /></td>
                </tr>
           </table>
           <div class="buttons"><span class="formButton"><input type="submit" value="Consultar"></input></span>
           </div>
        </g:form>
            <h1><g:message code="Lista de Contactos" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'contactos.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="estatus" title="${message(code: 'contactos.estatus.label', default: 'Estatus')}" />
                        
                            <g:sortableColumn property="rfc" title="${message(code: 'contactos.rfc.label', default: 'Rfc')}" />
                        
                            <g:sortableColumn property="correo" title="${message(code: 'contactos.correo.label', default: 'Correo')}" />
                        
                            <g:sortableColumn property="proveedor" title="${message(code: 'contactos.proveedor.label', default: 'Proveedor')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contactosInstanceList}" status="i" var="contactosInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${contactosInstance.id}">${fieldValue(bean: contactosInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: contactosInstance, field: "estatus")}</td>
                        
                            <td>${fieldValue(bean: contactosInstance, field: "rfc")}</td>
                        
                            <td>${fieldValue(bean: contactosInstance, field: "correo")}</td>
                        
                            <td>${fieldValue(bean: contactosInstance, field: "proveedor")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${contactosInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
