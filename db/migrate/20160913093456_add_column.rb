class AddColumn < ActiveRecord::Migration
  def change
  	add_column :countries, :post_id, :integer
  	add_column :countries, :priority, :integer

  	add_column :locations, :post_id, :integer
  	add_column :locations, :priority, :integer
  end
end
