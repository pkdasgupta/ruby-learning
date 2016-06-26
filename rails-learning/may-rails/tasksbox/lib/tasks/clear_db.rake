desc "Used to Wipe-off the Database"

task :clear_db => :environment do
	User.delete_all
	Client.delete_all
	Project.delete_all
	Task.delete_all
	Category.delete_all
	ProjectCategory.delete_all
end