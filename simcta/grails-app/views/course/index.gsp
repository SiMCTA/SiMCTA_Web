<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="navbar-form navbar-right">
            <g:form action="search">

                <g:hiddenField id="status" name="status" value="true"/>
                        <g:textField class="form-control" placeholder="Digite o nome do curso" name="name"/>
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
                <li><g:link class="list" action="showDeactivated"><g:message code="course.list.deactivated.label" args="[entityName]" /></g:link></li>  
            </ul>
        </div>
            <h1><center><b><g:message code="default.list.label" args="[entityName]" /></h1>
            <!-- Show courses -->
            <g:each in="${courseList}">        

                    <div class="col-xs-6 col-md-3" align="center">
                        <div class="thumbnail">
                        <div class="caption">
                        <h3><a href="/course/show/${it.id}">${it.name}</a></h3>
                    <b><h2>Valor:</b> R$ ${it.value}
                    <br><br>
                    <g:if test="${it.active == true}">
                        <span class="label label-success">
                            <g:message code="course.active.afirmation"/>
                        </span>
                    </g:if>

                    <g:else>
                        <span class="label label-danger">
                            <g:message code="course.deactive.afirmation"/>
                        </span>
                    </g:else>
                      </div>
                    </div>
                  </div>
                </div>
                            
            </g:each>
        </div>
    </body>
</html>