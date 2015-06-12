class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
			t.text :title
      t.references :user, index: true
			t.references :notification, index:true
			t.references :cat, index:true

      t.timestamps null: false
    end
		add_index :posts, [:user_id, :created_at]
  end
end
