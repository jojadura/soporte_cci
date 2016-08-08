class AddDatePendingToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :date_pending, :datetime
  end
end
