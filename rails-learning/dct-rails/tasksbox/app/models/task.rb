class Task < ActiveRecord::Base
    belongs_to :project
    def to_param
        "#{id}-#{name}"
    end
end
