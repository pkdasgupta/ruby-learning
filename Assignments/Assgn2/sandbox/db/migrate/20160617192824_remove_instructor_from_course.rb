class RemoveInstructorFromCourse < ActiveRecord::Migration
  def change
      remove_column :courses, :instructor, :string
  end
end
