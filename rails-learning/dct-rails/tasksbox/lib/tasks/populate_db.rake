desc "populate the database"

task :populate_db => :environment do 
    i = 1 
    5.times do 
        user = User.new
        user.email = "#{i}@gmail.com"
        user.password = "secret123"
        user.save
        i += 1 
    end

    20.times do 
        client = Client.new
        client.name = Faker::Name.first_name
        client.company = Faker::Company.name 
        client.email = Faker::Internet.free_email(client.name)
        client.user_id = User.all.pluck(:id).sample
        client.mobile = Faker::Number.number(10)
        client.save
    end


    150.times do 
        project = Project.new
        id = Client.all.pluck(:id).sample
        client = Client.find(id)
        project.client_id = client.id
        project.name = Faker::App.name 
        project.description = Faker::Lorem.sentence
        project.start_date = Faker::Date.between(Date.parse("2015-01-01"), Date.today)
        project.end_date = Faker::Date.between(project.start_date, Date.today + 6.months)
        project.status = ["new", "on-going", "completed"].sample
        project.user_id = client.user_id
        project.save
    end

    projects = Project.all

    projects.each do |project|
        3.times do 
            task = Task.new
            task.title = Faker::Lorem.sentence
            task.due_date = project.start_date + 3.days
            task.is_completed = [true,false].sample
            task.project_id = project.id
            task.user_id = project.user_id 
            task.save
        end
    end
end
