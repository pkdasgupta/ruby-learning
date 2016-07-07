desc "Setup Users"
task :setup_users => :environment do
    Role.create(name: "admin")
    Role.create(name: "user")
    Role.create(name: "client")
    Role.create(name: "vendor")

    User.all.each do |user|
        user.roles.push(Role.find(2))
    end

    User.create(email: "admin@admin.com", password: "secret123")
    Permission.create(user_id: User.last.id, role_id: Role.first.id)

end
