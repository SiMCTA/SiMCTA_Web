package com.simcta

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_SECRETARY'])
class CourseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100) 

        respond Course.findAllByActive(true, params), model:[courseCount: Course.count()]
    }

    def search(){
        def name = params.name
        def active = params.active

        def like = "%" + name + "%";

        def courses
        def view

        courses = Course.findAllByActiveAndNameIlike(true, like)
        view = "index"

        render view: view, model: [courseList: courses, courseCount: courses.size()]

    }

    def showDeactivated(){

        respond Course.findAllByActive(false)
    }

    def show(Course course) {
        respond course
    }

    def create() {
        respond new Course(params)
    }

    @Transactional
    def save(Course course) {
        if (course == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (course.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond course.errors, view:'create'
            return
        }

        course.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'course.label', default: 'Course'), course.id])
                redirect course
            }
            '*' { respond course, [status: CREATED] }
        }
    }

    def edit(Course course) {
        respond course
    }

    @Transactional
    def update(Course course) {
        if (course == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (course.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond course.errors, view:'edit'
            return
        }

        course.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'course.label', default: 'Course'), course.id])
                redirect course
            }
            '*'{ respond course, [status: OK] }
        }
    }

    @Transactional
    def delete(Course course) {

        if (course == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        course.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'course.label', default: 'Course'), course.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    @Transactional
    def updateStatus(Course course) {

        boolean status = course.active
        boolean newStatus = false

        if(status == true){
            newStatus = false
        }
        else{
            newStatus = true
        }

        if(course != null){
            
            course.active = newStatus
            course.save(insert: false) 
            redirect action: "show", id: course.id
        }
       
    }

}
