<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'packge.label', default: 'Packge')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-packge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div class="navbar-form navbar-right">
            <g:form action="search">

                <g:hiddenField id="status" name="status" value="true"/>
                        <g:textField class="form-control" placeholder="Digite o nome do pacote" name="name"/>
                            <g:submitButton class="btn btn-primary" name="search" value="Pesquisar"/>

                <div class="col-md-4">
                    <div class="input-group">
                    
                        
                        <span class="input-group-btn">
                        </span>

                    </div>
                </div>
            </g:form>
        </div>

        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="list" action="showDeactivated"><g:message code="packge.list.deactivated.label" args="[entityName]" /></g:link></li>  
            </ul>
        </div>
        <div id="list-packge" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${packgeList}" />

            <div class="pagination">
                <g:paginate total="${packgeCount ?: 0}" />
            </div>
        </div>
    </body>
</html>