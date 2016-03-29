<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
        <title><g:message code="student.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="row">
            <a href="#list-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="nav" role="navigation">
                <ul>
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                </ul>
            </div>
        </div>

        <br>
        <div class="row">
            <div id="list-student" class="content scaffold-list" role="main">
                <h1><g:message code="Alunos matriculados na turma ${clas.classId}" /></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <div class="container">
                <table class="table table-hover">
                <thead>
                    <tr>
                        <th >Aluno</th>
                        <th>Nota</th>
                        <th>Faltas</th>
                        <th>Situação</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                                        
                    <g:each in="${studentList}">

                        <tr>
                            <td>${it.name + " - " + it.cpf}</td>
                            <g:form controller="studentClass" action="saveStudentSituation">

                                <g:hiddenField name="student" value="${it.id}" />
                                <g:hiddenField name="clas" value="${clas.id}" />
                                
                                <td>
                                    <label for="grade">Nota</label>
                                    <g:field name="grade" type="number" min="0" max="10" step="0.1" value="${studentData[it.id].grade}" class="form-control"/>
                                </td>

                                <td>
                                    <label for="abscence">Faltas</label>
                                    <g:field name="absence" type="number" min="0" step="1" value="${studentData[it.id].absence}" class="form-control"/>
                                </td>
                                
                                <td>
                                    <g:if test="${studentData[it.id].situation == studentData[it.id].APPROVED_SITUATION}">
                                        <span class="label label-success">${studentData[it.id].APPROVED_SITUATION}</span>
                                    </g:if>
                                    <g:else>
                                        <span class="label label-danger">${studentData[it.id].REPPROVED_SITUATION}</span>
                                    </g:else>
                                </td>

                                <td>
                                    <g:submitButton name="closeClass" value="Salvar situação do aluno" class="btn btn-success"/>
                                </td>
                            </g:form>
                        </tr>

                    </g:each>
                </table>
                </div>

            </div>
        </div>
    </body>
</html>