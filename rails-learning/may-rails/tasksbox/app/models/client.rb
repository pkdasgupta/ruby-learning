class Client < ActiveRecord::Base
    has_many :projects

    def new_projects
        Project.where('client_id = ? and status = ?', self.id, "new")
    end

end
