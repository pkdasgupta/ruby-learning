class Project < ActiveRecord::Base
    belongs_to :client
    has_many :tasks

    #has_many :join_table_name
    #has_many :associated_table, through: :join_table_name

    has_many :project_categories
    has_many :categories, through: :project_categories

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
