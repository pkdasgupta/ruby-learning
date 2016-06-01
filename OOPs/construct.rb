#!/usr/bin/env ruby

# -------------------------------------
# Classes and Objects
# - Attributes and Methods
# - initialize : Constructors in Ruby
# --------------------------------------


class Project
	
	def initialize(proj_name, user_status)
	# An initialize method is defined when at the time of creating an object 
	# we want to assign values to the attributes
		@name = proj_name
		@status = user_status
		@code = set_code
	
	end
	
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

	def set_code
		@name[0...2] + Random.rand(100).to_s
	end
	
	def details
		"#{@code} - #{@name} - #{@status}"
	end

end

p1 = Project.new("PKD_Live", "Registered")
puts p1.details

puts "-----------------------------------"
p1.name = "PKD_Live"
p1.status = "Processed"

puts p1.details

