class Project < ActiveRecord::Base
    belongs_to :client
    has_many :tasks

    #has_many :join_table_name
    #has_many :associated_table, through: :join_table_name

    has_many :project_categories
    has_many :categories, through: :project_categories

    before_create :generate_project_code
    before_destroy :delete_all_tasks
    #before_save :generate_project_code

    # colon (:) is used When :
    #   - used before when used as an argument to a Method
    #   - used after for an option of a method
    #   - used before when used as an argument for an option

    validates_presence_of :name, :client_id, :start_date, :end_date
    validates_length_of :name, minimum: 5
    validates_length_of :description, within: 10..100
    validates_uniqueness_of :name, scope: :client_id

    validate :check_valid_date, :check_status

    def details
        "#{name} : #{status} : #{start_date.strftime("%A, %d %B %Y") if !start_date.nil? } : #{end_date.strftime("%A, %d %B %Y") if !end_date.nil?}"
    end:

    def generate_project_code
        self.code = "#{self.client.company[0...3]}-#{Project.last.id}"
    end

    def delete_all_tasks
        Task.where('project_id = ?', self.id).delete_all_tasks
    end

    def self.new_projects
        Project.where('status = ?',"new")
    end

    def self.completed_projects
        Project.where('status = ?',"completed")
    end

    def self.new_ongoing_projects
        Project.where('status != ?',"completed")
    end

    def self.search(client, status)
        Project.where('client_id = ? AND status = ?', client, status)
    end

    def overdue_tasks
        self.tasks.where('is_completed = ? and due_date < ?', false, Date.today)
    end

    def completed_tasks
        self.tasks.where('is_completed = ?', true)
    end

    def incomplete_tasks
        #self is optional
        tasks.where('is_completed = ? and due_date > ?', false, Date.today)
    end

    private
    def check_valid_date
        if self.end_date && self.start_date
            if self.end_date < self.start_date
                errors.add(:end_date, "Should NOT be earlier than Start Date")
            end
        end
    end

    def check_status
        if self.start_date > Date.today
            errors.add(:status, "Status can NOT be complete for Start Date later than Today")
        end
    end

end
