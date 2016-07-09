class Client < ActiveRecord::Base
    belongs_to :user
    has_many :projects 
    #has_many :projects dependent: :nullify/:destroy

    validates_presence_of :name, :email, :mobile
    validates_numericality_of :mobile
    validates_length_of :mobile, is: 10
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    #OtherWay
    #validates :name, :email, :mobile, presence: true

    def new_projects
        Project.where('client_id = ? and status = ?', self.id, "new")
    end

    def new_and_ongoing_projects
        self.projects.where('status != ?', "completed").order('start_date')
    end

    def completed_projects
        self.projects.where('status = ?', "completed").order('end_date DESC')
    end

    def name_company
        "#{name} - #{company}"
    end


 #   def to_param
 #       "#{name}"
 #   end

end
