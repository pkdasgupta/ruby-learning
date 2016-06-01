#!/usr/bin/env ruby

# -------------------------------------
# Classes and Objects
# - Inheritance
# --------------------------------------

class Employee
	
	attr_accessor :name, :pay_rate
	
	def initialize(name, pay_rate)
		@name = name
		@pay_rate = pay_rate
	end
	
	def pay(hours)
        pay_rate * hours
	end

end

class Manager < Employee
	
	attr_accessor :salaried
	
	def initialize(name, pay_rate, salaried)
        super(name, pay_rate)
		@salaried = salaried
	end
	
	def pay(hours)
        if salaried
            return pay_rate
        else
            super(hours)
        end
	end
end

m1 = Manager.new("Karthik Suryanarayan", 114999, true)
m2 = Manager.new("Manish Mittal", 2500, false)

puts "-------------------------------------------------------------"
puts "#{m1.name} \t Earnings : INR Rs.#{m1.pay(45)} / Month"
puts "-------------------------------------------------------------"
puts "#{m2.name} \t Earnings : INR Rs.#{m2.pay(45)} / Month"
puts "-------------------------------------------------------------"
