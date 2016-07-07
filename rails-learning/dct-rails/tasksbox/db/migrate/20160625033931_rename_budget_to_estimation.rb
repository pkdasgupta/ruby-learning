class RenameBudgetToEstimation < ActiveRecord::Migration
  def change
      rename_column :projects, :budget, :estimation
      #change_column :projects, :estimation, :integer
  end
end
