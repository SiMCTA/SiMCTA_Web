package com.simcta

abstract class ServiceItem {

	Integer id
	String name
	float value
	Integer duration
	boolean active

	static hasMany = [enrollments: Enrollment]
	static belongsTo = Enrollment

    static constraints = {
    	name (blank:false, matches:"[a-zA-Z À-ú_]+")
    	value (nullable:false, min: 1.00F, max: 9999.99F, scale:2)
    	duration (nullable:false, min:1) // In weeks
    	enrollments nullable: true, display: false
    }
}
