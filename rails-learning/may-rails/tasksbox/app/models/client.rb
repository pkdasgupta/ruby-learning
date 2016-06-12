class Client < ActiveRecord::Base
    has_many :projects

    validates_presence_of :name, :email, :mobile
    validates_numericality_of :mobile
    validates_length_of :mobile, is: 10
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    #OtherWay
    #validates :name, :email, :mobile, presence: true

    def new_projects
        Project.where('client_id = ? and status = ?', self.id, "new")
    end

end
