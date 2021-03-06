<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
        <title><g:message code="student.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="student.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="student.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-student" class="content scaffold-show" role="main">
            <h1><g:message code="student.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="student" />
            <g:form resource="${this.student}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.student}"><g:message code="student.button.edit.label" default="Edit" /></g:link>

                    <g:link class="list" action="payment" resource="${this.student}"><g:message code="student.button.payment.label" default="Dados do pagamento" /></g:link>

                    <g:if test="${student.active == true}">
                        <input class="delete" type="submit" value="${message(code: 'student.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'student.button.delete.confirm.message', default: 'Tem certeza?')}');" />
                    </g:if>
                    <g:else>
                        <input class="delete" type="submit" value="${message(code: 'student.button.activate.label', default: 'Delete')}" onclick="return confirm('${message(code: 'student.button.activate.confirm.message', default: 'Tem certeza?')}');" />
                    </g:else>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
