class AddColumnToLocation < ActiveRecord::Migration
  def change
  	add_column :locations, :lat, :double
  	add_column :locations, :lng, :double
  end
end
