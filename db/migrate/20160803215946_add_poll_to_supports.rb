class AddPollToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :poll, :integer
  end
end
