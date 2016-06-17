class CreateCourseRatings < ActiveRecord::Migration
  def change
    create_table :course_ratings do |t|
      t.integer :course_id
      t.float :rating

      t.timestamps null: false
    end
  end
end
