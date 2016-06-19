class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :name
      t.date :start_date

      t.timestamps null: false
    end
  end
end
