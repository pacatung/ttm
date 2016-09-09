class AddColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :about_user, :string
  end
end
