class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :instructor_id
      t.string :title
      t.string :link

      t.timestamps null: false
    end
  end
end
