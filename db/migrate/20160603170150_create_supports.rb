class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.string :title
      t.text :description
      t.integer :sub_categories_id

      t.timestamps null: false
    end
  end
end
