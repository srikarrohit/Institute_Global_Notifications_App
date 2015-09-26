class CreateSubcats < ActiveRecord::Migration
  def change
    create_table :subcats do |t|
      t.string :name
      t.integer :cat_id

      t.timestamps null: false
    end
  end
end
