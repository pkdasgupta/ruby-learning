class ChangeBudgetType < ActiveRecord::Migration
  def change
      #change_column :table_name, :column_name, :column_type
      change_column :projects, :budget, :float
  end
end
