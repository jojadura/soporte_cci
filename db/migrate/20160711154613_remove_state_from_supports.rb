class RemoveStateFromSupports < ActiveRecord::Migration
  def change
    remove_column :supports, :state, :boolean
  end
end
