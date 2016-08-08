class AddStateToSupports < ActiveRecord::Migration
  def change
    add_reference :supports, :state, index: true, foreign_key: true
  end
end
