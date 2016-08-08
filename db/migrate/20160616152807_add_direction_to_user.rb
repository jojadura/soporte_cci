class AddDirectionToUser < ActiveRecord::Migration
  def change
    add_reference :users, :direction, index: true, foreign_key: true
  end
end
