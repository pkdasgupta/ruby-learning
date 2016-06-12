#!/usr/bin/env ruby

# Faker File to insert random data to Database

20.times do
    client = Client.new
    client.name = Faker::Name.name
    client.company = Faker::Company.name
    client.mobile = Faker::Number.number(10)
    client.email = Faker::Internet.free_email(client.name)
    client.save
end

150.times do
    project = Project.new
    project.client_id = Client.all.pluck(:id).sample
    project.name = Faker::App.name
    project.description = Faker::Lorem.sentence
    project.start_date = Faker::Date.between(Date.parse("2015-01-01"), Date.today)
    project.end_date = Faker::Date.between(project.start_date, Date.today + 6.months)
    project.status = ["new", "on-going", "completed"].sample
    project.save
end

Project.all.each { |project|
    3.times do 
        task = Task.new
        task.title = ["Requirement Gathering", "Feasibility Analysis", "Architecture Design", "SCRUM Meeting"].sample
        task.due_date = project.start_date + 3.days
        task.is_completed = [true, false].sample
        task.project_id = project.id
        task.save
    end
}
