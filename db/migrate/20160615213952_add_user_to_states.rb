class AddUserToStates < ActiveRecord::Migration
  def change
    add_reference :states, :user, index: true, foreign_key: true
  end
end
