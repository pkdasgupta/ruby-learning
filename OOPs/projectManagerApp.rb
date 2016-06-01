#!/usr/bin/env ruby

# -----------------------------------------
# Classes and Objects
# - Excercise : To explore class Variable
# -----------------------------------------

require 'date'

class Project
	
	@@projects = []  #class Variable
	attr_accessor :name, :status, :start_date
	
	def initialize(name, status, start_date)
		@name = name
		@status = status
		@start_date = start_date
	end
	
	def details
		"#{name} - #{status} - #{start_date}" #calls the reader methods for variables
	end

	def add
		@@projects.push(self)
	end

	def self.all
		@@projects
	end

end

def project_input
	print "Enter Project Name : "
	name = gets.chomp
	print "Enter status of #{name} : "
	status = gets.chomp
	print "Enter start date for #{name} in (yyyy/mm/dd) : "
	start_date = Date.parse(gets.chomp)

	return name, status, start_date
end

def add_project
    name, status, start_date = project_input

    project = Project.new(name, status, start_date)
    project.add
end


def list_all_projects
	projects = Project.all
	puts "Total Projects : #{projects.size}"
	if projects.empty?
		puts "No Objects Added"
	else
		projects.each_with_index do |project, index|
			puts "#{index + 1}. #{project.details}"
		end
	end
end

def update_project_details
    list_all_projects

    print "Select the Project index to Update : "
    index = gets.to_i

    project = Project.all[index - 1]
    puts "Selected Project : #{project.details}"
    puts "\n 1. Name \n 2. Status \n 3. Start Date \n 4. All of them \n"
    print "Select Option : "
    opt = gets.chomp.to_i

    case opt
    when 1
        print "Enter New Project Name : "
        project.name = gets.chomp
    when 2
        print "Enter New Project Status : "
        project.status = gets.chomp
    when 3
        print "Enter New Project Start Date : "
        project.start_date = gets.chomp
    when 4
        project.name, project.status, project.start_date = project_input
    end
end

def delete_project
    list_all_projects

    print "\nEnter the Project Index to delete : "
    index = gets.to_i

    Project.all.delete_at(index - 1)
    puts "Okay, Cool. We are done with that nasty Project."
    list_all_projects
end

def delete_all_projects
    print "\n Oh Man!..Are you Sure ? (y/n) : "
    if gets.chomp == "y"
        Project.all.clear
    end
end

def search_project
    list_all_projects
    puts " 1. Search by Name \n 2. Search by Status \n 3. Search within Start Date"
    print "Enter Your Choice : "
    opt = gets.chomp.to_i

    case opt
    when 1
        print "Enter the Project Name to Search : "
        name = gets.chomp

        project = Project.all.find { |proj| proj.name == name }
        if project.nil? 
            puts "Oops! That Project is Not yet registered."
        else
            puts project.details
        end

    when 2 
        print "Enter status to Search (New/OnGoing/Completed) : "
        stat = gets.chomp

        projects = Project.all.find_all { |proj| proj.status == stat }
        puts "Here are all the Projects with status : #{stat}"

        if projects.empty?
            puts "Aah, No current Projects are in Status : #{stat}"
        else
            projects.each { |proj| puts proj.details }
        end

    else
        puts "We are still Working on it.Getting back to you Soon!"
    end

end

cont = 'y'
while (cont == 'y')
	puts "********* Project Manager *********"
	puts " 1. Add \n 2. Read All \n 3. Update \n 4. Delete \n 5. Delete All \n 6. Search Project"
	print "Select Option : "
	opt = gets.to_i

	case opt
	when 1
		add_project
	when 2
		list_all_projects
	when 3
        update_project_details
	when 4
        delete_project
	when 5
        delete_all_projects
	when 6
        search_project
	else
		puts "Invalid Selection!"
	end

print "Do You wish to continue? (y/n) : "
cont = gets.chomp

end

puts "************ !! Thank You !! ****************"
