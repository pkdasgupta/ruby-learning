class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :title
      t.date :due_date
      t.boolean :is_completed

      t.timestamps null: false
    end
  end
end
