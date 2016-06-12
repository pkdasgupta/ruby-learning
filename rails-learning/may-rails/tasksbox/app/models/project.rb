class Project < ActiveRecord::Base
    belongs_to :client
    has_many :tasks
    
    def details
        "#{name} : #{status} : #{start_date}"
    end

    def self.new_projects
        Project.where('status = ?',"new")
    end

    def self.search(client, status)
        Project.where('client_id = ? AND status = ?', client, status)
    end

    def completed_tasks
        self.tasks.where('is_completed = ?', true)
    end

    def incomplete_tasks
        #self is optional
        tasks.where('is_completed = ?', false)
    end

end
