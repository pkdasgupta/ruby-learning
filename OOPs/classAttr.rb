#!/usr/bin/env ruby

# -------------------------------------
# Classes and Objects
# - Attributes and Methods
# - class variables and class methods
# --------------------------------------


class Project
	
	@@count = 0 #class Variable
	attr_accessor :name, :status
	attr_reader :code
	
	def initialize(proj_name, user_status)
		@name = proj_name
		@status = user_status
		@code = @name[0..2] + Random.rand(100).to_s

		@@count += 1
	end
	
	def details
		"#{@name} - #{@status}"
	end

	def self.count #class Method : used to return class variable
		@@count
	end

end

p1 = Project.new("PKD_Live", "Registered")
p2 = Project.new("PKD_4U", "Underway")

puts "-----------------------------------"
p1.name = "PKD_Live"
p1.status = "Processed"

puts p1.details
puts "-----------------------------------"
puts "Total Projects : #{Project.count}"
