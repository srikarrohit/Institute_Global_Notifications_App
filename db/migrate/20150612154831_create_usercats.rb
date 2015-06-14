class CreateUsercats < ActiveRecord::Migration
  def change
    create_table :usercats do |t|
      t.references :user, index: true
      t.text :categories
			t.text :notifids
	
      t.timestamps null: false
    end
  #  add_foreign_key :usercats, :users
  end
end
