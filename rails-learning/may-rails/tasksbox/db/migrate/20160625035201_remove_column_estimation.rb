class RemoveColumnEstimation < ActiveRecord::Migration
  def change
      remove_column :projects, :estimation
  end
end
