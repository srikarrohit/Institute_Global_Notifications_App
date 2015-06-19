class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
			t.text :category	
			t.text :image
		
      t.timestamps null: false
    end
  end
end
