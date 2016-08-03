class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :countries, :name, :country
    rename_column :locations, :name, :location
  end
end
