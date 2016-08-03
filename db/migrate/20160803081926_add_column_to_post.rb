class AddColumnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :return_date, :date
    rename_column :posts, :trip_date, :start_date
  end
end