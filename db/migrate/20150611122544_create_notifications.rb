class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :post, index: true
      t.references :user, index: true
			t.references :cat, index: true
			t.text :message
#			t.boolean :checked, default: false
#			t.integer :notifreceiver	
	
      t.timestamps null: false
    end
#    add_foreign_key :notifications, :posts
#    add_foreign_key :notifications, :users
  end
end
