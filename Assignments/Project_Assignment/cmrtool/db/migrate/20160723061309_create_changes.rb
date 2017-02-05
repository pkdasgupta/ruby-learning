class CreateChanges < ActiveRecord::Migration[5.0]
  def change
    create_table :changes do |t|
      t.string :title
      t.string :jira
      t.text :purpose
      t.datetime :start_time
      t.float :lead_time
      t.text :target
      t.string :pic
      t.text :service_impact
      t.text :delay_cause
      t.string :result
      t.text :rollback_cause

      t.timestamps
    end
  end
end
