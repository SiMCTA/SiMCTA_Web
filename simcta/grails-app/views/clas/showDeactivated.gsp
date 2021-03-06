<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'clas.label', default: 'Clas')}" />
        <title><g:message code="clas.list.deactivated.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-clas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="clas.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="list" action="index"><g:message code="clas.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-clas" class="content scaffold-list" role="main">
            <h1><g:message code="clas.list.deactivated.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${clasList}" />
        </div>
    </body>
</html>