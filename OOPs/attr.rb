#!/usr/bin/env ruby

# -------------------------------------
# Classes and Objects
# - Attributes and Methods
# - attr_functions
# --------------------------------------


class Project
	
	#sets up both readers and writers
	# attr_reader, attr_writer, attr_accessor
	attr_accessor :name, :status
	attr_reader :code
	
	def initialize(proj_name, user_status)
		@name = proj_name
		@status = user_status
		@code = @name[0..2] + Random.rand(100).to_s
	end
	
	def details
		"#{@name} - #{@status}"
	end

end

p1 = Project.new("PKD_Live", "Registered")
puts p1.name
puts p1.status
puts p1.code

puts "-----------------------------------"
p1.name = "PKD_Live"
p1.status = "Processed"

puts p1.details

