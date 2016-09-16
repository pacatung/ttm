class CreateTableCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
    	t.string :name
    	t.integer :post_id
    	t.integer :priority
    	
      t.timestamps null: false
    end
  end
end