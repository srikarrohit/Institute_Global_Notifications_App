class CreateUsercats < ActiveRecord::Migration
  def change
    create_table :usercats do |t|
      t.references :user, index: true
      t.boolean :cat1
      t.boolean :cat2
      t.boolean :cat3
      t.boolean :cat4
      t.boolean :cat5

      t.timestamps null: false
    end
  #  add_foreign_key :usercats, :users
  end
end
