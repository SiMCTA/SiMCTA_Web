<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'packge.label', default: 'Packge')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-packge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-packge" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="packge" />
            <g:form resource="${this.packge}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.packge}"><g:message code="default.button.edit.label" default="Edit" /></g:link>

                    <g:link class="delete" action="updateStatus" resource="${this.packge}">                
                        <g:if test="${packge.active == false}">
                            <g:message code="pakcge.button.active.status.label" default="Update status" />
                        </g:if>

                        <g:else>
                            <g:message code="packge.button.deactive.status.label" default="Update status" />
                        </g:else>
                    
                    </g:link>

                </fieldset>
            </g:form>
        </div>
    </body>
</html>
