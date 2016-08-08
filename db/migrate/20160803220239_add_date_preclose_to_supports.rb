class AddDatePrecloseToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :date_preclose, :datetime
  end
end
