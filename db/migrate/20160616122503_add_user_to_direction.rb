class AddUserToDirection < ActiveRecord::Migration
  def change
    add_reference :directions, :user, index: true, foreign_key: true
  end
end
