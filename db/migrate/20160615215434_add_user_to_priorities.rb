class AddUserToPriorities < ActiveRecord::Migration
  def change
    add_reference :priorities, :user, index: true, foreign_key: true
  end
end
