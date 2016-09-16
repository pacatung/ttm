class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :countries, :country, :name
  	rename_column :locations, :location, :name
  end
end
