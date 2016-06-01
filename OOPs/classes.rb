#!/usr/bin/env ruby

# ------------------------------
# Classes and Objects
# - Attributes and Methods
# ------------------------------


class Project
	
	def name=(proj_name)
		@name = proj_name 
	end

	def name
		@name  
	end

	def status=(user_status)  #writer method 
		@status = user_status
	end

	def status  #instance method : reader method
		@status
	end
	
	def details
		"#{@name} - #{@status}"
	end

end

p1 = Project.new

p1.name = "PKD_Live"
p1.status = "New"

puts p1.details

