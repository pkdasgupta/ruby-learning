class CreateCourses < ActiveRecord::Migration
  def change
    #drop_table :courses
    create_table :courses do |t|
      t.string :name
      t.integer :instructor_id
      t.text :desc

      t.timestamps null: false
    end
  end
end
